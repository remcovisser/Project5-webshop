var root = location.protocol + '//' + location.host;
var local = 'http://localhost:8080/';
var live  = 'http://95.85.32.165:8080/';

document.writeln('<script type="text/javascript" src="'+root+'/includes/js/jquery-3.1.1.js"></script>');
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
  }
};
