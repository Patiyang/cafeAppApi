<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
// get database connection
include_once '../config/database.php';
include_once '../objects/contacts.php';

$database = new WalgotechDB();
$db = $database->getConnection();

$contacts = new Contacts($db);
// get posted data
$contact = json_decode(file_get_contents("php://input"));

$contacts->contact = $contact->contact;
if (
    !empty($contacts->contact) && 
     $contacts->createContact()
) {
    http_response_code(200);
    echo json_encode(array("message" => "Contact was created."));
} else {
    http_response_code(400);
    echo json_encode(array("message" => "Unable to create contact. Incomplete data"));
}
?>