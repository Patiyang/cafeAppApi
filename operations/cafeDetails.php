<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Credentials: true");
header('Content-Type: application/json');
  
// include database and object files
include_once '../config/database.php';
include_once '../objects/users.php';
  
// get database connection
$database = new CafeDB();
$db = $database->getConnection();
$details = new Users($db);
  
$details->cafe_id = isset($_GET['cafe_id']) ? $_GET['cafe_id'] : die();
  
$details->readOne();
  
if($details->owner_name!=null){
    $details_arr = array(
        "id" =>  $details->cafe_id,
        "userName" => $details->owner_name,
        "password" => $details->owner_pass,
        "phoneNumber" => $details->owner_mob,
        "email" => $details->owner_email,
    );
    http_response_code(200);
    echo json_encode($details_arr);
}
  
else{
    http_response_code(404);
    echo json_encode(array("message" => "user does not exist."));
}
?>