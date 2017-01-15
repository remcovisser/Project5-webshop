<template>
<div>
    <div class="header">
        <div class="container">
            <div class="head">
                <div class=" logo">
                    <a href="/"><img src="/images/logo.png" alt=""></a>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="head-top">
                <div class="col-sm-8 col-md-offset-2 h_menu4">
                    <nav class="navbar nav_bottom" role="navigation">
                        <div class="navbar-header nav_2">
                            <button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
                              <span class="sr-only">Toggle navigation</span>
                              <span class="icon-bar"></span>
                              <span class="icon-bar"></span>
                              <span class="icon-bar"></span>
                            </button>
                        </div>
                        <div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
                            <ul class="nav navbar-nav nav_1">
                                <li><a href="/">Home</a></li>
                                <li><a href="/products">Products</a></li>
                                <li class="guest"><a href="/user/login.html">Login</a></li>
                                <li class="guest"><a href="/user/register.html">Register</a></li>
                                <li class="user"><a href="javascript:void(0)" id="logout">Logout</a></li>
                                <li class="user"><a href="/user/profile.html">Profile</a></li>
                            </ul>
                        </div>
                    </nav>
                </div>
                <div class="col-sm-2 search-right">
                    <ul class="heart">
                        <li><a href="#"><span class="glyphicon glyphicon-heart" aria-hidden="true"></span></a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a></li>
                        <li><a href="/cart"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span></a></li>
                    </ul>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
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

        $("#logout").on("click", function() {
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
