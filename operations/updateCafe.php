<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/users.php';
 
// db connection
$database = new CafeDb();
$db = $database->getConnection();
$user = new Users($db);

//handle json data
$data = json_decode(file_get_contents("php://input"));
$user->owner_email = $data->email;
 
// set user property values RHS
$user->owner_name = $data->name;
$user->owner_email = $data->email;
$user->owner_mob = $data->phone;
$user->owner_upi = $data->upi;

if($user->update()){
     http_response_code(200);
    echo json_encode(array("message" => "User was updated."));
}
 
else{
 
    http_response_code(503);
    echo json_encode(array("message" => "Unable to update user."));
}
