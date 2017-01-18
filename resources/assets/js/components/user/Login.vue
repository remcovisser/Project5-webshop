<template>
<div class="container">
    <div class="login">
        <form>
            <div class="col-md-6 login-do">
                <div class="login-mail">
                    <input type="text" placeholder="Username" id="username">
                    <i class="glyphicon glyphicon-user"></i>
                </div>
                <div class="login-mail">
                    <input type="password" placeholder="Password" id="password">
                    <i class="glyphicon glyphicon-lock"></i>
                </div>
                <a class="news-letter " href="#">
                    <label class="checkbox1"><input type="checkbox" id="rememberMe"><i></i>Remember Me</label>
                </a>
                <label><button type="button" v-on:click="login" class="add-to item_add hvr-grow">Login</button></label>
            </div>
            <div class="col-md-6 login-right">
                <h3>Don't have an account?</h3>
                <p>Does it look like we are able to make money from a school project? Thought so.</p>
                <label><a href="/user/register.html" class="add-to item_add hvr-grow">Register</a></label>
            </div>
            <div class="clearfix"> </div>
        </form>
    </div>
</div>
</template>


<script type="text/javascript">
export default {
    methods: {
        login: function() {
            var username = $("#username").val();
            var password = md5($("#password").val());
            var expireTime;
            if (username == "" || password == "") {
                message("danger", "Please fill in all the fields.");
            } else {
                $.get(local + 'users/' + username + '/' + password, function(user) {
                    if (user[0]) {
                        var user_data = {
                            "user_id": user[0].user_id,
                            "username": user[0].username,
                            "email": user[0].email,
                            "date": user[0].date_of_birth,
                            "admin": user[0].admin
                        };
                        if($('#rememberMe').is(":checked")) {
                          expireTime = 7;
                        } else {
                          expireTime = 1;
                        }
                        $.cookie('user', user_data, {
                            expires: expireTime,
                            path: '/'
                        });
                        window.location = '/';
                    } else {
                        message("danger", "Wrong username / password.");
                    }
                });
            }
        }
    }
}
</script>
