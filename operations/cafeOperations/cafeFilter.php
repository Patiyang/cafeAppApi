<?php
// required headers
header("Access-Control-Allow-Origin: *");
// header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json; charset=UTF-8");

include_once '../../config/database.php';
include_once '../../objects/cafe.php';

$database = new CafeDB();
$db = $database->getConnection();

$cafeOwner = new CafeOwner($db);

$data = json_decode(file_get_contents("php://input"));
$cafeOwner->cafe_filter = $data->query;
$stmt = $cafeOwner->readFilter();
$num = $stmt->rowCount();

// check if more than 0 record found
if ($num > 0) {

    $details_arr = array();
    $details_arr["users"] = array();

    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        extract($row);
        $details_item = array(
            "cafeid" => $cafe_id,
            "names" => $owner_name,
            "password"=> $owner_pass,
            "emailAddress" => $owner_email,
            "mobilePhone" => $owner_mob,
            "payment"=>$owner_upi,
            "location"=>$location,
            "cafe_cost"=>$cafe_cost,
            "description"=>$description,
            "service_area"=>$service_area,
            "facilities"=>$facilities,
            "primary_image"=>$primary_image,
            "secondary"=>$primary_image,
            "status"=>$status,
            "latitude"=>$latitude,
            "longitude"=>$longitude,
            "cuisine"=>$cuisine
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
  

