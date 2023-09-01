
  <h1>Leave Application Form</h1>

  <label for="fromDate">From Date:</label>
  <input type="date" id="fromDate">
  <br>
  <label for="leaveType">Leave Type:</label>
  <select id="leaveType">
    <option value="" selected disabled>Select</option>
    <option value="fullDay">Full Day</option>
    <option value="halfDay">Half Day</option>
  </select>

  <div id="halfDayOptions" style="display: none;">
    <label for="halfDayType">Half Day:</label>
    <select id="halfDayType">
      <option value="firstHalf">First Half</option>
      <option value="secondHalf">Second Half</option>
    </select>
  </div>

  <div id="toDateSection" style="display: none;">
    <label for="toDate">To Date:</label>
    <input type="date" id="toDate">
  </div>

  <button id="submitButton">Submit</button>


  <div id="dateOptions"></div>
  <div>Total Leaves: <span id="totalLeaves">0</span></div>


  <script src="testjs.js"></script>
