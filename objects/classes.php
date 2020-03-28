<?php

class Streams{
    private $conn;
    private $tableName = 'studentstreams';
    public function __construct($db)
    {
        $this->conn = $db;
    }
    function readTeachers()
    {
        $query="SELECT * FROM studentstreams CROSS JOIN studentclass" ;
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }
}
class Classes{
    private $conn;
    private $tableName = 'studentclass';
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