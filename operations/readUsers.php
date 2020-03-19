<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include_once '../config/database.php';
include_once '../objects/users.php';

$database = new WalgotechDB();
$db = $database->getConnection();

$details = new Users($db);

// query users
$stmt = $details->read();
$num = $stmt->rowCount();

// check if more than 0 record found
if ($num > 0) {

    $details_arr = array();
    $details_arr["users"] = array();
// table data
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        extract($row);

        $details_item = array(
            "id" => $id,
            "userName" => $userName,
            "password"=> $password,
            "firstName" => $firstName,
            "lastName" => $lastName,
            "phoneNumber"=>$phoneNumber
        );

        array_push($details_arr['users'], $details_item);
    }

    http_response_code(200);
    echo json_encode($details_arr);
} else {
    http_response_code(404);
    echo json_encode(
        array("message" => "No user found.")
    );
}
  

