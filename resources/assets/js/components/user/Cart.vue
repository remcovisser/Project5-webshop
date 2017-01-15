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
                    <tr v-for="product in products" class="cart-header">
                        <td class="ring-in">
                            <a href="single.html" class="at-in"><img :src="product.p_image" class="img-responsive" :alt="product.p_image"></a>
                            <div class="sed">
                                <h5><a href="single.html">{{product.p_name}}</a></h5>
                                <p>{{product.p_description}}</p>
                            </div>
                            <div class="clearfix"></div>
                        </td>
                        <td>{{product.p_price}}</td>
                        <td><input class="quantity" :value="product.quantity" type="number" @keyup="quantityChange(product.product_id, $event)"></td>
                        <td class="item_price">${{product.subtotal}}</td>
                        <td><button type="button" class="item_add hvr-grow">Remove</button></td>
                    </tr>
                    <tr>
                        <th colspan="3">Total:</th>
                        <td>
                            <p id="totalPrice">${{sum}}</p>
                        </td>
                        <td><button @click="emptyCart()" class="item_add hvr-grow">Empty Cart</button></td>
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
export default {
    created() {
        if (cartCookie == undefined) {
            $(function() {
                message("danger", "Your cart is empty", 2000);
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
        }
        this.sumCart();
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
        }
    }
}
</script>
