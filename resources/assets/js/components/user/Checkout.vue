<template>
  <div class="container">
    <div class="check-out">
      <div class="bs-example4" data-example-id="simple-responsive-table">
        <div class="table-responsive">
          <table class="table-heading simpleCart_shelfItem">
            <tr>
              <td>Firstname *</td>
              <td><input id="firstname" type="text"></input></td>
            </tr>
            <tr>
              <td>Lastname *</td>
              <td><input id="lastname" type="text"></input></td>
            </tr>
            <tr>
              <td>Street *</td>
              <td><input id="street" type="text"></input></td>
            </tr>
            <tr>
              <td>Housenumber *</td>
              <td><input id="housenumber" type="text"></input></td>
            </tr>
            <tr>
              <td>Zipcode *</td>
              <td><input id="postalcode" type="text"></input></td>
            </tr>
            <tr>
              <td>City *</td>
              <td><input id="city" type="text"></input></td>
            </tr>
            <tr>
              <td>Country *</td>
              <td><input id="country" type="text"></input></td>
            </tr>
            <tr>
              <td>Phonenumber *</td>
              <td><input id="phonenumber" type="text"></input></td>
            </tr>
            <tr>
              <td>Payment method *</td>
              <td>
                <select id="paymentMethod">
                  <option value="1">IDEAL</option>
                  <option value="2">PayPal</option>
                  <option value="3">Mastercard</option>
                  <option value="4">Visa</option>
                </select>
              </td>
            </tr>
            <tr>
              <td><input id="agree" type="checkbox"></td>
              <td>With your order, you agree to our <b>Terms and Conditions</b>.</td>
            </tr>
            <tr>
              <td>* Required</td>
            </tr>
            <tr>
              <td>
                <button @click="finishPayment()" class="item_add hvr-grow">Pay</button>
                <label><a href="/cart" class="hvr-grow">Cancel</a></label>
              </td>
            </tr>
          </table>
        </div>
      </div>
    </div>
  </div>
</template>

<script type="text/javascript">
export default {
  methods: {
    finishPayment: function() {
      // Get the required address data
      var street = $("#street").val();
      var city = $("#city").val();
      var country = $("#country").val();
      var postalcode = $("#postalcode").val();
      var housenumber = $("#housenumber").val();

      // TODO: validation of the fields

      createAddress(street, city, country, postalcode, housenumber, insertOrder);

      function insertOrder(address_id) {
        var values = {
          user_id: 1,
          firstname: $("#firstname").val(),
          lastname: $("#lastname").val(),
          phonenumber: $("#phonenumber").val(),
          address_id: address_id
        };

        $.post(local + '/orders/create', JSON.stringify(values), function(result) {
          insertOrderlines();
        });
      }

      function insertOrderlines() {
        $.get(local + '/orders/last', function(lastOrderId) {
          var order_id;
          if(lastOrderId == 'undefined') {
              order_id = 1;
          } else {
              order_id = lastOrderId + 1;
          }
          var cartCookie = $.cookie('cart');
          for (var i = 0; i < cartCookie.length; i++) {
            $.ajax({
                url: local + '/products/' + cartCookie[i]["p"],
                async: false,
                dataType: 'json',
                success: function(product) {
                  var values = {
                    product_id: cartCookie[i]["p"],
                    order_id: order_id,
                    quantity: cartCookie[i]["q"],
                    product_price: product[0]['p_price']
                  };
                  $.post(local + '/orderlines/create', JSON.stringify(values), function(result) {});
                }
            });
            if(i+1 == cartCookie.length)
              message("success", "Your order has been paid");
          }
        });
      }
    }
  }
}
</script>
