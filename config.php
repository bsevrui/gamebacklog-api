<?php
    date_default_timezone_set('Europe/Madrid');

    define('DB_NAME', 'gamebacklog');
    define('DB_USER', 'appuser');
    define('DB_PASSWORD', 'appUser4cess#');
    define('DB_HOST', 'localhost');

    $conex = new mysqli(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
?>