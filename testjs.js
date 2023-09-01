let holidaysArray = [];
let ha = [];

function inputArrayValues(inputArray, targetArray) {
  // Loop through the elements of the inputArray and push them into the targetArray
  for (let i = 0; i < inputArray.length; i++) {
    targetArray.push(inputArray[i]);
  }
}

function fetchHolidays() {
  fetch("read.php")
    .then((response) => response.json())
    .then((holidays) => {
      holidaysArray = holidays;
      inputArrayValues(holidaysArray, ha);
    });
}
// Call the function to fetch holidays
fetchHolidays();

let count = 0;
const leaveTypeSelect = document.getElementById("leaveType");
const halfDayOptions = document.getElementById("halfDayOptions");
const toDateSection = document.getElementById("toDateSection");
const halfDayTypeSelect = document.getElementById("halfDayType");
const submitButton = document.getElementById("submitButton");
const submitButton2 = document.getElementById("submitButton2");
const totalLeavesSpan = document.getElementById("totalLeaves");

const fromDateInput = document.getElementById("fromDate");
const toDateInput = document.getElementById("toDate");
const dateOptionsDiv = document.getElementById("dateOptions");

let initialFromDate = null;
let initialToDate = null;

fromDateInput.addEventListener("input", function () {
  initialFromDate = new Date(fromDateInput.value);
  // updateDateOptions();
});

toDateInput.addEventListener("input", function () {
  initialToDate = new Date(toDateInput.value);
  // updateDateOptions();
});

leaveTypeSelect.addEventListener("change", () => {
  if (leaveTypeSelect.value === "halfDay") {
    halfDayOptions.style.display = "block";
    toDateSection.style.display = "none";
  } else {
    halfDayOptions.style.display = "none";
    toDateSection.style.display = "block";
  }
});

halfDayTypeSelect.addEventListener("change", () => {
  if (halfDayTypeSelect.value === "secondHalf") {
    toDateSection.style.display = "block";
  } else {
    toDateSection.style.display = "none";
  }
  // updateDateOptions();
});

submitButton.addEventListener("click", () => {
  const fromDate = document.getElementById("fromDate").value;
  const toDate = document.getElementById("toDate").value;
  const leaveType = leaveTypeSelect.value;
  const halfDayType = halfDayTypeSelect.value;
  submitButton2.style.display = "block";

  console.log("From Date:", fromDate);
  if (leaveType === "fullDay") {
    console.log("To Date:", toDate);
    updateDateOptions();
  } else {
    console.log("Half Day Type:", halfDayType);
    if (halfDayType === "secondHalf") {
      console.log("To Date:", toDate);
      updateDateOptions();

      if (fromDate === toDate) {
        submitButton2.style.display = "none";
        count = 0; // Reset the count before recounting

        dateOptionsDiv.innerHTML = "";
        count += 0.5;
        totalLeavesSpan.textContent = count;
      }
    } else {
      submitButton2.style.display = "none";
      count = 0; // Reset the count before recounting

      dateOptionsDiv.innerHTML = "";
      count += 0.5;
      totalLeavesSpan.textContent = count;
    }
  }
});

submitButton2.addEventListener("click", () => {
  const selectedDayOptions = document.querySelectorAll(
    'input[type="radio"]:checked'
  );
  const halfDayType = halfDayTypeSelect.value;
  const leaveType = leaveTypeSelect.value;
  count = 0; // Reset the count before recounting

  selectedDayOptions.forEach((option) => {
    const selectedOption = option.value;

    if (selectedOption === "halfDay") {
      count += 0.5;
    } else if (selectedOption === "fullDay") {
      count += 1;
    }
  });

  if (halfDayType === "secondHalf") {
    count += 0.5;
  }
  if (leaveType === "fullDay") {
    count += 1;
  }

  // Update the displayed total leave count
  totalLeavesSpan.textContent = count;
});

function updateDateOptions() {
  const fromD = new Date(fromDateInput.value);
  fromD.setDate(fromD.getDate() + 1);
  const toD = new Date(toDateInput.value);
  dateOptionsDiv.innerHTML = "";

  while (fromD <= toD) {
    const dateString = fromD.toISOString().split("T")[0];
    const isHoliday = ha.some((holiday) => {
      return (
        holiday.evt_text !== "Working Saturday" &&
        holiday.evt_start === dateString &&
        holiday.evt_end === dateString
      );
    });

    const isSunday = fromD.getDay() === 0;
    const isWorkingSaturday = ha.some((holiday) => {
      return (
        holiday.evt_text === "Working Saturday" &&
        holiday.evt_start === dateString &&
        holiday.evt_end === dateString
      );
    });
    // console.log(isWorkingSaturday);

    const isNonWorkingSaturday = fromD.getDay() === 6 && !isWorkingSaturday;

    if (!isHoliday && !isSunday && !isNonWorkingSaturday) {
      const label = document.createElement("label");
      label.textContent = fromD.toDateString();

      const fullDayRadio = document.createElement("input");
      fullDayRadio.type = "radio";
      fullDayRadio.name = "dayOption_" + fromD.toISOString();
      fullDayRadio.value = "fullDay";
      fullDayRadio.checked = true;

      const halfDayRadio = document.createElement("input");
      halfDayRadio.type = "radio";
      halfDayRadio.name = "dayOption_" + fromD.toISOString();
      halfDayRadio.value = "halfDay";

      label.appendChild(fullDayRadio);
      label.appendChild(document.createTextNode("Full Day"));
      label.appendChild(halfDayRadio);
      label.appendChild(document.createTextNode("Half Day - First Half"));

      dateOptionsDiv.appendChild(label);
      dateOptionsDiv.appendChild(document.createElement("br"));
    }
    fromD.setDate(fromD.getDate() + 1);
  }

  const selectedHalfDayOption = document.querySelector(
    `input[name='halfDayType']:checked`
  );
  if (selectedHalfDayOption && selectedHalfDayOption.value === "secondHalf") {
    dateOptionsDiv.innerHTML = "";
    count += 0.5;
  }
}

dateOptionsDiv.addEventListener("input", handleDayOptionChange);

function handleDayOptionChange(event) {
  const selectedOption = event.target.value;
  const optionName = event.target.name;

  const dateMatch = optionName.match(/dayOption_(.+)/);
  if (!dateMatch) {
    return;
  }

  const optionDateStr = dateMatch[1];
  let currentOptionDate = new Date(optionDateStr);

  if (isNaN(currentOptionDate)) {
    return;
  }

  let firstDate = new Date(fromDateInput.value);
  let lastDate = new Date(toDateInput.value);
  if (selectedOption === "halfDay") {
    const nextDayOption = document.querySelector(
      `input[name='${optionName.replace("halfDay", "fullDay")}']`
    );
    if (nextDayOption) {
      nextDayOption.disabled = true;
    }

    if (currentOptionDate < toDateInput.valueAsDate) {
      toDateInput.valueAsDate = currentOptionDate;
      updateDateOptions();
    }
  }
  if (selectedOption === "fullDay") {
    const nextDayOption = document.querySelector(
      `input[name='${optionName.replace("fullDay", "halfDay")}']`
    );
    if (nextDayOption) {
      nextDayOption.disabled = false;
    }
  }
}
