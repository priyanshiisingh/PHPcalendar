<?php

include 'db_config.php';

function readHolidaysFile($filePath) {
    $holidays = array();

    if (($handle = fopen($filePath, "r")) !== false) {
        $header = fgetcsv($handle, 1000, ",");

        while (($data = fgetcsv($handle, 1000, ",")) !== false) {
            $holidayItem = array_combine($header, $data);
            $holidays[] = array(
                "start" => $data[0],
                "end" => $holidayItem["evt_end"],
                "name" => $holidayItem["name"],
            );
        }
        fclose($handle);
        return $holidays;
    } else {
        return false;
    }
}

function calculateOddSaturdays($year) {
    $oddSaturdays = array();

    for ($week = 1; $week <= 53; $week += 2) {
        $mondayOfWeek = date("Y-m-d", strtotime($year . "W" . str_pad($week, 2, "0", STR_PAD_LEFT)));
        $saturdayOfWeek = date("Y-m-d", strtotime("$mondayOfWeek +5 days"));

        if (date("Y", strtotime($saturdayOfWeek)) == $year) {
            $oddSaturdays[] = $saturdayOfWeek;
        }
    }

    return $oddSaturdays;
}

function generateCsvData($events) {
    $csvData = '';
    foreach ($events as $event) {
        $evt_start = $event['start'];
        $evt_end = $event['end'];
        $evt_text = $event['name'];
        $evt_color = ($event['name'] == 'Working Saturday') ? "#000000" : "white";
        $evt_bg = ($event['name'] == 'Working Saturday') ? "#FFFC41" : "#D62246";
        $evt_category = ($event['name'] == 'Working Saturday') ? 3 : 2;
        $csvData .= implode(',', [$evt_start, $evt_end, $evt_text, $evt_color, $evt_bg, $evt_category]) . "\n";
    }
    return $csvData;
}

function saveCsvToFile($csvData, $filePath) {
    if (file_put_contents($filePath, $csvData) !== false) {
        return true;
    } else {
        return false;
    }
}

// Insert data into categories table
function insertCategories($conn, $csvFilePath) {
    if (($handle = fopen($csvFilePath, "r")) !== false) {
        fgetcsv($handle); // Skip header row
        $conn->query("SET FOREIGN_KEY_CHECKS = 0");
        if ($conn->query("TRUNCATE TABLE categories") === true) {
            $conn->query("SET FOREIGN_KEY_CHECKS = 1");
        }
        while (($data = fgetcsv($handle, 1000, ",")) !== false) {
            $evt_category = $conn->real_escape_string($data[2]);
            $evt_color = $conn->real_escape_string($data[3]);
            $evt_bg = $conn->real_escape_string($data[4]);
            $sql = "INSERT INTO categories (category_name, category_color, category_bg) VALUES ('$evt_category','$evt_color','$evt_bg')";
            $conn->query($sql);
        }
        fclose($handle);
    }
}

// Insert data into events table
function insertEvents($conn, $csvFilePath) {
    if (($handle = fopen($csvFilePath, "r")) !== false) {
        fgetcsv($handle); // Skip header row
        $sql = "TRUNCATE table events;";
        $conn->query($sql);
        while (($data = fgetcsv($handle, 1000, ",")) !== false) {
            $evt_start = $conn->real_escape_string($data[0]);
            $evt_end = $conn->real_escape_string($data[1]);
            $evt_text = $conn->real_escape_string($data[2]);
            $evt_color = $conn->real_escape_string($data[3]);
            $evt_bg = $conn->real_escape_string($data[4]);
            $evt_category = $conn->real_escape_string($data[5]);
            $sql = "INSERT INTO events (evt_start, evt_end, evt_text, evt_color, evt_bg, evt_category) VALUES ('$evt_start', '$evt_end', '$evt_text', '$evt_color', '$evt_bg', '$evt_category')";
            $conn->query($sql);
        }
        fclose($handle);
    }
}

// Example usage:
$holidaysFilePath = "holidays.csv";
$eventsFilePath = "events.csv";
$currentYear = date("Y");

$response = array();

$holidays = readHolidaysFile($holidaysFilePath);

if ($holidays !== false) {
    $oddSaturdays = calculateOddSaturdays($currentYear);

    $oddSaturdaysData = array();
    foreach ($oddSaturdays as $os) {
        $oddSaturdaysData[] = array(
            "start" => $os,
            "end" => $os,
            "name" => "Working Saturday",
        );
    }

    $allEvents = array_merge($holidays, $oddSaturdaysData);
    $csvData = generateCsvData($allEvents);

    if (saveCsvToFile($csvData, $eventsFilePath)) {
        insertCategories($conn, $holidaysFilePath);
        insertEvents($conn, $eventsFilePath);
        $response["status"] = "success";
        $response["message"] = "Data inserted successfully.";
    } else {
        $response["status"] = "error";
        $response["message"] = "Error: Unable to create CSV file.";
    }
} else {
    $response["status"] = "error";
    $response["message"] = "Please upload a list of company holidays through holidays.csv file.";
}

header('Content-Type: application/json');
echo json_encode($response);

?>