<?php
class Users
{
    private $conn;
    private $tableName = 'users';

    public $user_id;
    public $user_name;
    public $user_mobile;
    public $user_email;
    public $user_address;
    public $user_img;
    public $user_status;
    public $user_addon;
    public $password;

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
        $query = "SELECT * FROM " . $this->tableName . " WHERE user_id = ? LIMIT 0,1";
        $stmt = $this->conn->prepare($query);

        $stmt->bindParam(1, $this->cafe_id);
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
    }

    function create()
    {

        $query = "INSERT INTO " . $this->tableName . " 
                    SET 
                    user_name = :user_name, user_mobile = :user_mobile, user_email = :user_email, user_address = :user_address, user_img = :user_img, user_status = :user_status, password = :password";

        $stmt = $this->conn->prepare($query);

        $this->user_name = htmlspecialchars(strip_tags($this->user_name));
        $this->user_mobile = htmlspecialchars(strip_tags($this->user_mobile));
        $this->user_email = htmlspecialchars(strip_tags($this->user_email));
        $this->user_address = htmlspecialchars(strip_tags($this->user_address));
        $this->user_img = htmlspecialchars(strip_tags($this->user_img));
        $this->user_status = htmlspecialchars(strip_tags($this->user_status));
        // $this->user_addon = htmlspecialchars(strip_tags($this->user_addon));
        $this->password = htmlspecialchars(strip_tags($this->password));

        $stmt->bindParam(':user_name', $this->user_name);
        $stmt->bindParam(':user_mobile', $this->user_mobile);
        $stmt->bindParam(':user_email', $this->user_email);
        $stmt->bindParam(':user_address', $this->user_address);
        $stmt->bindParam(':user_img', $this->user_img);
        $stmt->bindParam(':user_status', $this->user_status);
        // $stmt->bindParam(':user_addon', $this->user_addon);
        $password_hash = password_hash($this->password, PASSWORD_BCRYPT);
        $stmt->bindParam(':password', $password_hash);


        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    function update()
    {
        $query = "UPDATE
                    " . $this->tableName . "
                SET user_name = :user_name, user_mobile = :user_mobile, user_email = :user_email WHERE user_email = :user_email";
        $stmt = $this->conn->prepare($query);
        // sanitize the data
        $this->user_name = htmlspecialchars(strip_tags($this->user_name));
        $this->user_mobile = htmlspecialchars(strip_tags($this->user_mobile));
        $this->user_email = htmlspecialchars(strip_tags($this->user_email));
        // new user values go here
        $stmt->bindParam(':user_name', $this->user_name);
        $stmt->bindParam(':user_mobile', $this->user_mobile);
        $stmt->bindParam(':user_email', $this->user_email);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    function userExists()
    {
        $query = "SELECT user_id, user_name, user_mobile, user_email,
        FROM " . $this->tableName . "
        WHERE user_email = ?
        LIMIT 0,1";

        $this->user_email = htmlspecialchars(strip_tags($this->user_email));
        $stmt = $this->conn->prepare($query);

        $stmt->bindParam(1, $this->user_email);
        $stmt->execute();
        $num = $stmt->rowCount();

        if ($num > 0) {
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
            $this->user_id = $row['user_id'];
            $this->user_name = $row['user_name'];
            $this->user_mobile = $row['user_mobile'];
            $this->user_email = $row['user_email'];
            return true;
        }
        return false;
    }
}
