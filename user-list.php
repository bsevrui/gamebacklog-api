<?php
    include "config.php"

    header("Access-Control-Allow-Methods: GET");

    $postjson = json_decode(file_get_contents('php://input'), true);
    $userid = $postjson['id'];
    $data = array();

    switch($postjson['task']) {
        case "get_current_user_games":
            $query = mysqli_query($mysqli, "SELECT games.idgame, games.title, games.cover, usersgames.status, usersgames.score, usersgames.installed FROM usersgames INNER JOIN games ON games.idgame=usersgames.gameid WHERE userid='$userid' ORDER BY FIELD(usersgames.status,'Playing','Completed','Played','On-Hold','Plan-To-Play','Dropped'), games.title ASC LIMIT $postjson[start],$postjson[limit]");

            while($rows = mysqli_fetch_array($query)){
                $data[] = array(
                    'idgame' => $rows['idgame'],
                    'title' => $rows['title'],
                    'cover' => $rows['cover'],
                    'status' => $rows['status'],
                    'score' => $rows['score'],
                    'installed' => $rows['installed']
                );
            }

            break;
        case "get_current_user_playing_games":
            $query = mysqli_query($mysqli, "SELECT games.idgame, games.title, games.cover, games.type, usersgames.score, usersgames.installed FROM usersgames INNER JOIN games ON games.idgame=usersgames.gameid WHERE userid='$userid' AND usersgames.status='Playing' ORDER BY games.title ASC, usersgames.score DESC LIMIT $postjson[start],$postjson[limit]");

            while($rows = mysqli_fetch_array($query)){
                $data[] = array(
                    'idgame' => $rows['idgame'],
                    'title' => $rows['title'],
                    'cover' => $rows['cover'],
                    'type' => $rows['type'],
                    'score' => $rows['score'],
                    'installed' => $rows['installed']
                );
            }

            break;
        case "get_current_user_completed_games":
            $query = mysqli_query($mysqli, "SELECT games.idgame, games.title, games.cover, games.type, usersgames.score, usersgames.installed FROM usersgames INNER JOIN games ON games.idgame=usersgames.gameid WHERE userid='$userid' AND usersgames.status='Completed' ORDER BY games.title ASC, usersgames.score DESC LIMIT $postjson[start],$postjson[limit]");

            while($rows = mysqli_fetch_array($query)){
                $data[] = array(
                    'idgame' => $rows['idgame'],
                    'title' => $rows['title'],
                    'cover' => $rows['cover'],
                    'type' => $rows['type'],
                    'score' => $rows['score'],
                    'installed' => $rows['installed']
                );
            }

            break;
        case "get_current_user_played_games":
            $query = mysqli_query($mysqli, "SELECT games.idgame, games.title, games.cover, games.type, usersgames.score, usersgames.installed FROM usersgames INNER JOIN games ON games.idgame=usersgames.gameid WHERE userid='$userid' AND usersgames.status='Played' ORDER BY games.title ASC, usersgames.score DESC LIMIT $postjson[start],$postjson[limit]");

            while($rows = mysqli_fetch_array($query)){
                $data[] = array(
                    'idgame' => $rows['idgame'],
                    'title' => $rows['title'],
                    'cover' => $rows['cover'],
                    'type' => $rows['type'],
                    'score' => $rows['score'],
                    'installed' => $rows['installed']
                );
            }

            break;
        case "get_current_user_onhold_games":
            $query = mysqli_query($mysqli, "SELECT games.idgame, games.title, games.cover, games.type, usersgames.score, usersgames.installed FROM usersgames INNER JOIN games ON games.idgame=usersgames.gameid WHERE userid='$userid' AND usersgames.status='On-Hold' ORDER BY games.title ASC, usersgames.score DESC LIMIT $postjson[start],$postjson[limit]");

            while($rows = mysqli_fetch_array($query)){
                $data[] = array(
                    'idgame' => $rows['idgame'],
                    'title' => $rows['title'],
                    'cover' => $rows['cover'],
                    'type' => $rows['type'],
                    'score' => $rows['score'],
                    'installed' => $rows['installed']
                );
            }

            break;
        case "get_current_user_plantoplay_games":
            $query = mysqli_query($mysqli, "SELECT games.idgame, games.title, games.cover, games.type, usersgames.score, usersgames.installed FROM usersgames INNER JOIN games ON games.idgame=usersgames.gameid WHERE userid='$userid' AND usersgames.status='Plan-To-Play' ORDER BY games.title ASC, usersgames.score DESC LIMIT $postjson[start],$postjson[limit]");

            while($rows = mysqli_fetch_array($query)){
                $data[] = array(
                    'idgame' => $rows['idgame'],
                    'title' => $rows['title'],
                    'cover' => $rows['cover'],
                    'type' => $rows['type'],
                    'score' => $rows['score'],
                    'installed' => $rows['installed']
                );
            }

            break;
        case "get_current_user_dropped_games":
            $query = mysqli_query($mysqli, "SELECT games.idgame, games.title, games.cover, games.type, usersgames.score, usersgames.installed FROM usersgames INNER JOIN games ON games.idgame=usersgames.gameid WHERE userid='$userid' AND usersgames.status='Dropped' ORDER BY games.title ASC, usersgames.score DESC LIMIT $postjson[start],$postjson[limit]");

            while($rows = mysqli_fetch_array($query)){
                $data[] = array(
                    'idgame' => $rows['idgame'],
                    'title' => $rows['title'],
                    'cover' => $rows['cover'],
                    'type' => $rows['type'],
                    'score' => $rows['score'],
                    'installed' => $rows['installed']
                );
            }

            break;
    }

    if ($query) {
        $result = json_encode(array('success'=>true, 'result'=>$data));
    }else{
        $result = json_encode(array('success'=>false));
    }

    echo $result;
?>