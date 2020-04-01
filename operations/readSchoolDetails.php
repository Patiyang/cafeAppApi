<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include_once '../config/database.php';
include_once '../objects/schoolDetails.php';

$database = new SchoolDB();
$db = $database->getConnection();

$details = new SchoolDetails($db);

$stmt = $details->readSchool();
$num = $stmt->rowCount();

if ($num > 0) {
    $school_array = array();
    $school_array["school"] = array();

    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        extract($row);
        $school_item = array(
            "schoolName" => $Schoolname,
            "smsKey"=>$SMSKEY,
            "smsID"=>$SMSID
        );
        array_push($school_array['school'], $school_item);
    }
    http_response_code(200);
    echo json_encode($school_array);
} else {
    http_response_code(404);
    echo json_encode(array("message" => "no details found."));
}
