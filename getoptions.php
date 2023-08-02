<?php
// Include the database connection file
include 'db_config.php';

// SQL query to fetch data from the database table
$sql = "SELECT * FROM categories"; // Replace 'options_table' with the name of your table

$result = $conn->query($sql);

// Check if there are any results
if ($result->num_rows > 0) {
    // Loop through the data and create <option> tags
    while ($row = $result->fetch_assoc()) {
        $optionId = $row["category_id"];
        $optionName = $row["category_name"];
        echo "<option value='$optionId'>$optionName</option>";
    }
} else {
    echo "<option value=''>No options available</option>";
}

// // Close the database connection
// $conn->close();
?>
