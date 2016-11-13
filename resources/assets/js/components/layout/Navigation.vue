<template>
<div class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
            <a class="navbar-brand" href="/">Snelle Jelle</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav main_menu">
                <li><a href="/">Home</a></li>
                <li><a href="/products">Products</a></li>
                <li><a href="/cart">Cart</a></li>
            </ul>
            <ul class="nav">
                <li class="dropdown user_panel">
                    <a href="#" class="dropdown-toggle main" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                        <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="guest"><a href="/user/register.html">Register</a></li>
                        <li class="guest"><a href="/user/login.html">Login</a></li>
                        <li class="admin"><a href="/admin/products">Products</a></li>
                        <li class="admin"><a href="/admin/users">Users</a></li>
                        <li class="admin"><a href="/admin/plots">Plots</a></li>
                        <li class="user"><a href="/user/profile.html">Profile</a></li>
                        <li class="user logout"><a href="javascript:void(0)">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</div>
</template>


<script>
$(function() {
    var currentUrl = window.location.href;
    var currentPage = (currentUrl.split('/'));

    $(".main_menu li a").each(function() {
        var currentlink = $(this).attr('href').replace('/', '');
        if (currentlink == currentPage[3]) {
            $(this).parent('li').addClass('active');
        } else {
            $(this).parent('li').removeClass('active');
        }
    });

    // check if logged in..
    if (auth()) {
        // Things to do/hide when you're logged in
        $(".guest").remove();
        if (!admin()) {
            $(".admin").remove();
        }
        $(".user_panel .main").append($.cookie('user').username + " <span class='caret'></span>");

        $(".logout a").on("click", function() {
            $.removeCookie('user', {
                path: '/'
            });
            window.location = '/';
        });
    } else {
        $(".user_panel .main").append("Hey user! <span class='caret'></span>");
        $(".admin").remove();
        $(".user").remove();
    }
});
</script>
