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
$database = new WalgotechDB();
$db = $database->getConnection();
$single_details = new Users($db);
  
$single_details->id = isset($_GET['id']) ? $_GET['id'] : die();
  
$single_details->readOne();
  
if($single_details->id!=null){
    $single_details_arr = array(
        "id" =>  $single_details->id,
        "userName" => $single_details->userName,
        "password" => $single_details->password,
        "firstName" => $single_details->firstName,
        "lastName" => $single_details->lastName,
    );
    http_response_code(200);
    echo json_encode($single_details_arr);
}
  
else{
    http_response_code(404);
    echo json_encode(array("message" => "user does not exist."));
}
?>