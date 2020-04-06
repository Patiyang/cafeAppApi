<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include_once '../config/database.php';
include_once '../objects/messages.php';

$database = new SchoolDB();
$db = $database->getConnection();

$messages = new Messages($db);

$stmt = $messages->readMessages();
$num = $stmt->rowCount();

if ($num > 0) {
    $messages_array = array();
    $messages_array["messages"] = array();

    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        extract($row);
        $messages_item = array(
            "userName" => $userName,
            "message" => $message,
            "recipent" => $recipent,
            "time" => $time
        );
        array_push($messages_array['messages'], $messages_item);
    }
    http_response_code(200);
    echo json_encode($messages_array);
} else {
    http_response_code(404);
    echo json_encode(array("message" => "no messages found."));
}
