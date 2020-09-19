<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
// get database connection
include_once '../config/database.php';
include_once '../objects/users.php';

$database = new CafeDB();
$db = $database->getConnection();
$user = new Users($db);
$userData = json_decode(file_get_contents("php://input"));


if (
    !empty($userData->owner_name) &&
    !empty($userData->owner_pass) &&
    !empty($userData->owner_mob) &&
    !empty($userData->owner_email)
) {
    $user->firstName = $userData->owner_name;
    $user->password = $userData->owner_pass;
    $user->email = $userData->owner_email;
    $user->phoneNumber = $userData->owner_mob;

    if ($user->create()) {
        http_response_code(200);
        echo json_encode(array("message" => "User was created."));
    } else {
        http_response_code(503);
        echo json_encode(array("message" => "error encountered while creating the user"));
    }
} else {
    http_response_code(400);
    echo json_encode(array("message" => "Unable to create user. Incomplete data"));
}
