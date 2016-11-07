var root = location.protocol + '//' + location.host;
var local = "http://localhost:8080/";

var admin = false;
var user = false;

document.writeln('<script type="text/javascript" src="'+root+'/includes/js/jquery-3.1.1.js"></script>');
document.writeln('<script type="text/javascript" src="'+root+'/includes/js/jquery.cookie.js"></script>');
document.writeln('<script type="text/javascript" src="'+root+'/includes/js/messages.js"></script>');
document.writeln('<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/vue/1.0.18/vue.min.js"></script>');


document.onreadystatechange = function () {
  if (document.readyState == 'complete' ) {
    $("head" ).load( root + "/includes/master/partials/head.html" );

    $.get(root + "/includes/master/partials/navigation.html", function (data) {
      $("#content").before(data);
    });

    $.get(root + "/includes/master/partials/footer.html", function (data) {
      $("#content").after(data);
    });


    $(".form-control").keyup(function(event){
        if(event.keyCode == 13){
            $("#submitFormButton").click();
        }
    });

  }
};

function getCookie(name) {
  var value = "; " + document.cookie;
  var parts = value.split("; " + name + "=");
  if (parts.length == 2) return parts.pop().split(";").shift();
}

if(document.cookie != "") {
    if(getCookie("user") != undefined) {
    var parts = (document.cookie.split("user="))[1];
    var userVals = JSON.parse(parts);

    if(userVals) {
      if(userVals.admin === 1){
        user = true;
        admin = true;
      }else {
        user = true;
      }
    }
  }
}
