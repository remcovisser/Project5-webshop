<template>
<div class="single">
    <div class="container">
        <div class="col-md-12">
            <div class="col-md-5 grid">
                <img width="450" height="300" :src="product.p_image" :alt="product.p_image" data-imagezoom="true" class="img-responsive">
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
                            <li class="wish">
                                <button type="button" @click="addWish" class="add-to item_add hvr-grow">
                                    <span class="glyphicon glyphicon-check" aria-hidden="true"></span> Add To Wishlist
                                </button>
                            </li>
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
                        <li><a href="#tab2" data-toggle="tab">Recommended products</a></li>
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
                      <recommended-products-component></recommended-products-component>
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

        if($.cookie('user')) {
            var user_id = $.cookie('user').user_id;
            self.user_id = user_id;
            $.get(local + 'wishlist/' + user_id, function(data) {
                if(data.length > 0 && data[0].hidden == 0) {
                    self.pvtwish = 0;
                }
            });
            $.get(local + 'wishlist/' + user_id + '/' + product_id, function(exists) {
                if(exists.length > 0) {
                    $(document).ready(function(){
                        $(".wish-list").html("This item is already added to your wishlist.");
                    });
                }
            });
        }
        else {
            $(document).ready(function(){
                $(".wish-list").html("Log in to add this to your wishlist.");
            });
        }
    },
    data() {
        return {
            product: [],
            quantity: 1,
            pvtwish: 1,
            user_id:0
        }
    },
    methods: {
        addWish: function() {
            var self = this;
            var d = new Date();
            var currentDate = d.getFullYear() + "-" + (d.getMonth()+1) + "-" + d.getDate();

            var values = {
                    user_id: self.user_id,
                    product_id: product_id,
                    addition_date: currentDate,
                    hidden: self.pvtwish
                };
                values = JSON.stringify(values);

                $.post(local + '/wishlist/create', values, function(result) {
                    message("success", "The item has been added to your wishlist.")
                });
        },
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
