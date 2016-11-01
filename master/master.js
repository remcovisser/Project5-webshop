document.writeln('<script type="text/javascript" src="../javascript/jquery-3.1.1.js"></script>');

var root = "file:///Users/remcovisser/code/school/hr/jaar2/blok1/project5/webshop/Project5-webshop";

document.onreadystatechange = function () {
$( "head" ).load( root + "/views/partials/head.html" );
};
