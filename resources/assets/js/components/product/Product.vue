<template>
<div class="single">
    <div class="container">
        <div class="col-md-12">
            <div class="col-md-5 grid">
                <img :src="product.p_image" :alt="product.p_image" data-imagezoom="true" class="img-responsive">
            </div>
            <div class="col-md-7 single-top-in">
                <div class="span_2_of_a1 simpleCart_shelfItem">
                    <h3>{{product.p_name}}</h3>
                    <p class="in-para">{{product.p_description}}</p>
                    <div class="price_single">
                        <span class="reducedfrom item_price" id="product_price">${{product.p_price}}</span>
                        <div class="clearfix"></div>
                    </div>
                    <div class="wish-list">
                        <ul>
                            <li class="wish"><a href="#"><span class="glyphicon glyphicon-check" aria-hidden="true"></span>Add to Wishlist</a></li>
                            <li class="compare"><a href="#"><span class="glyphicon glyphicon-resize-horizontal" aria-hidden="true"></span>Add to Compare</a></li>
                        </ul>
                    </div>
                    <div class="quantity">
                        <div class="quantity-select">
                            <div class="entry value-minus" @click="changeQuantity('decrease')"></div>
                            <div class="entry value"><span>{{ quantity }}</span></div>
                            <div class="entry value-plus" @click="changeQuantity('increase')"></div>
                        </div>
                    </div>
                    <button type="button" class="add-to item_add hvr-grow" @click="addItemToCart(product.product_id)">Order</button>
                    <div class="clearfix"> </div>
                </div>
            </div>
            <div class="clearfix"> </div>
            <div class="tab-head">
                <nav class="nav-sidebar">
                    <ul class="nav tabs">
                        <li class="active"><a href="#tab1" data-toggle="tab">Product Description</a></li>
                        <li class=""><a href="#tab2" data-toggle="tab">Additional Information</a></li>
                        <li class=""><a href="#tab3" data-toggle="tab">Reviews</a></li>
                    </ul>
                </nav>
                <div class="tab-content one">
                    <div class="tab-pane active text-style" id="tab1">
                        <div class="facts">
                            <p> There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to
                                use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this
                                the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined </p>
                            <ul>
                                <li><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>{{product.p_model}}</li>
                                <li><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>{{product.p_submodel}}</li>
                                <li><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>{{product.p_color}}</li>
                                <li><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>{{product.p_construction_year}}</li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane text-style" id="tab2">
                    </div>
                    <div class="tab-pane text-style" id="tab3">
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>
</template>

<script>
var product_id = (window.location.href.split('?id='))[1];
var cookie = $.cookie('cart');

$(function() {
    var price = $("#product_price").text();
    $("#product_price").text(helper.price(price));
});

export default {
    created() {
        var self = this;
        $.get(local + 'products/' + product_id, function(product) {
            self.product = product[0];
        });
    },
    data() {
        return {
            product: [],
            quantity: 1
        }
    },
    methods: {
        addItemToCart: function(product_id) {
            var newItem = true;
            if (cookie != undefined) {
                for (var i = 0; i < cookie.length; i++) {
                    if (cookie[i]["p"] == product_id) {
                        cookie[i]["q"] += this.quantity;
                        newItem = false;
                        var values = cookie;
                    }
                }
                if (newItem) {
                    var product = {
                        "p": product_id,
                        "q": this.quantity
                    };
                    cookie.push(product);;
                    var values = cookie;
                }
            } else {
                var values = [{
                    "p": product_id,
                    "q": this.quantity
                }];
            }

            $.cookie('cart', values, {
                expires: 7,
                path: '/'
            });
            cookie = $.cookie('cart');
            message("success", "Item has been added to your cart");
        },
        changeQuantity: function(type) {
          var self = this;
          if(type == "increase") {
            self.quantity++;
          } else {
            if(self.quantity > 1)
              self.quantity--;
          }
        }
    }
}
</script>
