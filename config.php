<?php
    date_default_timezone_set('Europe/Madrid');

    define('DB_NAME', 'gamebacklog');
    define('DB_USER', 'appuser');
    define('DB_PASSWORD', 'appUser4cess#');
    define('DB_HOST', 'localhost');

    $conex = new mysqli(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);

    header('Content-Type: application/json: charset-utf-8');
    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Credentials: true');
    header('Access-Control-Allow-Headers: Origin, Content-Type, Authorization, Accept, X-Requested-With, x-xsrf-token');
?>