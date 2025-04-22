<?php
    include "config.php";

    header("Access-Control-Allow-Methods: GET, POST, PUT");

    $postjson = json_decode(file_get_contents('php://input'), true);

    switch ($postjson['task']) {
        case "signup":
            $email = $postjson['email'];
            $username = $postjson['username'];
            $password = password_hash($postjson['password'], PASSWORD_DEFAULT);
            $first_name = $postjson['first_name'];
            $birthdate = $postjson['birthdate'];
            $last_name = $postjson['last_name'];

            $insert = mysqli_query($mysqli, "INSERT INTO users (email, username, password, first_name, birthdate, last_name) VALUES ('$email', '$username', '$password', '$first_name', '$birthdate', '$last_name')");

            if($insert){
                $result = json_encode(array('success'=>true, 'msg'=>'Register Successfully'));
            } else {
                $result = json_encode(array('success'=>false, 'msg'=>'Register Failed'));
            }

            break;
        case "login":
            $logindata = mysqli_fetch_array(mysqli_query($mysqli, "SELECT * FROM users WHERE email='$postjson[email]'"));

            if ($logindata) {
                if (password_verify($postjson['password'], $logindata['password'])) { // revisar el nombre en la BBDD
                    $data = array(
                        'iduser' => $logindata['iduser'],
                        'email' => $logindata['email'],
                        'username' => $logindata['username'],
                        'first_name' => $logindata['first_name'],
                        'birthdate' => $logindata['birthdate'],
                        'profilepicture' => $logindata['profilepicture'],
                        'registrationdate' => $logindata['registrationdate'],
                        'last_name' => $logindata['last_name']
                    );

                    $result = json_encode(array('success'=>true, 'result'=>$data));
                }
            } else {
                $result = json_encode(array('success'=>false));
            }

            break;
    }

    echo $result;
?>