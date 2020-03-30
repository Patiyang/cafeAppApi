<?php 
$phone=$_POST['phone'];
$message=$_POST['message'];
// $phone="+254703445254,+254792028744";
// $message="Hello";
$response['success'] = false;
    require_once('AfricasTalkingGateway.php');
    $username   = "AKITHIGIRLS";
    $apikey     = "ac5a9bc4da85f5f8a8c1461528b95a9f95d82aad17a68edd1dc9c158bcbe2187";
    $recipients = $phone;
    $message    = $message;
    $gateway    = new AfricasTalkingGateway($username, $apikey);
    try 
    { 
      $results = $gateway->sendMessage($recipients, $message,"AKITHIGIRLS");
                
      foreach($results as $result) {
       
      }
      $response['success'] = true;
      echo json_encode($response);
    }
    catch ( AfricasTalkingGatewayException $e )
    {
      $response['success'] = false;
      echo json_encode($response);
    }

                

               

?>