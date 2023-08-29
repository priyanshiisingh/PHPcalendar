$(document).ready(function () {
  $("#uploadForm").submit(function (event) {
    event.preventDefault();

    var formData = new FormData(this);

    $.ajax({
      type: "POST",
      url: "upload.php",
      data: formData,
      contentType: false,
      processData: false,
      success: function (response) {
        $(".toast-body").text(response.message);
        var toaster = new bootstrap.Toast(document.getElementById("toaster"));
        if (response.status === "success") {
          $("#toaster").removeClass("bg-danger").addClass("bg-success");
          $("#UploadModal").modal("hide");
        } else {
          $("#toaster").removeClass("bg-success").addClass("bg-danger");
        }
        toaster.show();
      },
    });
  });
});

document.getElementById("calReset").addEventListener("click", function () {
    $.ajax({
      url: "entertodbandcsv.php",
      method: "GET",
      success: function (response) {
        console.log(response);
        var toaster = new bootstrap.Toast(document.getElementById("toaster"));
        var message = response.message;
  
        if (response.status === "success") {
          $("#toaster").removeClass("bg-danger").addClass("bg-success");
        } else if (response.status === "error") {
          $("#toaster").removeClass("bg-success").addClass("bg-danger");
        }
  
        $(".toast-body").text(message);
        toaster.show();
      },
      error: function (xhr, status, error) {
        console.log(xhr);
        errorMessage="";
        var toaster = new bootstrap.Toast(document.getElementById("toaster"));
        if(xhr.responseText.includes("error")){
            const startIndex = xhr.responseText.indexOf('"message":') + '"message":'.length;
const endIndex = xhr.responseText.indexOf('}', startIndex);
errorMessage=xhr.responseText.substring(startIndex, endIndex);
        }

        $("#toaster").removeClass("bg-success").addClass("bg-danger");
        $(".toast-body").text(errorMessage);
        toaster.show();
      },
    });
  });
  
