<?php
$response = array("message" => "", "status" => "");

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $targetDir = __DIR__; // Project's root directory
    $targetFile = $targetDir . '/' . basename($_FILES["fileToUpload"]["name"]);
    $fileType = strtolower(pathinfo($targetFile, PATHINFO_EXTENSION));

    // Check if the file is a CSV file
    if ($fileType != "csv") {
        $response["message"] = "Sorry, only CSV files are allowed.";
        $response["status"] = "error";
    } else {
        // If everything is OK, try to upload the file
        if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $targetFile)) {
            $response["message"] = "The file " . basename($_FILES["fileToUpload"]["name"]) . " has been uploaded.";
            $response["status"] = "success";
        } else {
            $response["message"] = "Sorry, there was an error uploading your file.";
            $response["status"] = "error";
        }
    }
} else {
    $response["message"] = "No file was submitted.";
    $response["status"] = "error";
}

header('Content-Type: application/json');
echo json_encode($response);
?>