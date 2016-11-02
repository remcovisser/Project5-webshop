document.writeln('<script type="text/javascript" src="../includes/js/jquery-3.1.1.js"></script>');
document.writeln('<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/vue/1.0.18/vue.min.js"></script>');

document.onreadystatechange = function () {
  if (document.readyState == 'complete' ) {

    var root = location.protocol + '//' + location.host;

    $("head" ).load( root + "/includes/master/partials/head.html" );

    $.get(root + "/includes/master/partials/navigation.html", function (data) {
      $("#content").before(data);
    });

    $.get(root + "/includes/master/partials/footer.html", function (data) {
      $("#content").after(data);
    });
  }
};
