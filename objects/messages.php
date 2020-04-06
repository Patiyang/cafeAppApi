<?php
class Messages
{
    private $conn;
    private $tableName = 'messages';

    public $id;
    public $userName;
    public $message;
    public $recipent;
    public $time;

    public function __construct($db)
    {
        $this->conn = $db;
    }

    function create()
    {
        $query = "INSERT INTO " . $this->tableName . "
                    SET 
                        userName = :userName, message = :message, recipent = :recipent, time = :time";
        $stmt = $this->conn->prepare($query);

        $this->userName = htmlspecialchars(strip_tags($this->userName));
        $this->message = htmlspecialchars(strip_tags($this->message));
        $this->recipent = htmlspecialchars(strip_tags($this->recipent));
        $this->time = htmlspecialchars(strip_tags($this->time));

        $stmt->bindParam(':userName', $this->userName);
        $stmt->bindParam(':message', $this->message);
        $stmt->bindParam(':recipent', $this->recipent);
        $stmt->bindParam(':time', $this->time);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }
    function readMessages()
    {
        $query = "SELECT * FROM " . $this->tableName;
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }
}
