<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include_once '../../config/database.php';
include_once '../../objects/users.php';

$database = new CafeDB();
$db = $database->getConnection();

$details = new Users($db);
$details->user_id = isset($_GET['user_id']) ? $_GET['user_id'] : die();
// query users
$stmt = $details->readFavorites();
$num = $stmt->rowCount();

// check if more than 0 record found
if ($num > 0) {

    $details_arr = array();
    $details_arr["favorites"] = array();

    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        extract($row);
        $details_item = array(
            "id"=>$id,
            "name" => $name,
            "description" => $description,
            "userId"=> $user_id,
            "favorite"=> $favorite,
        );

        array_push($details_arr['favorites'], $details_item);
    }

    http_response_code(200);
    echo json_encode($details_arr);
} else {
    http_response_code(404);
    echo json_encode(
        array("message" => "No Favorites found.")
    );
}
  

