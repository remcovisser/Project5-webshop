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
      var firstname =  $("#firstname").val();
      var lastname = $("#lastname").val();
      var phonenumber = $("#phonenumber").val();
      var street = $("#street").val();
      var city = $("#city").val();
      var country = $("#country").val();
      var postalcode = $("#postalcode").val();
      var housenumber = $("#housenumber").val();
      var user_id = $.cookie('user').user_id;
      var nextStep = true;

      // Validation of the fields
      if(!$("#agree").is(':checked')) {
        nextStep = false;
        message("danger", "You have the agree with the Terms and Conditions.");
      }
      if (firstname == "" || lastname == "" || phonenumber == "" || street == "" || city == "" || postalcode == "" || housenumber == "") {
        nextStep = false;
        message("danger", "Please fill in all the required fields.");
      }

      // If there are no errors
      if(nextStep) {
        // Select or create the address based on the input data from the user
        createAddress(street, city, country, postalcode, housenumber, insertOrder);

        function insertOrder(address_id) {
          var values = {
            user_id: user_id,
            firstname: firstname,
            lastname: lastname,
            phonenumber: phonenumber,
            address_id: address_id
          };

          $.post(local + '/orders/create', JSON.stringify(values), function(result) {
            insertOrderlines();
          });
        }

        function insertOrderlines() {
          $.get(local + '/orders/last', function(lastOrderId) {
            console.log(lastOrderId);
            var order_id = lastOrderId[0]['order_id'] + 1;

            // Get the product info to store it in the orderline
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
              // Last itteration
              if(i+1 == cartCookie.length)
                // TODO empty cart, ridirect
                message("success", "Your order has been paid, you will be ridirected to the index in 5 seconds");
                setInterval(orderFinished, 5000)
            }
          });
        }
        
        function orderFinished() {
            $.removeCookie('cart', { path: '/' });
            window.location.replace("/");
        }
      }
    }
  }
}
</script>
