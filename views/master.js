document.writeln('<script type="text/javascript" src="../javascript/jquery-3.1.1.js"></script>');


document.onreadystatechange = function () {
  if (document.readyState == 'complete' ) {
    var root = "file:///Users/remcovisser/code/school/hr/jaar2/blok1/project5/webshop/Project5-webshop";

    $( "head" ).load( root + "/master/partials/head.html" );

    $.get(root + "/master/partials/navigation.html", function (data) {
      $("#content").before(data);
    });

    $.get(root + "/master/partials/footer.html", function (data) {
      $("#content").after(data);
    });
  }
};
