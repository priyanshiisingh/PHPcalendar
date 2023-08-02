<?php

include 'db_config.php';

// Read the holiday CSV file and store dates in an array
$holidaysFile = "holidays.csv";
$holidays = array();

if (($handle = fopen($holidaysFile, "r")) !== false) {
    while (($data = fgetcsv($handle, 1000, ",")) !== false) {
        $holidays[] = $data[0]; // Assuming the holiday date is in the first column
    }
    fclose($handle);
}else{
    echo "Please upload a list of company holidays through holidays.csv file.";
}

// Step 1: Make an HTTP request to the API and get JSON data
$apiUrl = 'https://www.googleapis.com/calendar/v3/calendars/en.indian%23holiday%40group.v.calendar.google.com/events?key=AIzaSyCDS95lwXGJva1ESHsrWZUrspm0F-R_E3Y'; // Replace YOUR_API_KEY with your actual API key
$jsonData = file_get_contents($apiUrl);

// Step 2: Parse the JSON data into a PHP array or object
$data = json_decode($jsonData, true); // Set the second parameter to true for an associative array

if (empty($data) || !isset($data['items'])) {
    die("Error: Unable to fetch or parse JSON data.");
}

// Step 3: Select specific fields and convert the PHP array into a CSV format
$csvData = '';
$csvData .= implode(',', ['evt_id', 'evt_start', 'evt_end', 'evt_text', '$evt_color', '$evt_bg', '$evt_category']) . "\n";

foreach ($data['items'] as $item) {
    // Extract the values for selected fields
    $evt_id = $item['id'];
    $evt_start = $item['start']['date'];
    $evt_end =  $item['start']['date'];
    $evt_text = $item['summary'];
    
    // Check if evt_start date is present in the holiday CSV file
    if (in_array($evt_start, $holidays)) {
        $evt_color ="white";
        $evt_bg="#D62246";
        $evt_category=2;
    }else{
        $evt_color ="#000000";
        $evt_bg="#FFDBDB";
        $evt_category=1;
    }

    $csvData .= implode(',', [$evt_id, $evt_start, $evt_end, $evt_text, $evt_color, $evt_bg, $evt_category]) . "\n";
}


// Calculate odd saturdays for the year
function getOddSaturdaysOfYear($year) {
    $oddSaturdays = array();

    // Loop through all the weeks of the given year
    for ($week = 1; $week <= 53; $week += 2) {
        // Calculate the date of the first day (Monday) of the week
        $mondayOfWeek = date("Y-m-d", strtotime($year . "W" . str_pad($week, 2, "0", STR_PAD_LEFT)));

        // Calculate the date of the Saturday of the same week
        $saturdayOfWeek = date("Y-m-d", strtotime("$mondayOfWeek +5 days"));

        // Ensure the Saturday belongs to the specified year
        if (date("Y", strtotime($saturdayOfWeek)) == $year) {
            $oddSaturdays[] = $saturdayOfWeek;
        }
    }

    return $oddSaturdays;
}

// Get the current year
$currentYear = date("Y");

// Get the odd Saturdays of the current year
$oddSaturdaysOfYear = getOddSaturdaysOfYear($currentYear);

// Output the array of odd Saturdays
foreach ($oddSaturdaysOfYear as $os) {
    // Extract the values for selected fields
    $evt_id=$evt_id++;
    $evt_start = $os;
    $evt_end =  $os;
    $evt_text = "Working saturday";
    $evt_color ="#000000";
    $evt_bg="#FFFC41";
    $evt_category=3;

    $csvData .= implode(',', [$evt_id,$evt_start, $evt_end, $evt_text, $evt_color, $evt_bg, $evt_category]) . "\n";
}


// Step 4: Write the CSV data to a file

if (file_exists('events.csv')) {
    unlink('events.csv');
}

$csvFilePath = 'events.csv'; // Replace with the desired CSV file path

if (file_put_contents($csvFilePath, $csvData) !== false) {
    echo "CSV file created successfully.";
} else {
    echo "Error: Unable to create CSV file.";
}

// Insert data into categories table with holidays csv 

// File path of the CSV file
$csvFilePath2 = "holidays.csv";

if (($handle = fopen($csvFilePath2, "r")) !== false) {
    // Skip the header row
    fgetcsv($handle);

    // Disable foreign key checks
    $conn->query("SET FOREIGN_KEY_CHECKS = 0");
    // $conn->query("TRUNCATE TABLE categories");
    if ($conn->query("TRUNCATE TABLE categories") === true) {
        echo "Data deleted successfully <br>";
        // Enable foreign key checks
        $conn->query("SET FOREIGN_KEY_CHECKS = 1");
    } else {
        echo "Error deleting data: " . $conn->error . "<br>";
    }
    // Loop through the file line by line
    while (($data = fgetcsv($handle, 1000, ",")) !== false) {
        // Get the values from the CSV and escape them to prevent SQL injection

        $evt_category= $conn->real_escape_string($data[3]);
        $evt_color= $conn->real_escape_string($data[4]);
        $evt_bg= $conn->real_escape_string($data[5]);
        // SQL query to insert data into the database
        $sql = "INSERT INTO categories (category_name,category_color,category_bg) VALUES ('$evt_category','$evt_color','$evt_bg')";

        // Execute the query
        if ($conn->query($sql) === true) {
            echo "Data inserted successfully <br>";
        } else {
            echo "Error inserting data: " . $conn->error . "<br>";
        }
    }

    // Close the file handle
    fclose($handle);

} else {
    echo "Error opening the file.";
}






// File path of the CSV file
$csvFilePath = "events.csv";

// Open the CSV file
if (($handle = fopen($csvFilePath, "r")) !== false) {
    // Skip the header row
    fgetcsv($handle);
    
    // SQL query to delete all data first and then insert into the database
    $sql = "TRUNCATE table events;";
        if ($conn->query($sql) === true) {
            echo "Data deleted successfully <br>";
        } else {
            echo "Error deleting data: " . $conn->error . "<br>";
        }


    // Loop through the file line by line
    while (($data = fgetcsv($handle, 1000, ",")) !== false) {
        // Get the values from the CSV and escape them to prevent SQL injection
        // $column1 = $conn->real_escape_string($data[0]);
        $evt_start = $conn->real_escape_string($data[1]);
        $evt_end = $conn->real_escape_string($data[2]);
        $evt_text = $conn->real_escape_string($data[3]);
        $evt_color = $conn->real_escape_string($data[4]);
        $evt_bg= $conn->real_escape_string($data[5]);
        $evt_category=$conn->real_escape_string($data[6]);

        // SQL query to insert data into the database
        $sql = "INSERT INTO events (evt_start, evt_end, evt_text, evt_color, evt_bg, evt_category) VALUES ('$evt_start', '$evt_end', '$evt_text', '$evt_color', '$evt_bg', '$evt_category')";

        // Execute the query
        if ($conn->query($sql) === true) {
            echo "Data inserted successfully <br>";
        } else {
            echo "Error inserting data: " . $conn->error . "<br>";
        }
    }

    // Close the file handle
    fclose($handle);

} else {
    echo "Error opening the file.";
}


// Close the database connection
// $conn->close();
?>