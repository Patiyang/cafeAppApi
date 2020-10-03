<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// include database and object files
include_once '../../config/database.php';
include_once '../../objects/users.php';

// get database connection
$database = new CafeDb();
$db = $database->getConnection();
$user = new Users($db);

$data = json_decode(file_get_contents("php://input"));
$user->user_mobile = $data->phone;

// set product property values
$user->user_name = $data->name;
$user->user_address = $data->address;
$user->user_about = $data->about;
$user->user_email = $data->email;

// update the product
if ($user->update()) {
    http_response_code(200);
    echo json_encode(array("message" => "Product was updated."));
}
else {
    http_response_code(503);
    echo json_encode(array("message" => "Unable to update user."));
}
