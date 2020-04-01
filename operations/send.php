<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

$data = json_decode(file_get_contents('php://input'), true);
$phone = $data['phone'];
$message = $data['message'];
$apikey = $data['apiKey']; //changed
$smsId = $data['smsId']; //changed
// $phone="+254703445254,+254792028744";
// $message="Hello";
$response['success'] = false;
require_once('AfricasTalkingGateway.php');
$username   = "AKITHIGIRLS";
// $apikey     = "ac5a9bc4da85f5f8a8c1461528b95a9f95d82aad17a68edd1dc9c158bcbe2187";

$recipients = $phone;
$message    = $message;
$gateway    = new AfricasTalkingGateway($username, $apikey);
try {
  $results = $gateway->sendMessage($recipients, $message, "AKITHIGIRLS");

  foreach ($results as $result) {
  }

  http_response_code(200);
  echo json_encode(array("message" => "Sent"));
} catch (AfricasTalkingGatewayException $e) {
  http_response_code(400);
  echo json_encode(array("message" => "Failed"));
}
