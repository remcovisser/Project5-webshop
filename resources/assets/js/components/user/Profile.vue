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
            <label><button type="button" v-on:click="update" class="add-to item_add hvr-grow">Save user</button></label>
        </div>
        <div class="col-md-6 settings">
            <h3>Other settings</h3>
                <div id="wishlistContainer" class="soft-hide">
                  <h4>Wishlist</h4>
                  Private <input type="checkbox" id="private"/>
                </div>

                <div class="clearfix"> </div>
                <label><button type="button" v-on:click="updateSettings" class="add-to item_add hvr-grow">Save settings</button></label>
                <label><a href="/user/orders.html" class="add-to item_add hvr-grow">Order history</a></label>
            </div>
        </div>
    </div>
</div>
</template>

<script type="text/javascript">
export default {
    created() {
        var self = this;
        var user_id = $.cookie('user').user_id;
        self.user_id = user_id;
        $.get(local + 'users/' + user_id, function(user) {
            self.user = user[0];
        });
        $.get(local + 'wishlist/' + user_id, function(data) {
            console.log(data);
            if(data.length > 0) {
              $("#wishlistContainer").show();
              if(data[0].hidden) {
                $("#private").prop('checked', true);
              }
            }
        });
    },
    data() {
        return {
            user: [],
            user_id: 0
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
                var x = $.cookie("user");
                xhr.setRequestHeader('authorization', x.token);
                xhr.send(JSON.stringify(user_data));

                message("success", "Your account has been updated.")
            }
        },
        updateSettings: function() {
            var self = this;
            var pvt;
            if($('#private').is(':checked')){
                pvt = 1;
            }
            else {
                pvt = 0;
            }

            var user_data = {
                hidden: pvt
            };

            var xhr = new XMLHttpRequest();
            xhr.open('PUT', local + 'wishlist/' + self.user.user_id);
            var x = $.cookie("user");
            xhr.setRequestHeader('authorization', x.token);
            xhr.send(JSON.stringify(user_data));

            message("success", "Your settings has been updated.")
        }
    }
}
</script>
