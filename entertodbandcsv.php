<?php

include 'db_config.php';

// Read the holiday CSV file and store dates in an array
$holidaysFile = "holidays.csv";
$holidays = array();
$count = 1;

if (($handle = fopen($holidaysFile, "r")) !== false) {
    $header = fgetcsv($handle, 1000, ","); // Read column headers

    while (($data = fgetcsv($handle, 1000, ",")) !== false) {
        $holidayItem = array_combine($header, $data); // Combine header and data
        $jsonItem = array(
            "id" => $count++,
            "start" => $data[0],
            "end" => $holidayItem["evt_end"],
            "name" => $holidayItem["name"],
            // Add other keys you want to include here
        );
        $holidays[] = $jsonItem;
    }
    fclose($handle);
    print_r($holidays); // Display the structured array with your existing $holidays array
} else {
    echo "Please upload a list of company holidays through holidays.csv file.";
}

$csvData = ''; 

foreach ($holidays as $holidayItem) {
    $evt_id = $holidayItem['id'];
    $evt_start = $holidayItem['start'];
    $evt_end = $holidayItem['end']; // Use the 'end' key
    $evt_text = $holidayItem['name'];
    $evt_color = "white";
    $evt_bg = "#D62246";
    $evt_category = 2;
    $csvData .= implode(',', [$evt_id, $evt_start, $evt_end, $evt_text, $evt_color, $evt_bg, $evt_category]) . "\n";
}

// Now you can use the $csvData as needed, for example, save it to a CSV file



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