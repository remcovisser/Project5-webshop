<template>
<div>
    <div class="form-group">
        <label for="username">Username</label>
        <input type="text" class="form-control" id="username" />
    </div>
    <div class="form-group">
        <label for="password">Password</label>
        <input type="password" class="form-control" id="password" />
    </div>
    <button v-on:click="login" id="submitFormButton" class="btn btn-default" name="login">Login</button>
</div>
</template>


<script type="text/javascript">
export default {
    methods: {
        login: function() {
            var username = $("#username").val();
            var password = md5($("#password").val());
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
                        $.cookie('user', user_data, {
                            expires: 1,
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
