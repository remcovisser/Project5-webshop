<template>
<div class="container">
    <ul>
      <table class="table">
        <tr>
          <th>Username</th>
          <th></th>
        </tr>
      <tbody id="demo" v-for="user in users">
          <tr>
            <td>{{user.username}}</td>
            <td><a class="btn" name="view" :href="'/wishlists/user.html?id=' + user.user_id">View wishlist</a></td>
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
    $.get(local + '/wishlist', function(users) {
        self.users = users;
      });
  },
  data() {
    return {
      users: []
    }
  },
  methods: {}
}


</script>
