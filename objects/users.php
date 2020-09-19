<?php
class Users
{
    private $conn;
    private $tableName = 'cafe';

    public $cafe_id;
    public $owner_name;
    public $owner_pass;
    public $owner_email;
    public $owner_mob;

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
        $query = "SELECT * FROM " . $this->tableName . " WHERE id = ? LIMIT 0,1";
        $stmt = $this->conn->prepare($query);

        $stmt->bindParam(1, $this->id);
        $stmt->execute();

        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        $this->id = $row['id'];
        $this->owner_name = $row['owner_name'];
        $this->owner_pass = $row['owner_pass'];
        $this->owner_email = $row['owner_email'];
        $this->owner_mob = $row['owner_mob'];
    }

    function create()
    {
        $query = "INSERT INTO " . $this->tableName . " 
                    SET 
                        owner_name = :owner_name, owner_pass = :owner_pass, owner_email = :owner_email, owner_mob = :owner_mob";

        $stmt = $this->conn->prepare($query);

        $this->owner_name = htmlspecialchars(strip_tags($this->owner_name));
        $this->owner_mob = htmlspecialchars(strip_tags($this->owner_mob));
        $this->owner_email = htmlspecialchars(strip_tags($this->owner_email));
        $this->owner_pass = htmlspecialchars(strip_tags($this->owner_pass));

        $stmt->bindParam(':owner_name', $this->owner_name);
        $stmt->bindParam(':owner_mob', $this->owner_pass);
        $stmt->bindParam(':owner_email', $this->owner_email);
        $password_hash = password_hash($this->owner_pass, PASSWORD_BCRYPT);
        $stmt->bindParam(':owner_pass', $password_hash);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    function userExists()
    {
        $query = "SELECT id, userName, password, firstName, lastName, phoneNumber
        FROM " . $this->tableName . "
        WHERE userName = ?
        LIMIT 0,1";

        $stmt = $this->conn->prepare($query);

        $this->userName = htmlspecialchars(strip_tags($this->userName));

        $stmt->bindParam(1, $this->userName);
        $stmt->execute();

        $num = $stmt->rowCount();

        if ($num > 0) {

            $row = $stmt->fetch(PDO::FETCH_ASSOC);
            $this->id = $row['id'];
            $this->userName = $row['userName'];
            $this->password = $row['password'];
            $this->firstName = $row['firstName'];
            $this->lastName = $row['lastName'];
            $this->firstName = $row['phoneNumber'];
            return true;
        }

        // return false if email does not exist in the database
        return false;
    }
}
