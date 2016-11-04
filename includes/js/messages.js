function message(type, message, time = 0)
{
  $("#messages").css("display", "block");
  $(".alert-success").css("display", "none");
  $(".alert-info").css("display", "none");
  $(".alert-warning").css("display", "none");
  $(".alert-danger").css("display", "none");

  if(type == "success") {
    $(".success-value").text(message);
    $(".alert-success").css("display", "block");
  }

  if(type == "info") {
    $(".info-value").text(message);
    $(".alert-info").css("display", "block");
  }

  if(type == "warning") {
    $(".warning-value").text(message);
    $(".alert-warning").css("display", "block");
  }

  if(type == "danger") {
    $(".danger-value").text(message);
    $(".alert-danger").css("display", "block");
  }

  if(time != 0) {
    setTimeout(function() {
        $("#messages").css("display", "none");
    }, time);
  }
}
