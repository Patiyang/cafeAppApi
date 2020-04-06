<?php
class Contacts
{
    private $conn;
    private $tableName = 'formOneContacts';

    public $id;
    public $contact;
    public function __construct($db)
    {
        $this->conn = $db;
    }
    function readContacts()
    {
        $query = "SELECT * FROM " . $this->tableName;
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }



    function readOneContact()
    {
        $query = "SELECT * FROM " . $this->tableName . " WHERE id = ? LIMIT 0,1";
        $stmt = $this->conn->prepare($query);

        $stmt->bindParam(1, $this->id);
        $stmt->execute();

        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        $this->id = $row['id'];
        $this->contact = $row['contact'];
    }

    function createContact()
    {
        $query = "INSERT INTO " . $this->tableName . " SET contact = :contact";

        $stmt = $this->conn->prepare($query);
        $this->contact = htmlspecialchars(strip_tags($this->contact));

        $stmt->bindParam(':contact', $this->contact);
        if ($stmt->execute()) {
            return true;
        }
        return false;
    }
}


class RegisterdContacts
{
    private $conn;
    private $tableName = 'registration';

    public $phone;
    public $contact;
    public function __construct($db)
    {
        $this->conn = $db;
    }
    function readRegistered()
    {
        $query="SELECT * FROM " . $this->tableName;
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

}

class Teachers{
    private $conn;
    private $tableName = 'teacherregistration';
    public function __construct($db)
    {
        $this->conn = $db;
    }
    function readTeachers()
    {
        $query="SELECT * FROM " . $this->tableName;
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }
}

class SubOrdinate{
    private $conn;
    private $tableName = 'subregistration';
    public function __construct($db)
    {
        $this->conn = $db;
    }
    function readSubordinate()
    {
        $query="SELECT * FROM " . $this->tableName;
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }
}