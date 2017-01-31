<template>
<div>
    <ul>
      <table class="table">
        <tr>
          <th>Username</th>
          <th>Emailaddress</th>
          <th>Date of birth</th>
          <th>Banned</th>
          <th>Update</th>
          <th>Delete</th>
        </tr>
      <tbody id="demo" v-for="user in users">
          <tr>
            <td>{{user.username}}</td>
            <td>{{user.email}}</td>
            <td>{{user.date_of_birth}}</td>
            <td>{{user.boolean_banned}}</td>
            <td><a class="btn btn-primary" :href="'/admin/users/edit.html?id=' + user.user_id" name="edit">Update</a></td>
            <td><button class="btn" name="delete" v-on:click="deleteData(user.user_id)">Delete</button></td>
          </tr>
      </tbody>
      </table>
    </ul>
  </div>
</template>

<script>

export default {
  created() {
    var self = this;
    $.get(local + '/users', function(users) {
        self.users = users;
      });
  },
  data() {
    return {
      users: []
    }
  },
  methods: {
    deleteData: function (id) {
      var localDelete = local+'users/'+id;
      // HTTP post request
      var xhr = new XMLHttpRequest();
      xhr.open('DELETE', localDelete);
      var x = $.cookie("user");
      xhr.setRequestHeader('authorization', x.token);
      // Send our values
      xhr.send();
      alert("User was deleted.");
      window.location = window.location;
    }
  }
}


</script>
