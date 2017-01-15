<template>
<div class="container">
    <div class="login">

        <div class="col-md-6 login-do">
            <div class="login-mail">
                <input type="text" placeholder="Username" id="username" :value="user.username" disabled/>
                <i class="glyphicon glyphicon-user"></i>
            </div>
            <div class="login-mail">
                <input type="password" placeholder="Password" id="password">
                <i class="glyphicon glyphicon-lock"></i>
            </div>
            <div class="login-mail">
                <input type="text" placeholder="Email" id="email" :value="user.email">
                <i class="glyphicon glyphicon-envelope"></i>
            </div>
            <div class="login-mail">
                <input type="text" placeholder="Date Of Birth" id="date" :value="user.date_of_birth">
                <i class="glyphicon glyphicon-calendar"></i>
            </div>
            <label><button type="button" v-on:click="update" class="add-to item_add hvr-grow">Save Changes</button></label>
        </div>
        <div class="col-md-6 login-right">
            <h3>Completely Free Account</h3>
            <p>Pellentesque neque leo, dictum sit amet accumsan non, dignissim ac mauris. Mauris rhoncus, lectus tincidunt tempus aliquam, odio libero tincidunt metus, sed euismod elit enim ut mi. Nulla porttitor et dolor sed condimentum. Praesent porttitor
                lorem dui, in pulvinar enim rhoncus vitae. Curabitur tincidunt, turpis ac lobortis hendrerit, ex elit vestibulum est, at faucibus erat ligula non neque.</p>
        </div>
        <div class="clearfix"> </div>
    </div>
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
