<template>
<div class="container">
    <div class="login">
        <div class="col-md-6 login-do">
            <div class="login-mail">
                <input type="text" placeholder="Username" id="username">
                <i class="glyphicon glyphicon-user"></i>
            </div>
            <div class="login-mail">
                <input type="password" placeholder="Password" id="password">
                <i class="glyphicon glyphicon-lock"></i>
            </div>
            <div class="login-mail">
                <input type="text" placeholder="Email" id="email">
                <i class="glyphicon glyphicon-envelope"></i>
            </div>
            <div class="login-mail">
                <input type="text" placeholder="Date Of Birth" id="date">
                <i class="glyphicon glyphicon-calendar"></i>
            </div>
            <label><button type="button" v-on:click="register" class="add-to item_add hvr-grow">Register</button></label>
        </div>
        <div class="col-md-6 login-right">
            <h3>Already have an account?</h3>
            <label><a href="/user/login.html" class="add-to item_add hvr-grow">Login</a></label>
        </div>
        <div class="clearfix"> </div>
    </div>
</div>
</template>

<script type="text/javascript">
export default {
    methods: {
        register: function() {
            var username = $("#username").val();
            var password = $("#password").val();
            var email = $("#email").val();
            var date = $("#date").val();
            console.log(username, password, email, date);
            if (username == "" || password == "" || email == "" || date == "") {
                message("danger", "Please fill in all the fields.");
            } else if (!validate.uniqueUsername(username)) {
                message("danger", "This username has already been taken.");
            } else if (!validate.password(password)) {
                message("danger", "Password has to be at least 5 characters.");
            } else if (!validate.email(email)) {
                message("danger", "Please enter a valid email.");
            } else if (!validate.date(date)) {
                message("danger", "Please enter a valid date (yyyy-mm-dd).");
            } else {
                var values = {
                    username: username,
                    password: md5(password),
                    email: email,
                    date_of_birth: date
                };
                values = JSON.stringify(values);

                $.post(local + '/users/create', values, function(result) {
                    message("success", "Your account has been created.")
                });
            }
        }
    }
}
</script>
