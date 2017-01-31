<template>
  <div>
      <div class="form-group">
          <label for="Username">Username</label>
          <input type="text" class="form-control" id="username" />
      </div>
      <div class="form-group">
          <label for="password">Password</label>
          <input type="password" class="form-control" id="password"/>
      </div>
      <div class="form-group">
          <label for="email">Emailaddress</label>
          <input type="email" class="form-control" id="email"/>
      </div>
      <div class="form-group">
          <label for="date">Date of birth</label>
          <input type="text" class="form-control" id="date" disabled/>
      </div>
      <div class="form-group">
          <label for="banned">Banned</label>
          <div class="radio">
              <label>
                  <input type="radio" id="banned_y" name="banned" value="1"> Yes
              </label>
          </div>
          <div class="radio">
              <label>
                  <input type="radio" id="banned_n" name="banned" value="0"> No
              </label>
          </div>
      </div>
      <button v-on:click="saveData" id="submitFormButton" class="btn btn-default" name="save">Save changes</button>
  </div>
</template>

<script>
var ourId = (window.location.href.split('?id='))[1];

export default {
  created() {
        var xhr = new XMLHttpRequest()
        var self = this
        xhr.open('GET', local+'users/'+ourId)
        var x = $.cookie("user");
        xhr.setRequestHeader('authorization', x.token);
        xhr.onload = function () {
            // Get values to show
            self.values = (JSON.parse(xhr.responseText))[0];
            this.values = (JSON.parse(xhr.responseText))[0];

            var date = new Date(self.values.date_of_birth);
            var date = date.getFullYear() + '-' + (date.getMonth()+1) + '-' + date.getDate();
            // Place values in fields
            document.getElementById('username').value = self.values.username;
            document.getElementById('email').value = self.values.email;
            document.getElementById('date').value = date;
            if(self.values.boolean_banned == 0) {
                $("#banned_n").prop("checked", true);
            }
            else {
                $("#banned_y").prop("checked", true);
            }
        }
        xhr.send();
  },
  methods: {
    saveData: function () {
        // Place them in variables for the form checks
        var username = document.getElementById('username').value;
        var password = document.getElementById('password').value;
        var email    = document.getElementById('email').value;
        var date     = document.getElementById('date').value;
        var boolean_banned = $('input[name=banned]:checked').val();

        if(username == "" || email == ""){
          message("danger", "Please fill in al the fields");
        }
        else if(!validate.email(email)) {
          message("danger", "Please enter a valid email");
        }
        else {
            if(password.length > 4) {
                password = md5(password);
            }
            else {
                password = this.values.password;
            }
            // Place the data in an object to convert to a json string
            var values = {
                user_id : this.values.user_id,
                username : username,
                password : password,
                email : email,
                date_of_birth : date,
                boolean_banned : boolean_banned
            };

            // Convert object to jsonstring
            values = JSON.stringify(values);
            // HTTP post request
            var xhr = new XMLHttpRequest();
            xhr.open('PUT', local+'users/'+ourId);
            var x = $.cookie("user");
            xhr.setRequestHeader('authorization', x.token); 
            // Send our values
            xhr.send(values);

            alert("Your data has been updated!");
            window.location = '/admin/users/';
        }
    }
  }
}

</script>
