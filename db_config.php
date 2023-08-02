<?php 

$servername= "localhost";
$dbname="calendar_eg";
$charset= "utf8mb4";
$username= "root";
$password= "";


// Create a connection to the database
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>