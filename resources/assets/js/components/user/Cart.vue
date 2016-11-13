<template>
<div>
    <button @click="emptyCart()">Empty cart</button>

    <div class="seventy">
        <h2 class="title text-center">Cart</h2>
        <div v-for="product in products">
            <div class="product">
                <img :src="product.p_image" alt="Afbeelding" />
                <h3>{{product.p_name}}</h3>
                <p class="price">${{product.p_price}},-</p>
                <input class="quantity" :value="product.quantity" type="number" @keyup="quantityChange(product.product_id, $event)">
            </div>
        </div>
    </div>

    <div style="clear:both"></div>
    <p id="totalPrice">{{sum}}</p>
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
