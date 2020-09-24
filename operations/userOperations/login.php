<?php
header("Access-Control-Allow-Origin: http://localhost:8000/backend/");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
include_once '../../config/database.php';
include_once '../../objects/users.php';

// get database connection
$database = new CafeDB();
$db = $database->getConnection();

// instantiate user object
$user = new Users($db);

$data = json_decode(file_get_contents("php://input"));
$user->user_email = $data->email;

$userExists = $user->userExists();

// generate json web token
include_once '../../config/core.php';
include_once '../../vendor/firebase/php-jwt/src/BeforeValidException.php';
include_once '../../vendor/firebase/php-jwt/src/ExpiredException.php';
include_once '../../vendor/firebase/php-jwt/src/SignatureInvalidException.php';
include_once '../../vendor/firebase/php-jwt/src/JWT.php';

use \Firebase\JWT\JWT;

//generation of apiKey for app
if ($userExists &&  password_verify($data->password, $user->password)) {
    $token = array(
        "iss" => $iss,
        "aud" => $aud,
        "iat" => $iat,
        "nbf" => $nbf,
        "data" => array(
            "id" => $user->user_id,
            "userName" => $user->user_name,
            "email" => $user->user_email,
            "password" => $user->password,
            "phoneNumber" => $user->user_mobile,
        )
    );

    http_response_code(200);

    // generate web token for verifying user is logged in
    $jwt = JWT::encode($token, $key);
    echo json_encode(
        array(
            "message" => "Successful login.",
            "jwt" => $jwt,
            "email" => $user->user_email,
            "names" => $user->user_name
        )
    );
} else {
    http_response_code(401);
    echo json_encode(array(
        "message" => "login has failed"
    ));
}