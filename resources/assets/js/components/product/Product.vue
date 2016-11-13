<template>
<div>
    <div>
        <div class="twentyfive text-centered">
            <img :src="product.p_image" class="full" :alt="product.p_name" />
            <h2>${{product.p_price}},-</h2>
            <button type="button" class="btn btn-default" @click="addItemToCart(product.product_id)">Order</button>
        </div>
        <div class="seventyfive">
            <h1>{{product.p_name}}</h1>
            <p>{{product.p_description}}</p>

            <table class="table mt20">
                <tr>
                    <td><strong>Brand</strong></td>
                    <td>{{product.p_model}}</td>
                </tr>
                <tr>
                    <td><strong>Submodel</strong></td>
                    <td>{{product.p_submodel}}</td>
                </tr>
                <tr>
                    <td><strong>Color</strong></td>
                    <td>{{product.p_color}}</td>
                </tr>
                <tr>
                    <td><strong>Construction year</strong></td>
                    <td>{{product.p_construction_year}}</td>
                </tr>
            </table>

            <a href="/products/" class="btn btn-default">Back to overview</a>
        </div>
    </div>
</div>
</template>

<script>
var product_id = (window.location.href.split('?id='))[1];
var cookie = $.cookie('cart');

export default {
    created() {
        var self = this;
        $.get(local + 'products/' + product_id, function(product) {
            self.product = product[0];
        });
    },
    data() {
        return {
            product: []
        }
    },
    methods: {
        addItemToCart: function(product_id) {
            var newItem = true;
            if (cookie != undefined) {
                for (var i = 0; i < cookie.length; i++) {
                    if (cookie[i]["p"] == product_id) {
                        cookie[i]["q"]++;
                        newItem = false;
                        var values = cookie;
                    }
                }
                if (newItem) {
                    var product = {
                        "p": product_id,
                        "q": 1
                    };
                    cookie.push(product);;
                    var values = cookie;
                }
            } else {
                var values = [{
                    "p": product_id,
                    "q": 1
                }];
            }

            $.cookie('cart', values, {
                expires: 7,
                path: '/'
            });
            cookie = $.cookie('cart');
            message("success", "Item has been added to your cart");
        }
    }
}
</script>
