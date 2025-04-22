<?php
    include "config.php";

    header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");

    $postjson = json_decode(file_get_contents('php://input'), true);
    $data = array();

    switch($postjson['task']) {
        case "delete_entry":
            $userid = $postjson['userid'];
            $gameid = $postjson['gameid'];
            $query = mysqli_query($mysqli, "DELETE FROM usersgames WHERE userid='$userid' AND gameid='$gameid'");

            break;
        case "get_game_info_for_update":
            $userid = $postjson['userid'];
            $gameid = $postjson['gameid'];
            $query = mysqli_fetch_array(mysqli_query($mysqli, "SELECT games.title, usersgames.status, usersgames.score, usersgames.installed FROM usersgames INNER JOIN games ON usersgames.gameid=games.idgame WHERE usersgames.userid='$userid' AND usersgames.gameid='$gameid'"));

            $data = array(
                'title' => $query['title'],
                'status' => $query['status'],
                'score' => $query['score'],
                'installed' => $query['installed']
            );

            break;
        case "update_game_info":
            $userid = $postjson['userid'];
            $gameid = $postjson['gameid'];
            $status = $postjson['status'];
            $score = $postjson['score'];
            $installed = $postjson['installed'];
            $query = mysqli_query($mysqli, "UPDATE usersgames SET status='$status', score='$score', installed='$installed' WHERE userid='$userid' AND gameid='$gameid'");

            break;
        case "load_games_left":
            $userid = $postjson['userid'];
            $data = array();
            $query = mysqli_query($mysqli, "SELECT games.idgame, games.title FROM games WHERE NOT EXISTS (SELECT * FROM usersgames WHERE usersgames.gameid=games.idgame AND usersgames.userid='$userid') ORDER BY games.title ASC");

            while($rows = mysqli_fetch_array($query)){
                $data[] = array(
                    'idgame' => $rows['idgame'],
                    'title' => $rows['title']
                );
            }

            break;
        case "add_game":
            $userid = $postjson['userid'];
            $gameid = $postjson['gameid'];
            $status = $postjson['status'];
            $score = $postjson['score'];
            $installed = $postjson['installed'];
            $query = mysqli_query($mysqli, "INSERT INTO `usersgames` (`userid`, `gameid`, `status`, `score`, `installed`) VALUES ('$userid', '$gameid', '$status', '$score', '$installed')");

            break;
    }

    if ($query) {
        $result = json_encode(array('success'=>true, 'result'=>$data));
    }else{
        $result = json_encode(array('success'=>false));
    }

    echo $result;
?>