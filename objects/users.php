<?php
class Users
{
    private $conn;
    private $tableName = 'users';

    public $id;
    public $userName;
    public $password;
    public $firstName;
    public $lastName;
    public $phoneNumber;

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
        $this->userName = $row['userName'];
        $this->password = $row['password'];
        $this->firstName = $row['firstName'];
        $this->lastName = $row['lastName'];
    }

    function create()
    {
        $query = "INSERT INTO " . $this->tableName . " 
                    SET 
                        userName = :userName, password = :password, firstName = :firstName, lastName = :lastName, phoneNumber = :phoneNumber";

        $stmt = $this->conn->prepare($query);

        $this->userName = htmlspecialchars(strip_tags($this->userName));
        $this->password = htmlspecialchars(strip_tags($this->password));
        $this->firstName = htmlspecialchars(strip_tags($this->firstName));
        $this->lastName = htmlspecialchars(strip_tags($this->lastName));
        $this->phoneNumber = htmlspecialchars(strip_tags($this->phoneNumber));

        $stmt->bindParam(':userName', $this->userName);
        $stmt->bindParam(':password', $this->password);
        $stmt->bindParam(':firstName', $this->firstName);
        $stmt->bindParam(':lastName', $this->lastName);
        $stmt->bindParam(':phoneNumber', $this->phoneNumber);
        // $stmt->bindParam(':password', $this->password);

        $password_hash = password_hash($this->password, PASSWORD_BCRYPT);
        $stmt->bindParam(':password', $password_hash);

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


