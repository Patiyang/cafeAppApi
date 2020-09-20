<?php
class Users
{
    private $conn;
    private $tableName = 'cafe';

    public $owner_name;
    public $owner_pass;
    public $owner_email;
    public $owner_mob;
    public $cafe_name;
    public $owner_upi;
    public $location;
    public $cafe_cost;
    public $description;
    public $service_area;
    public $facilities;
    public $primary_image;
    public $secondary;
    public $status;

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

        $this->owner_name = $row['owner_name'];
        $this->owner_pass = $row['owner_pass'];
        $this->owner_email = $row['owner_email'];
        $this->owner_mob = $row['owner_mob'];
        $this->cafe_name = $row['cafe_name'];
        $this->owner_upi = $row['owner_upi'];
        $this->location = $row['location'];
        $this->cafe_cost = $row['cafe_cost'];
        $this->description = $row['description'];
        $this->service_area = $row['service_area'];
        $this->facilities = $row['facilities'];
        $this->primary_image = $row['primary_image'];
        $this->secondary = $row['secondary'];
        $this->status = $row['status'];
    }

    function create()
    {
        $query = "INSERT INTO " . $this->tableName . " 
                    SET 
                        owner_name = :owner_name, owner_pass = :owner_pass, owner_email = :owner_email, owner_mob = :owner_mob, cafe_name = :cafe_name, owner_upi = :owner_upi, location = :location";

                        // , cafe_name = :cafe_name, owner_upi = :owner_upi, location = :location, cafe_cost = :cafe_cost, description = :description, service_area = :service_area, facilities = :facilities, primary_image = :primary_image, secondary = :secondary, status = :status
        $stmt = $this->conn->prepare($query);

        $this->owner_name = htmlspecialchars(strip_tags($this->owner_name));
        $this->owner_mob = htmlspecialchars(strip_tags($this->owner_mob));
        $this->owner_email = htmlspecialchars(strip_tags($this->owner_email));
        $this->owner_pass = htmlspecialchars(strip_tags($this->owner_pass));
        $this->cafe_name = htmlspecialchars(strip_tags($this->cafe_name));
        $this->owner_upi = htmlspecialchars(strip_tags($this->owner_upi));
        $this->location = htmlspecialchars(strip_tags($this->location));
        $this->cafe_cost = htmlspecialchars(strip_tags($this->owner_pass));
        $this->description = htmlspecialchars(strip_tags($this->owner_pass));
        $this->service_area = htmlspecialchars(strip_tags($this->owner_pass));
        $this->facilities = htmlspecialchars(strip_tags($this->owner_pass));
        $this->primary_image = htmlspecialchars(strip_tags($this->owner_pass));
        $this->secondary = htmlspecialchars(strip_tags($this->owner_pass));
        $this->status = htmlspecialchars(strip_tags($this->owner_pass));

        $stmt->bindParam(':owner_name', $this->owner_name);
        $stmt->bindParam(':owner_mob', $this->owner_mob);
        $stmt->bindParam(':owner_email', $this->owner_email);
        $stmt->bindParam(':cafe_name', $this->cafe_name);
        $stmt->bindParam(':owner_upi', $this->owner_upi);
        $stmt->bindParam(':location', $this->location);
        // $stmt->bindParam(':cafe_cost', $this->cafe_cost);
        // $stmt->bindParam(':description', $this->description);
        // $stmt->bindParam(':service_area', $this->service_area);
        // $stmt->bindParam(':facilities', $this->facilities);
        // $stmt->bindParam(':primary_image', $this->primary_image);
        // $stmt->bindParam(':secondary', $this->secondary);
        // $stmt->bindParam(':status', $this->status);
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
