<?php
    include "config.php";

    header('Access-Control-Allow-Methods: GET');

    $postjson = json_decode(file_get_contents('php://input'), true);
    $data = array();

    switch ($postjson['task']) {
        case "get_games":
            $query = mysqli_query($mysqli, "SELECT games.idgame, games.title, games.cover, games.type, ROUND(AVG(usersgames.score), 2) AS averagescore FROM `games` LEFT JOIN usersgames ON games.idgame=usersgames.gameid GROUP BY games.title ORDER BY games.title ASC LIMIT $postjson[start],$postjson[limit]");

            while($rows = mysqli_fetch_array($query)){
                $data[] = array(
                    'idgame' => $rows['idgame'],
                    'title' => $rows['title'],
                    'cover' => $rows['cover'],
                    'type' => $rows['type'],
                    'averagescore' => $rows['averagescore']
                );
            }

            break;
        case "get_game_info":
            $gameid = $postjson['id'];
            $gamedata = mysqli_fetch_array(mysqli_query($mysqli, "SELECT games.title, games.cover, games.synopsis, games.type, ROUND(AVG(usersgames.score), 2) AS averagescore, (SELECT (COUNT(usersgames.gameid)) FROM usersgames WHERE usersgames.gameid='$gameid') AS popularity, (SELECT platformsgames.releasedate FROM platformsgames WHERE (platformsgames.platformid=2) AND (platformsgames.gameId='$gameid')) AS windowsrelease, (SELECT platformsgames.releasedate FROM platformsgames WHERE (platformsgames.platformid=7) AND (platformsgames.gameId='$gameid')) AS macrelease, (SELECT platformsgames.releasedate FROM platformsgames WHERE (platformsgames.platformid=1) AND (platformsgames.gameId='$gameid')) AS ps4release, (SELECT platformsgames.releasedate FROM platformsgames WHERE (platformsgames.platformid=5) AND (platformsgames.gameId='$gameid')) AS switchrelease, (SELECT platformsgames.releasedate FROM platformsgames WHERE (platformsgames.platformid=3) AND (platformsgames.gameId='$gameid')) AS xboxonerelease, (SELECT platformsgames.releasedate FROM platformsgames WHERE (platformsgames.platformid=10) AND (platformsgames.gameId='$gameid')) AS wiiurelease, (SELECT platformsgames.releasedate FROM platformsgames WHERE (platformsgames.platformid=4) AND (platformsgames.gameId='$gameid')) AS tresdsrelease, (SELECT platformsgames.releasedate FROM platformsgames WHERE (platformsgames.platformid=15) AND (platformsgames.gameId='$gameid')) AS vitarelease, (SELECT platformsgames.releasedate FROM platformsgames WHERE (platformsgames.platformid=9) AND (platformsgames.gameId='$gameid')) AS wiirelease, (SELECT platformsgames.releasedate FROM platformsgames WHERE (platformsgames.platformid=16) AND (platformsgames.gameId='$gameid')) AS xbox360release, (SELECT platformsgames.releasedate FROM platformsgames WHERE (platformsgames.platformid=14) AND (platformsgames.gameId='$gameid')) AS ps3release, (SELECT platformsgames.releasedate FROM platformsgames WHERE (platformsgames.platformid=6) AND (platformsgames.gameId='$gameid')) AS dsrelease, (SELECT platformsgames.releasedate FROM platformsgames WHERE (platformsgames.platformid=8) AND (platformsgames.gameId='$gameid')) AS psprelease, (SELECT platformsgames.releasedate FROM platformsgames WHERE (platformsgames.platformid=11) AND (platformsgames.gameId='$gameid')) AS gamecuberelease, (SELECT platformsgames.releasedate FROM platformsgames WHERE (platformsgames.platformid=13) AND (platformsgames.gameId='$gameid')) AS iosrelease, (SELECT platformsgames.releasedate FROM platformsgames WHERE (platformsgames.platformid=12) AND (platformsgames.gameId='$gameid')) AS androidrelease FROM ((`games` INNER JOIN usersgames ON games.idgame=usersgames.gameid) INNER JOIN platformsgames ON games.idgame=platformsgames.gameId) WHERE games.idgame='$gameid'"));

            $data = array(
                'title' => $gamedata['title'],
                'cover' => $gamedata['cover'],
                'synopsis' => $gamedata['synopsis'],
                'type' => $gamedata['type'],
                'averagescore' => $gamedata['averagescore'],
                'popularity' => $gamedata['popularity'],
                'ps4release' => $gamedata['ps4release'],
                'windowsrelease' => $gamedata['windowsrelease'],
                'xboxonerelease' => $gamedata['xboxonerelease'],
                'tresdsrelease' => $gamedata['tresdsrelease'],
                'switchrelease' => $gamedata['switchrelease'],
                'dsrelease' => $gamedata['dsrelease'],
                'macrelease' => $gamedata['macrelease'],
                'psprelease' => $gamedata['psprelease'],
                'wiirelease' => $gamedata['wiirelease'],
                'wiiurelease' => $gamedata['wiiurelease'],
                'gamecuberelease' => $gamedata['gamecuberelease'],
                'androidrelease' => $gamedata['androidrelease'],
                'iosrelease' => $gamedata['iosrelease'],
                'ps3release' => $gamedata['ps3release'],
                'vitarelease' => $gamedata['vitarelease'],
                'xbox360release' => $gamedata['xbox360release']
            );

            break;
        case "get_platforms":
            $query = mysqli_query($mysqli, "SELECT * FROM `platforms` ORDER BY `nameplatform` ASC LIMIT $postjson[start],$postjson[limit]");

            while($rows = mysqli_fetch_array($query)){
                $data[] = array(
                    'idplatform' => $rows['idplatform'],
                    'nameplatform' => $rows['nameplatform'],
                    'detail' => $rows['detail'],
                    'platformrelease' => $rows['platformrelease'],
                    'platformpicture' => $rows['platformpicture']
                );
            }

            break;
        case "get_by_platform":
            $platformid = $postjson['id'];
            $query = mysqli_query($mysqli, "SELECT games.idgame, games.title, games.cover, games.type, platformsgames.releasedate FROM games INNER JOIN platformsgames ON games.idgame=platformsgames.gameId WHERE platformsgames.platformid='$platformid' ORDER BY games.title ASC LIMIT $postjson[start],$postjson[limit]");

            while($rows = mysqli_fetch_array($query)){
                $data[] = array(
                    'idgame' => $rows['idgame'],
                    'title' => $rows['title'],
                    'cover' => $rows['cover'],
                    'type' => $rows['type'],
                    'releasedate' => $rows['releasedate']
                );
            }

            break;
        case "get_genres":
            $query = mysqli_query($mysqli, "SELECT * FROM `genres` ORDER BY `genre` ASC LIMIT $postjson[start],$postjson[limit]");

            while($rows = mysqli_fetch_array($query)){
                $data[] = array(
                    'idgenre' => $rows['idgenre'],
                    'genre' => $rows['genre'],
                    'descriptiongenre' => $rows['descriptiongenre']
                );
            }

            break;
        case "get_by_genre":
            $genreid = $postjson['id'];
            $query = mysqli_query($mysqli, "SELECT games.idgame, games.title, games.cover, games.type FROM games INNER JOIN gamegenres ON games.idgame=gamegenres.Gameid WHERE gamegenres.genreid='$genreid' ORDER BY games.title ASC LIMIT $postjson[start],$postjson[limit]");

            while($rows = mysqli_fetch_array($query)){
                $data[] = array(
                    'idgame' => $rows['idgame'],
                    'title' => $rows['title'],
                    'cover' => $rows['cover'],
                    'type' => $rows['type']
                );
            }

            break;
    }

    if ($query || $gamedata) {
        $result = json_encode(array('success'=>true, 'result'=>$data));
    } else {
        $result = json_encode(array('success'=>false));
    }

    echo $result;
?>