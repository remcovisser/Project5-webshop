<template>
<div class="container">
    <div class="check-out">
        <div class="bs-example4" data-example-id="simple-responsive-table">
            <div class="table-responsive">
                <table class="table-heading simpleCart_shelfItem">
                    <tr>
                        <th class="table-grid">Item</th>
                        <th>Price</th>
                        <th>quantity</th>
                        <th>Subtotal</th>
                    </tr>
                    <tr v-for="product in products" class="cart-header" :id="'product-'+product.product_id">
                        <td class="ring-in">
                            <a :href="'/products/product.html?id='+product.product_id" class="at-in"><img :src="product.p_image" class="img-responsive" :alt="product.p_image"></a>
                            <div class="sed">
                                <h5><a :href="'/products/product.html?id='+product.product_id">{{product.p_name}}</a></h5>
                                <p>{{product.p_description}}</p>
                            </div>
                            <div class="clearfix"></div>
                        </td>
                        <td>{{product.p_price}}</td>
                        <td><input class="quantity" :value="product.quantity" type="number" @keyup="quantityChange(product.product_id, $event)"></td>
                        <td class="item_price">${{product.subtotal}}</td>
                        <td><button @click="removeProduct(product.product_id)" type="button" class="item_add hvr-grow">Remove</button></td>
                    </tr>
                    <tr>
                      <td colspan="5"><hr></td>
                    </tr>
                    <tr>
                        <th colspan="3">Total:</th>
                        <td>
                            <p id="totalPrice">${{sum}}</p>
                        </td>
                        <td><button @click="emptyCart()" class="item_add hvr-grow">Empty Cart</button></td>
                    </tr>
                    <tr>
                      <td id="check-out-authenticated"><label><a href="/cart/checkout.html" class="add-to item_add hvr-grow">Checkout</a></label></td>
                      <td id="check-out">Please <a href="/user/login.html">Login</a> or <a href="/user/register.html">Register</a> to finish your order.</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <div class="clearfix"></div>
</div>
</template>


<script type="text/javascript">
var cartCookie = $.cookie('cart');
var userCookie = $.cookie('user');
$(function(){
  if (userCookie == undefined || userCookie.length == 0) {
    $("#check-out-authenticated").remove();
  } else {
    $("#check-out").remove();
  }
});
export default {
    created() {
        if (cartCookie == undefined || cartCookie.length == 0) {
            $(function() {
                message("danger", "Your cart is empty");
                $(".check-out").remove();
            });
        } else {
            var self = this;
            for (var i = 0; i < cartCookie.length; i++) {
                $.ajax({
                    url: local + '/products/' + cartCookie[i]["p"],
                    async: false,
                    dataType: 'json',
                    success: function(product) {
                        product[0]['quantity'] = cartCookie[i]["q"];
                        product[0]['subtotal'] = product[0]['p_price'] * cartCookie[i]["q"]
                        self.products.push(product[0]);
                    }
                });
            }
            this.sumCart();
        }
    },
    data() {
        return {
            products: [],
            sum: 0
        }
    },
    methods: {
        emptyCart: function() {
            $.removeCookie('cart', {
                path: '/'
            });
            this.products = [];
            this.sum = 0;
            $(".check-out").remove();
            message("success", "Your cart has been emptied");
        },
        quantityChange: function(product_id, e) {
            var quantity = e.target.value;
            var self = this;
            var values = [];
            for (var i = 0; i < cartCookie.length; i++) {
                if (quantity <= 0) {
                    if (cartCookie[i]["p"] != product_id) {
                        values.push({
                            "p": cartCookie[i]["p"],
                            "q": cartCookie[i]["q"]
                        });
                    } else {
                        self.products.splice(i, 1);
                    }
                } else {
                    if (cartCookie[i]["p"] == product_id) {
                        cartCookie[i]["q"] = quantity;
                        values = cartCookie;
                        self.products[i]["quantity"] = quantity;
                        self.products[i]['subtotal'] = self.products[i]['p_price'] * quantity;
                    }
                }
            }
            if (values.length == 0) {
                $.removeCookie('cart', {
                    path: '/'
                });
            } else {
                $.cookie('cart', values, {
                    expires: 7,
                    path: '/'
                });
            }
            cartCookie = $.cookie('cart');
            this.sum = 0;
            this.sumCart();
            message("success", "Cart has been updated", 5000)
        },
        sumCart: function() {
            for (var i = 0; i < this.products.length; i++) {
                this.sum += this.products[i]['p_price'] * this.products[i]['quantity'];
            }
        },
        removeProduct: function(product_id) {
          var self = this;
          self.products = self.products.filter(item => item.product_id !== product_id);
          self.sum = 0;
          this.sumCart();
          var values = cartCookie.filter(product => product["p"] !== product_id);
          $.cookie('cart', values, {
              expires: 7,
              path: '/'
          });
          cartCookie = $.cookie('cart');

          message("success", "The product has been removed from your cart", 5000);
        }
    }
}
</script>
