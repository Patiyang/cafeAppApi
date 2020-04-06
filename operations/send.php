<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

$data = json_decode(file_get_contents('php://input'), true);
$phone = $data['phone'];
$message = $data['message'];
// $apiKey = $data['apiKey']; //changed
// $username = $data['username']; //changed
// $phone="+254723942008";
// $message="Hello";
$response['success'] = false;
require_once('AfricasTalkingGateway.php');
$username   = "mgpatto";
$apiKey     = "0e33d3656655659ffcde61e3b34b215f930a9905d3548d897b4504b2b679c1a5";

$recipients = $phone;
$message    = $message;
$gateway    = new AfricasTalkingGateway($username, $apiKey);
try {
  $results = $gateway->sendMessage($recipients, $message);

  foreach ($results as $result) {
  }

  http_response_code(200);
  echo json_encode(array("message" => "Sent"));
} catch (AfricasTalkingGatewayException $e) {
  http_response_code(400);
  echo json_encode(array("message" => "Failed " . $e->getMessage()));
}
