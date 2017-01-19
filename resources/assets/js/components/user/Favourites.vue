<template>
  <div class="container">
    <div class="check-out">

      <div id="favourites" class="bs-example4" data-example-id="simple-responsive-table">
        <div class="table-responsive">
          <table class="table-heading simpleCart_shelfItem">
            <tr>
              <th>Product</th>
              <th>Favourite</th>
            </tr>
            <tr v-for="favourite in favourites">
            <td><a :href="'/products/product.html?id='+favourite.product_id">{{ favourite.p_name }}</a></td>
            <td><button type="button" @click="remove(favourite.product_id)" class="item_add hvr-grow">Remove</button></td>
            </tr>
          </table>
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
    $.get(local + 'favourites/' + user_id, function(favourites) {
      if(favourites.length == 0) {
        message("danger", "You have no favourited products");
        $("#favourites").hide();
      } else {
        self.favourites = favourites;
      }
    });
  },
  data() {
    return {
      favourites: []
    }
  },
  methods: {
    remove: function(product_id) {
      var userCookie = $.cookie('user');
      var self = this;
      var deleteFavouriteRequest = $.ajax({
        url: local+'favourites/'+userCookie.user_id+'/'+product_id,
        method: "DELETE"
      });

      deleteFavouriteRequest.done(function( msg ) {
        $.get(local + 'favourites/' + userCookie.user_id, function(favourites) {
          self.favourites = favourites;
          if(favourites == 0) {
            message("danger", "You have no favourited products");
            $("#favourites").hide();
          } else {
            message("success", "You no longer favourite this product");
          }
        });
      });
    }
  }
}
</script>
