<template>
<div class="container">
     <div v-for="wish in products" class="col-md-3 item-grid">
        <div class="mid-pop">
            <div class="pro-img">
                <a :href="'/products/product.html?id=' + wish.product_id">
                    <img :src="wish.p_image" class="img-responsive" alt="Product image">
                </a>
            </div>
            <div class="mid-1">
                <div class="women">
                    <div class="women-top">
                        <h6 class="product_title" :id="wish.product_id">
                            <a :href="'/products/product.html?id=' + wish.product_id">{{wish.p_name}}</a>
                        </h6>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="mid-2">
                    <p><em class="item_price">${{wish.p_price}}</em></p>
                    <button class="btn right" name="delete" v-on:click="destroy(wish.product_id)">Delete</button>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="clearfix"> </div>
</div>
</template>

<script type="text/javascript">
export default {
    created() {
        var self = this;
        var user_id = $.cookie('user').user_id;
        self.user_id = user_id;
        $.get(local + 'wishlist/products/' + user_id, function(products) {
            self.products = products;
        });
    },
    data() {
        return {
            products: [],
            user_id: 0
        }
    },
    methods: {
        destroy: function(id) {
            var self = this;
            var password = $("#password").val();
            var user_data = {
                user_id: self.user_id
            };

            var xhr = new XMLHttpRequest();
            xhr.open('DELETE', local + 'wishlist/' + self.user_id + '/' + id);
            var x = $.cookie("user");
            xhr.setRequestHeader('authorization', x.token);
            xhr.send();
            message("success", "The product has been removed from your wishlist.")
            self.products = self.products.filter(item => item.product_id !== id);
        }
    }
}
</script>
