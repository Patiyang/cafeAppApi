<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../config/database.php';
include_once '../objects/messages.php';

$database = new SchoolDB;
$db = $database->getConnection();

$message = new Messages($db);
$messageData = json_decode(file_get_contents("php://input"));

$message->userName = $messageData->userName;
$message->message = $messageData->message;
$message->recipent = $messageData->recipent;
$message->time = $messageData->time;

if (
    !empty($message->userName) &&
    !empty($message->message) &&
    !empty($message->recipent) &&
    !empty($message->time) && $message->create()
) {
    http_response_code(200);
    echo json_encode(array("message" => "Message was created."));
} else {
    http_response_code(400);
    echo json_encode(array("message" => "Unable to create message. Incomplete data"));
}
