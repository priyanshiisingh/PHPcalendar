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

// call all the elements from their ID
let count = 0;
const leaveTypeSelect = document.getElementById("leaveType");
const halfDayOptions = document.getElementById("halfDayOptions");
const toDateSection = document.getElementById("toDateSection");
const halfDayTypeSelect = document.getElementById("halfDayType");
const description = document.getElementById("description");
const submitButton = document.getElementById("submitButton");
const totalLeavesSpan = document.getElementById("totalLeaves");
const numdaysInput = document.getElementById("numdays");
const leaveType2Div = document.getElementById("leaveType2Div");
const leaveTypeSelect2 = document.getElementById("leaveType2");

const fromDateInput = document.getElementById("fromDate");
const toDateInput = document.getElementById("toDate");
const dateOptionsDiv = document.getElementById("dateOptions");

let initialFromDate = null;
let initialToDate = null;

// initialize the from and to dates 
fromDateInput.addEventListener("input", function () {
  initialFromDate = new Date(fromDateInput.value);
});

toDateInput.addEventListener("input", function () {
  initialToDate = new Date(toDateInput.value);
});

// 1. Leave type select - control what elements to be shown at what type of leave selected
leaveTypeSelect.addEventListener("change", () => {
  // if half day is selected view the half day options. keeping the to date option hidden 
  if (leaveTypeSelect.value === "halfDay") {
    halfDayOptions.style.display = "block";
    toDateSection.style.display = "none";
    leaveType2Div.style.display="none";
    updateDateOptions();
  }else{
    // if full day, view the to date options 
    halfDayOptions.style.display = "none";
    toDateSection.style.display = "block";
    updateDateOptions();
  }
})
leaveTypeSelect2.addEventListener("change", () => {
  console.log(leaveTypeSelect2.value);
  if (leaveTypeSelect2.value === "l2halfDay") {
    // Check if the to date is selected
    if (toDateInput.value !== "") {
      // Get the to date as a Date object
      const toD = new Date(toDateInput.value);

      // Generate the name of the radio button for the to date
      const radioName = `dayOption_${toD.toISOString()}`;

      // Select the "first half" radio button for the to date
      const firstHalfRadio = document.querySelector(`input[name='${radioName}'][value='halfDay']`);
      if (firstHalfRadio) {
        firstHalfRadio.checked = true;
      }

      // Update the leave count
      updateLeaveCount();
    }
  }else if (leaveTypeSelect2.value === "l2fullDay") {
    // Check if the to date is selected
    if (toDateInput.value !== "") {
      // Get the to date as a Date object
      const toD = new Date(toDateInput.value);

      // Generate the name of the radio button for the to date
      const radioName = `dayOption_${toD.toISOString()}`;

      // Select the "full day" radio button for the to date
      const fullDayRadio = document.querySelector(`input[name='${radioName}'][value='fullDay']`);
      if (fullDayRadio) {
        fullDayRadio.checked = true;
      }

      // Update the leave count
      updateLeaveCount();
    }
  }
})

// 2. Half Day option select - control what elements are shown on selecting which half of the day to take leave for
halfDayTypeSelect.addEventListener("change", () => {
  if (halfDayTypeSelect.value === "secondHalf") {
    // if second half is selected the show the to date options
    toDateSection.style.display = "block";
    leaveTypeSelect2.value="l2fullDay";
    updateDateOptions();
    if(initialFromDate.valueOf() === initialToDate.valueOf()){
      // if from and to dates are equal don't show the option to select which half of the day for the last day 
      leaveType2Div.style.display="none";
      updateDateOptions();
    }else{
      // if from and to dates are not equal show the option to select which half of the day for the last day 
      leaveType2Div.style.display="block";
      updateDateOptions();
    }
  }else{
    // if first half is selcted don't show the to date options 
    toDateSection.style.display = "none";
    updateDateOptions();
  }
})

// 3. Add event listeners to the date selectors 
toDateInput.addEventListener("change", function () {
  if(initialFromDate.valueOf() === initialToDate.valueOf()){
    // if from and to dates are equal don't show the option to select which half of the day for the last day 
    leaveType2Div.style.display="none";
    updateDateOptions();
  }else{
    // if from and to dates are not equal show the option to select which half of the day for the last day 
    leaveType2Div.style.display="block";
    updateDateOptions();
  }
});
fromDateInput.addEventListener("change", function () {
  updateDateOptions();
});

// 4. FUNCTIONS

// 4.1 Update leave count function 
function updateLeaveCount(){
  const selectedDayOptions = document.querySelectorAll(
    'input[type="radio"]:checked'
  );
  let count = 0; // Reset the count before recounting
  let halfDayType = halfDayTypeSelect.value;
  const leaveType = leaveTypeSelect.value;
  const fromDate = document.getElementById("fromDate").value;
  const toDate = document.getElementById("toDate").value;

  if (leaveType === "fullDay") {
    halfDayType="";
  }

  selectedDayOptions.forEach((option) => {
    const selectedOption = option.value;

    if (selectedOption === "halfDay") {
      count += 0.5;
    } else if (selectedOption === "fullDay") {
      count += 1;
    }
  });


  if (leaveType === "fullDay") {
    if (fromDate === toDate) {
      count = 0; // Reset the count before recounting
      dateOptionsDiv.innerHTML = "";
      count += 1;
      totalLeavesSpan.textContent = count;
      numdaysInput.value=count;
    }else{
      count += 1;
    }
  }


  if (halfDayType === "secondHalf") {
    if (fromDate === toDate) {
      count = 0; // Reset the count before recounting

      dateOptionsDiv.innerHTML = "";
      count += 0.5;
      totalLeavesSpan.textContent = count;
      numdaysInput.value=count;
    }else{
      count += 0.5;
    }
  }else if (halfDayType === "firstHalf") {
    count = 0; // Reset the count before recounting

    dateOptionsDiv.innerHTML = "";
    count += 0.5;
    totalLeavesSpan.textContent = count;
    numdaysInput.value=count;
  }

  // Update the displayed total leave count
  totalLeavesSpan.textContent = count;
  numdaysInput.value=count;
}

// 4.2 Update Date options  
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
      label.className += ' p-2';

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
  }

  updateLeaveCount();
}

dateOptionsDiv.addEventListener("input", handleDayOptionChange);


// 4.3 Handle day options change  
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

  if (selectedOption === "halfDay") {
    const nextDayOption = document.querySelector(
      `input[name='${optionName.replace("halfDay", "fullDay")}']`
    );
    if (nextDayOption) {
      nextDayOption.disabled = false;
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

  updateLeaveCount();
}
