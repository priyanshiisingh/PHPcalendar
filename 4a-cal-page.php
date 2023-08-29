<!DOCTYPE html>
<html>

<head>
  <title>Calendar Demo</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.5">
  <link rel="icon" type="image/png" href="favicon.png">

  <!-- ANDROID + CHROME + APPLE + WINDOWS APP -->
  <meta name="mobile-web-app-capable" content="yes">
  <meta name="theme-color" content="white">
  <link rel="apple-touch-icon" href="icon-512.png">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black">
  <meta name="apple-mobile-web-app-title" content="Calendar">
  <meta name="msapplication-TileImage" content="icon-512.png">
  <meta name="msapplication-TileColor" content="#ffffff">

  <!-- WEB APP MANIFEST -->
  <!-- https://web.dev/add-manifest/ -->
  <link rel="manifest" href="5-manifest.json">

  <!-- SERVICE WORKER -->
  <script>
    if ("serviceWorker" in navigator) {
      navigator.serviceWorker.register("5-worker.js");
    }
  </script>

  <!-- JS + CSS -->
  <script src="4b-calendar.js"></script>
  <link rel="stylesheet" href="4c-calendar.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
  <?php
    // (A) DAYS MONTHS YEAR
    $months = [
      1 => "January", 2 => "Febuary", 3 => "March", 4 => "April",
      5 => "May", 6 => "June", 7 => "July", 8 => "August",
      9 => "September", 10 => "October", 11 => "November", 12 => "December"
    ];
    $monthNow = date("m");
    $yearNow = date("Y"); ?>

  <!-- (B) PERIOD SELECTOR -->
  <div id="calHead">
    <div id="calPeriod">
      <input id="calBack" type="button" class="mi" value="&lt;">
      <select id="calMonth"><?php foreach ($months as $m=>$mth) {
          printf("<option value='%u'%s>%s</option>",
            $m, $m==$monthNow?" selected":"", $mth
          );
        } ?></select>
      <input id="calYear" type="number" value="<?=$yearNow?>">
      <input id="calNext" type="button" class="mi" value="&gt;">
    </div>
    <input id="calReset" type="button" value="Reset">
    <input id="uploadHoliday" type="button" value="Upload Holiday List" data-bs-toggle="modal"
      data-bs-target="#UploadModal">
    <!-- <script>
      // JavaScript code to handle button click event
      document.getElementById('calReset').addEventListener('click', function () {
        window.location.href = 'entertodbandcsv.php';
      });
    </script> -->

    <input id="calAdd" type="button" value="+">
  </div>

  <!-- (C) CALENDAR WRAPPER -->
  <div id="calWrap">
    <div id="calDays"></div>
    <div id="calBody"></div>
  </div>

  <!-- (D) EVENT FORM -->
  <dialog id="calForm">
    <form method="dialog">
      <div id="evtCX">X</div>
      <h2 class="evt100">CALENDAR EVENT</h2>
      <div class="evt50">
        <label>Start</label>
        <input id="evtStart" type="date" required value="<?php echo date('Y-m-d'); ?>" >
      </div>
      <div class="evt50">
        <label>End</label>
        <input id="evtEnd" type="date" required>
      </div>
      <!-- <div class="evt50">
        <label>Text Color</label>
        <input id="evtColor" type="color" value="#000000" required>
      </div>
      <div class="evt50">
        <label>Background Color</label>
        <input id="evtBG" type="color" value="#ffdbdb" required>
      </div> -->
      <div class="evt100">
        <label>Event</label>
        <input id="evtTxt" type="text" required>
      </div>
      <div class="evt100">
        <label>Category</label>
        <select id="evtCategory" required>
          <option selected>Select category</option>
          <?php include 'getoptions.php'; ?>
        </select>
      </div>
      <div class="evt100">
        <input type="hidden" id="evtID">
        <input type="button" id="evtDel" value="Delete">
        <input type="submit" id="evtSave" value="Save">
      </div>
    </form>
  </dialog>

  <hr>

  <div class="modal fade" id="UploadModal" tabindex="-1" aria-labelledby="UploadModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="UploadModalLabel">Upload File</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form method="post" id="uploadForm" enctype="multipart/form-data">
            <label for="fileToUpload" class="form-label">Upload Holiday list file: </label>
            <input type="file" name="fileToUpload" id="fileToUpload" class="form-control mb-3">
            <button type="submit" name="submit" class="btn btn-primary">Upload</button>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  <div class="toast-container position-fixed bottom-0 end-0 p-3">
    <div id="toaster" class="toast" role="alert" aria-live="assertive" aria-atomic="true" data-bs-autohide="true">
      <div class="toast-header">
        <strong class="me-auto">File Upload</strong>
        <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
      </div>
      <div class="toast-body text-white">
      </div>
    </div>
  </div>

  <script src="fileajax.js"></script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous">
  </script>
</body>

</html>