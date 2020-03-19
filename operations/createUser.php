<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
// get database connection
include_once '../config/database.php';
include_once '../objects/users.php';

$database = new WalgotechDB();
$db = $database->getConnection();

$user = new Users($db);
// get posted data
$userData = json_decode(file_get_contents("php://input"));

$user->userName = $userData->userName;
$user->password = $userData->password;
$user->firstName = $userData->firstName;
$user->lastName = $userData->lastName;
$user->phoneNumber = $userData->phoneNumber;
if (
    !empty($user->userName) && 
    !empty($user->password) && 
    !empty($user->phoneNumber) && 
    !empty($user->firstName) && 
    !empty($user->lastName) && $user->create()
) {
    http_response_code(200);
    echo json_encode(array("message" => "User was created."));
} else {
    http_response_code(400);
    echo json_encode(array("message" => "Unable to create user. Incomplete data"));
}
?>