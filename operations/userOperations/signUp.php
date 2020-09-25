<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
// get database connection
include_once '../../config/database.php';
include_once '../../objects/users.php';

$database = new CafeDB();
$db = $database->getConnection();
$user = new Users($db);
$userData = json_decode(file_get_contents("php://input"));

//gets the json data and logs in a user if they are available in database
if (
    // !empty($userData->userName) 
    !empty($userData->email)&&
    !empty($userData->password)
    // !empty($userData->phone) &&
    
) {
    // $user->user_name = $userData->userName;
    $user->password = $userData->password;
    $user->user_email = $userData->email;
    // $user->user_mobile = $userData->phone;
    // $user->user_address = $userData->address;
    $user->user_img = "";
    // $user->user_addon = "";
    $user->user_status = "0";

    if ($user->create()) {
        http_response_code(201);
        echo json_encode(array("message" => "User was created."));
    } else {
        http_response_code(503);
        echo json_encode(array("message" => "User already exists"));
    }
} else {
    http_response_code(400);
    echo json_encode(array("message" => "Unable to create user. Incomplete data"));
}
