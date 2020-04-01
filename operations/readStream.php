<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include_once '../config/database.php';
include_once '../objects/classes.php';

$database = new SchoolDB();
$db = $database->getConnection();

$streams = new Streams($db);

$stmt = $streams->readTeachers();
$num = $stmt->rowCount();

if ($num > 0) {
    $streams_array = array();
    $streams_array["streams"] = array();

    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        extract($row);
        $streams_item = array(
            "streamName" =>$class." ".$stream,
        );
        array_push($streams_array['streams'], $streams_item);
    }
    http_response_code(200);
    echo json_encode($streams_array);
} else {
    http_response_code(404);
    echo json_encode(array("message" => "no streams found."));
}
