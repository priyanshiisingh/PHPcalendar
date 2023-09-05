<div class="col-md-12">
  <div class="card">
    <div class="card-header">
      <h4 class="card-title mb-0">Leave Application Form</h4>
    </div>
    <div class="card-body">
      <form action="" method="POST">
        <div class="row">
          <div class="col-md-4 p-2">
            <div id="FromDateSection">
              <label for="fromDate">From Date:</label>
              <input type="date" id="fromDate" name="fromdate" class="form-control" required>
            </div>
          </div>
          <div class="col-md-4 p-2">
            <div>
              <label for="leaveType">Leave Type:</label>
              <select id="leaveType" name="leavetype" class="form-control" required>
                <option selected disabled>Select</option>
                <option value="fullDay">Full Day</option>
                <option value="halfDay">Half Day</option>
              </select>
            </div>
          </div>
          <div class="col-md-4 p-2">
            <div id="halfDayOptions" style="display: none;">
              <label for="halfDayType">Half Day:</label>
              <select id="halfDayType" name="halfdaytype" class="form-control">
                <option selected disabled>Select</option>
                <option value="firstHalf">First Half</option>
                <option value="secondHalf">Second Half</option>
              </select>
            </div>
          </div>

        </div>
        <div class="row">
          <div class="col-md-6 p-2">
            <div id="toDateSection" style="display: none;">
              <label for="toDate">To Date:</label>
              <input type="date" id="toDate" name="todate" class="form-control">
            </div>
          </div>
          <div class="col-md-6 p-2">
            <div id="leaveType2Div" style="display: none;">
              <label for="leaveType2">Leave Type:</label>
              <select id="leaveType2" name="leavetype2" class="form-control" required>
                <option selected disabled>Select</option>
                <option value="l2fullDay">Full Day</option>
                <option value="l2halfDay">Half Day - First Half</option>
              </select>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6 p-2">
            <div>
              <label for="description">Description</label>
              <input type="text" name="description" id="description" required class="form-control">
            </div>
          </div>
          <!-- <div class="col-md-6 p-2 d-flex align-items-end justify-content-start">
												<button id="submitButton" type="button"
													class="btn btn-primary h-50">Check</button>
											</div> -->
        </div>
        <div class="row">
          <div class="col-12 p-2 d-flex align-items-center justify-content-evenly">
            <div id="dateOptions" style="display: none;"></div>
          </div>
        </div>
        <div class="row">
          <div class="p-2">
            <div class="p-2 border border-secondary">Total Leaves: <span id="totalLeaves">0</span></div>
            <input type="hidden" id="numdays" name="numdays" value="0" class="form-control">
          </div>
        </div>

        <div class="row">
          <!-- Final submit button -->
          <div class="col-12 p-2 d-flex align-items-center justify-content-center">

            <button id="apply" name="apply" type="submit" class="btn btn-primary">Submit</button>
          </div>
        </div>

      </form>
      <script src="testjs.js"></script>
    </div>
  </div>
</div>