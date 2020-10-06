<?php
class Users
{
    private $conn;
    private $tableName = 'users';
    private $bookingTable = 'bookings';

    public $user_id;
    public $user_name;
    public $user_mobile;
    public $user_email;
    public $user_address;
    public $user_img;
    public $user_status;
    public $user_addon;
    public $password;
    public $user_about;
    public $card_number;
    public $cvc;
    public $card_expiry;

    //creating booking variables
    public $booking_id;
    public $place_name;
    public $payMode;
    public $complementary;
    public $cancelled;
    public $status;
    public $reservations;
    public $cost;
    public $booking_image;





    public function __construct($db)
    {
        $this->conn = $db;
    }
    function read()
    {
        $query = "SELECT * FROM " . $this->tableName;
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    function readOne()
    {
        $query = "SELECT * FROM " . $this->tableName . " WHERE user_mobile = ? LIMIT 0,1";
        $stmt = $this->conn->prepare($query);

        $stmt->bindParam(1, $this->user_mobile);
        $stmt->execute();

        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        $this->user_id = $row['user_id'];
        $this->user_name = $row['user_name'];
        $this->user_mobile = $row['user_mobile'];
        $this->user_email = $row['user_email'];
        $this->user_address = $row['user_address'];
        $this->user_img = $row['user_img'];
        $this->user_status = $row['user_status'];
        $this->user_addon = $row['user_addon'];
        $this->password = $row['password'];
        $this->user_about = $row['user_about'];
        $this->card_number = $row['card_number'];
        $this->card_expiry = $row['card_expiry'];
        $this->cvc = $row['cvc'];
    }

    function createUser()
    {

        $query = "INSERT INTO " . $this->tableName . " 
                    SET 
                    user_name = :user_name, user_mobile = :user_mobile, user_email = :user_email, user_address = :user_address, user_img = :user_img, user_status = :user_status, password = :password, user_about = :user_about";

        $stmt = $this->conn->prepare($query);

        $this->user_name = htmlspecialchars(strip_tags($this->user_name));
        $this->user_mobile = htmlspecialchars(strip_tags($this->user_mobile));
        $this->user_email = htmlspecialchars(strip_tags($this->user_email));
        $this->user_address = htmlspecialchars(strip_tags($this->user_address));
        $this->user_img = htmlspecialchars(strip_tags($this->user_img));
        $this->user_status = htmlspecialchars(strip_tags($this->user_status));
        // $this->user_addon = htmlspecialchars(strip_tags($this->user_addon));
        $this->password = htmlspecialchars(strip_tags($this->password));
        $this->user_about = htmlspecialchars(strip_tags($this->user_about));


        $stmt->bindParam(':user_name', $this->user_name);
        $stmt->bindParam(':user_mobile', $this->user_mobile);
        $stmt->bindParam(':user_email', $this->user_email);
        $stmt->bindParam(':user_address', $this->user_address);
        $stmt->bindParam(':user_img', $this->user_img);
        $stmt->bindParam(':user_status', $this->user_status);
        $stmt->bindParam(':user_about', $this->user_about);
        // $stmt->bindParam(':user_addon', $this->user_addon);
        $password_hash = password_hash($this->password, PASSWORD_BCRYPT);
        $stmt->bindParam(':password', $password_hash);


        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    function updateUser()
    {
        $query = "UPDATE
                    " . $this->tableName . "
                SET user_name = :user_name, user_address = :user_address, user_email = :user_email, user_about = :user_about, card_number = :card_number, card_expiry = :card_expiry, cvc = :cvc, user_mobile = :user_mobile WHERE user_id = :user_id";
        $stmt = $this->conn->prepare($query);
        // sanitize the data
        $this->user_id = htmlspecialchars(strip_tags($this->user_id));
        $this->user_mobile = htmlspecialchars(strip_tags($this->user_mobile));
        $this->user_name = htmlspecialchars(strip_tags($this->user_name));
        $this->user_address = htmlspecialchars(strip_tags($this->user_address));
        $this->user_email = htmlspecialchars(strip_tags($this->user_email));
        $this->user_about = htmlspecialchars(strip_tags($this->user_about));
        $this->card_number = htmlspecialchars(strip_tags($this->card_number));
        $this->card_expiry = htmlspecialchars(strip_tags($this->card_expiry));
        $this->cvc = htmlspecialchars(strip_tags($this->cvc));

        // new user values go here
        $stmt->bindParam(':user_id', $this->user_id);
        $stmt->bindParam(':user_mobile', $this->user_mobile);
        $stmt->bindParam(':user_name', $this->user_name);
        $stmt->bindParam(':user_address', $this->user_address);
        $stmt->bindParam(':user_email', $this->user_email);
        $stmt->bindParam(':user_about', $this->user_about);
        $stmt->bindParam(':card_number', $this->card_number);
        $stmt->bindParam(':card_expiry', $this->card_expiry);
        $stmt->bindParam(':cvc', $this->cvc);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }


    //USER BOOKING OPERATIONS
    function createUserBooking()
    {

        $query = "INSERT INTO " . $this->bookingTable . " 
                    SET 
                    user_name = :user_name,place_name = :place_name, pay_mode = :pay_mode, complementary = :complementary, cancelled = :cancelled, status = :status, cost = :cost, reservations = :reservations, image = :image";

        $stmt = $this->conn->prepare($query);

        $this->user_name = htmlspecialchars(strip_tags($this->user_name));
        $this->place_name = htmlspecialchars(strip_tags($this->place_name));
        $this->payMode = htmlspecialchars(strip_tags($this->payMode));
        $this->complementary = htmlspecialchars(strip_tags($this->complementary));
        $this->cancelled = htmlspecialchars(strip_tags($this->cancelled));
        $this->status = htmlspecialchars(strip_tags($this->status));
        $this->cost = htmlspecialchars(strip_tags($this->cost));
        $this->reservations = htmlspecialchars(strip_tags($this->reservations));
        $this->booking_image = htmlspecialchars(strip_tags($this->booking_image));

        $stmt->bindParam(':user_name', $this->user_name);
        $stmt->bindParam(':place_name', $this->place_name);
        $stmt->bindParam(':pay_mode', $this->payMode);
        $stmt->bindParam(':complementary', $this->complementary);
        $stmt->bindParam(':cancelled', $this->cancelled);
        $stmt->bindParam(':status', $this->status);
        $stmt->bindParam(':cost', $this->cost);
        $stmt->bindParam(':reservations', $this->reservations);
        $stmt->bindParam(':image', $this->booking_image);



        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    function readBookings()
    {
        $query = "SELECT * FROM " . $this->bookingTable;
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }


    function updateBooking()
    {
        $query = "UPDATE
        " . $this->bookingTable . "
    SET reservations = :reservations, cost = :cost WHERE booking_id = :booking_id";
        $stmt = $this->conn->prepare($query);
        // sanitize the data
        $this->booking_id = htmlspecialchars(strip_tags($this->booking_id));
        // $this->place_name = htmlspecialchars(strip_tags($this->place_name));
        // $this->user_name = htmlspecialchars(strip_tags($this->user_name));
        // $this->payMode = htmlspecialchars(strip_tags($this->payMode));
        // $this->complementary = htmlspecialchars(strip_tags($this->complementary));
        // $this->cancelled = htmlspecialchars(strip_tags($this->cancelled));
        // $this->status = htmlspecialchars(strip_tags($this->status));
        $this->reservations = htmlspecialchars(strip_tags($this->reservations));
        $this->cost = htmlspecialchars(strip_tags($this->cost));

        // new user values go here
        $stmt->bindParam(':booking_id', $this->booking_id);
        // $stmt->bindParam(':place_name', $this->place_name);
        // $stmt->bindParam(':user_name', $this->user_name);
        // $stmt->bindParam(':user_address', $this->payMode);
        // $stmt->bindParam(':complementary', $this->complementary);
        // $stmt->bindParam(':cancelled', $this->cancelled);
        // $stmt->bindParam(':status', $this->status);
        $stmt->bindParam(':reservations', $this->reservations);
        $stmt->bindParam(':cost', $this->cost);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    function deleteBooking()
    {
        $query = "DELETE FROM " . $this->bookingTable . " WHERE booking_id = ?";
        $stmt = $this->conn->prepare($query);
        $this->booking_id = htmlspecialchars(strip_tags($this->booking_id));

        $stmt->bindParam(1, $this->booking_id);
        if ($stmt->execute()) {
            return true;
        }

        return false;
    }
    function userExists()
    {
        $query = "SELECT * FROM " . $this->tableName . " WHERE user_mobile = ? LIMIT 0,1";

        $this->user_mobile = htmlspecialchars(strip_tags($this->user_mobile));
        $stmt = $this->conn->prepare($query);

        $stmt->bindParam(1, $this->user_mobile);
        $stmt->execute();
        $num = $stmt->rowCount();

        if ($num > 0) {
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
            $this->user_id = $row['user_id'];
            $this->user_name = $row['user_name'];
            $this->user_mobile = $row['user_mobile'];
            $this->user_email = $row['user_email'];
            $this->password = $row['password'];
            return true;
        }
        return false;
    }
}
