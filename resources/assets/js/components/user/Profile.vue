<template>
<div>
    <div class="form-group">
        <label for="Username">Username</label>
        <input type="text" class="form-control" id="username" :value="user.username" disabled/>
    </div>
    <div class="form-group">
        <label for="password">Password</label>
        <input type="password" class="form-control" id="password" placeholder="Password" />
    </div>
    <div class="form-group">
        <label for="email">Emailaddress</label>
        <input type="email" class="form-control" id="email" :value="user.email" />
    </div>
    <div class="form-group">
        <label for="date">Date of birth</label>
        <input type="text" class="form-control" id="date" :value="user.date_of_birth" />
    </div>
    <button @click="update" id="submitFormButton" class="btn btn-default" name="save">Save changes</button>
</div>
</template>

<script type="text/javascript">
export default {
    created() {
        var self = this;
        var user_id = $.cookie('user').user_id;
        $.get(local + 'users/' + user_id, function(user) {
            self.user = user[0];
        });
    },
    data() {
        return {
            user: [],
        }
    },
    methods: {
        update: function() {
            var self = this;
            var password = $("#password").val();
            var email = $("#email").val();
            var date = $("#date").val();
            if (password == "" || email == "" || date == "") {
                message("danger", "Please fill in all the fields.");
            } else if (!validate.password(password)) {
                message("danger", "Password has to be at least 5 characters.");
            } else if (!validate.email(email)) {
                message("danger", "Please enter a valid email.");
            } else if (!validate.date(date)) {
                message("danger", "Please enter a valid date (yyyy-mm-dd).");
            } else {
                var user_data = {
                    user_id: self.user.user_id,
                    username: self.user.username,
                    password: md5(password),
                    email: email,
                    date_of_birth: date
                };
                $.cookie('user', user_data, {
                    expires: 1,
                    path: '/'
                });

                var xhr = new XMLHttpRequest();
                xhr.open('PUT', local + 'users/' + self.user.user_id);
                xhr.send(JSON.stringify(user_data));

                message("success", "Your account has been updated.")
            }
        }
    }
}
</script>
