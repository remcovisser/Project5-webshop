<template>
<div class="banner-top">
    <div class="container">
        <div class="page-top">
            <h1 id="pageName"></h1>
            <em></em>
            <h2 id="subPage">
                <a href="/">Home</a>
            </h2>
        </div>
    </div>
</div>
</template>

<script type="text/javascript">
$(function() {
    var baseUrl = window.location.pathname;
    var urlParts = baseUrl.split("/").filter(function(n) {
        return n != "";
    });
    var url = "/";
    for (var i = 0; i < urlParts.length; i++) {
        url += urlParts[i] + "/";
        // Remove file extension
        var part = helper.capitalize(urlParts[i].split(".")[0]);
        // If last item
        if (i == (urlParts.length - 1)) {
            $("#pageName").text(part);
            var data = '<label>/</label> ' + part;
            $("#subPage").append(data);
        } else {
            var data = '<label>/</label>  <a href="' + url + '">' + part;
            $("#subPage").append(data);
        }
    }
});
</script>
