<?php

class SchoolDetails
{
    private $conn;
    private $tableName = 'schooldetails';
    public function __construct($db)
    {
        $this->conn = $db;
    }
    function readSchool()
    {
        $query = "SELECT * FROM " . $this->tableName;
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }
}
