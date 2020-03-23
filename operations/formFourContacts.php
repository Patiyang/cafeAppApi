<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include_once '../config/database.php';
include_once '../objects/contacts.php';

$database = new IreneDB();
$db = $database->getConnection();

$contacts = new RegisterdContacts($db);

$stmt = $contacts->readFormFour();
$num = $stmt->rowCount();

if ($num > 0) {
    $contacts_array = array();
    $contacts_array["contacts"] = array();

    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        extract($row);
        $contacts_item = array(
            "CURRENT_FORM" => $CURRENT_FORM,
            "FATHERS PHONE" => $FATHERS_PHONE,
            "motherphone" => $motherphone,
            "guardianphone" => $guardianphone,
        );
        array_push($contacts_array['contacts'], $contacts_item);
    }
    http_response_code(200);
    echo json_encode($contacts_array);
} else {
    http_response_code(404);
    echo json_encode(array("message" => "no user found."));
}
