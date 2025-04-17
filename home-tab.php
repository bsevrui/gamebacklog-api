<?php
    include "config.php";

    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Credentials: true');
    header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS');
    header('Access-Control-Allow-Headers: Origin, Content-Type, Authorization, Accept, X-Requested-With, x-xsrf-token');
    header('Content-Type: application/json: charset-utf-8');

    $postjson = json_decode(file_get_contents('php://input'), true);
    $data = array();

    switch ($postjson['task']) {
        case "get_recentlyadded":
            $query = mysqli_query($conex, "SELECT games.idgame, games.title, games.cover, games.type FROM `games` LEFT JOIN usersgames ON games.idgame=usersgames.gameid GROUP BY games.title ORDER BY `idgame` DESC LIMIT 0,15");

            while($rows = mysqli_fetch_array($query)) {
                $data[] = array(
                    'idgame' => $rows['idgame'],
                    'title' => $rows['title'],
                    'cover' => $rows['cover'],
                    'type' => $rows['type']
                );
            }

            break;
        case "get_toprated":
            $query = mysqli_query($conex, "SELECT games.idgame, games.title, games.cover, ROUND(AVG(usersgames.score), 2) AS averagescore FROM games LEFT JOIN usersgames ON games.idgame=usersgames.gameid GROUP BY games.title ORDER BY ROUND(AVG(usersgames.score), 2) DESC, games.title ASC LIMIT 0,15");

            while($rows = mysqli_fetch_array($query)) {
                $data[] = array(
                    'idgame' => $rows['idgame'],
                    'title' => $rows['title'],
                    'cover' => $rows['cover'],
                    'averagescore' => $rows['averagescore']
                );
            }

            break;
        case "get_mostpopular":
            $query = mysqli_query($conex, "SELECT games.idgame, games.title, games.cover, COUNT(usersgames.gameid) AS popularity FROM games LEFT JOIN usersgames ON games.idgame=usersgames.gameid GROUP BY games.title ORDER BY COUNT(usersgames.gameid) DESC, games.title ASC LIMIT 0,15");

            while($rows = mysqli_fetch_array($query)) {
                $data[] = array(
                    'idgame' => $rows['idgame'],
                    'title' => $rows['title'],
                    'cover' => $rows['cover'],
                    'popularity' => $rows['popularity']
                );
            }

            break;
    }

    if ($query) {
        $result = json_encode(array('success'=>true, 'result'=>$data));
    } else {
        $result = json_encode(array('success'=>false));
    }

    echo $result;
?>