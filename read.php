<?php
define('DB_HOST','localhost');
define('DB_USER','root');
define('DB_PASS','');
define('DB_NAME','calendar_eg');

// Establish database connection.
try {
    $dbh = new PDO("mysql:host=".DB_HOST.";dbname=".DB_NAME,DB_USER, DB_PASS,array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"));
} catch (PDOException $e) {
    exit("Error: " . $e->getMessage());
}

ini_set('display_errors', true);
error_reporting(E_ERROR | E_PARSE);
error_reporting(-1);

try {
    $query = "SELECT `evt_start`, `evt_end`, `evt_text` FROM `events`;";
    $stmt = $dbh->prepare($query);
    $stmt->execute(); // Execute the query
    $data = $stmt->fetchAll(PDO::FETCH_ASSOC); // Fetch the data after executing
    $jsonResponse = json_encode($data);
    header('Content-Type: application/json');
    echo $jsonResponse;
} catch (PDOException $e) {
    // Handle database connection or query errors
    echo 'Error: ' . $e->getMessage();
}
?>
