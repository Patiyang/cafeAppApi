<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include_once '../config/database.php';
include_once '../objects/classes.php';

$database = new SchoolDB();
$db = $database->getConnection();

$classes = new Classes($db);

$stmt = $classes->readTeachers();
$num = $stmt->rowCount();

if ($num > 0) {
    $streams_array = array();
    $streams_array["classes"] = array();

    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        extract($row);
        $streams_item = array(
            "className" => $class,
            "no"=>$no
        );
        array_push($streams_array['classes'], $streams_item);
    }
    http_response_code(200);
    echo json_encode($streams_array);
} else {
    http_response_code(404);
    echo json_encode(array("message" => "no classes found."));
}
