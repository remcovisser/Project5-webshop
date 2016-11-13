<template>
<div>
    <div class="form-group">
        <label for="Username">Username</label>
        <input type="text" class="form-control" id="username" />
    </div>
    <div class="form-group">
        <label for="password">Password</label>
        <input type="password" class="form-control" id="password" />
    </div>
    <div class="form-group">
        <label for="email">Emailaddress</label>
        <input type="email" class="form-control" id="email" />
    </div>
    <div class="form-group">
        <label for="date">Date of birth</label>
        <input type="text" class="form-control" id="date" />
    </div>
    <button @click="register" id="submitFormButton" class="btn btn-default" name="save">Register</button>
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
