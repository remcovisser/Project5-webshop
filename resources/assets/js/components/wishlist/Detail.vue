<template>
<div class="container">
    <h3 class="text-centered mtb20">Wishlist of {{user.username}}</h3>
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
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="clearfix"></div>
    <a href="/wishlists" class="btn">Back to the wishlists overview</a>    
</div>

</template>

<script type="text/javascript">
export default {
    created() {
        var self = this;
        var user_id = (window.location.href.split('?id='))[1];
        $.get(local + 'wishlist/products/' + user_id, function(products) {
            self.products = products;

            if(products[0].hidden) {
                window.location = '/';
            }
        });

        $.get(local + 'users/' + user_id, function(user) {
            self.user = user[0];
        });
    },
    data() {
        return {
            products: [],
            user: []
        }
    },
    methods: {}
}
</script>