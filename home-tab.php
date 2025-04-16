<?php
    include "config.php";

    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Credentials: true');
    header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS');
    header('Access-Control-Allow-Headers: Origin, Content-Type, Authorization, Accept, X-Requested-With, x-xsrf-token');
    header('Content-Type: application/json: charset-utf-8');

    $postjson = json_decode(file_get_contents('php://input'), true);
?>