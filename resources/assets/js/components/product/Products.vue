<template>
<div id="wrapper">
    <div id="content">
        <div class="full">
            <div class="twenty filter">
                <!-- Filter -->
                <h2>Filters</h2>
                <h3>Filter by type</h3>
                <div class="btn-group" role="group">
                    <button type="button" class="btn btn-default dropdown-toggle selection" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Currently sorted by: {{sortValues[sortOption]}}
              <span class="caret"></span>
            </button>
                    <ul class="dropdown-menu filters hundred">
                        <button type="button" class="btn btn-default" @click="sortOption='p_price'">Price</button>
                        <button type="button" class="btn btn-default" @click="sortOption='product_id'">Id</button>
                        <button type="button" class="btn btn-default" @click="sortOption='p_name'">Name</button>
                    </ul>
                </div>
                <div class="full">
                    <button type="button" class="btn btn-default fifty" @click="sort('desc')">Descending</button>
                    <button type="button" class="btn btn-default fifty" @click="sort()">Ascending</button>
                    <div style="clear:both;"></div>
                </div>

                <div class="price_holder">
                    <h3>Price</h3>
                    <div class="form-group">
                        <div class="input_holder fifty">
                            <input type="text" id="minPrice" class="form-control" :placeholder="minFilterPrice" v-on:keydown="filterPrice()">
                            <span class="enter">enter</span>
                        </div>
                        <div class="input_holder fifty">
                            <input type="text" id="maxPrice" class="form-control" :placeholder="maxFilterPrice" v-on:keydown="filterPrice()">
                            <span class="enter">enter</span>
                        </div>
                        <div style="clear:both;"></div>
                    </div>
                </div>

                <div class="search_holder">
                    <h3>Search</h3>
                    <div class="input_holder">
                        <input type="text" id="search_field" class="form-control" placeholder="Search for something.." v-on:keydown="filter()" />
                        <span class="enter">enter</span>
                    </div>
                </div>
            </div>


            <!-- Prodcuts -->
            <div class="seventy">
                <h2 class="title text-center">Products</h2>
                <div v-for="product in products">
                    <div class="product">
                        <a :href="'/products/product.html?id=' + product.product_id">
                            <img :src="product.p_image" alt="Afbeelding" />
                            <h3>{{product.p_name}}</h3>
                            <p class="price">${{product.p_price}},-</p>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</template>


<script>
$(function() {
    $("#minPrice, #maxPrice, #search_field").focus(function() {
        var holder = $(this).parent();
        $(holder).find(".enter").show();
    });
    $("#minPrice, #maxPrice, #search_field").focusout(function() {
        $("#minPrice, #maxPrice, #search_field").parent().find(".enter").hide();
    });
});

export default {
    created() {
        var self = this;
        $.get(local + '/products', function(products) {
            self.products = products;
            self.originalValues = products;
            var search = (window.location.href.split('?search='))[1];
            if (search) {
                var search = search.replace(/\+/g, ' ');
                $('#search_field').val(search);
                self.filter(search);
            }
        });
    },
    data() {
        return {
            products: [],
            originalValues: [],
            sortValues: {
                product_id: "Id",
                p_price: "Price",
                p_name: "Name"
            },
            sortOption: "product_id",
            minFilterPrice: 0,
            maxFilterPrice: 0,
        }
    },
    methods: {
        sort: function(sort) {
            var self = this;
            this.products = this.products.sort(function(a, b) {
                if (sort === 'desc') {
                    if (b[self.sortOption] < a[self.sortOption]) return -1;
                    if (b[self.sortOption] > a[self.sortOption]) return 1;
                    return 0;
                } else {
                    if (a[self.sortOption] < b[self.sortOption]) return -1;
                    if (a[self.sortOption] > b[self.sortOption]) return 1;
                    return 0;
                }
            });
        },
        filter: function() {
            var self = this;
            var search = $("#search_field").val();
            if (search == "") {
                self.products = self.originalValues;
            } else {
                this.products = this.products.filter(function(value) {
                    if (value.p_name.toLowerCase().indexOf(search.toLowerCase()) >= 0) {
                        return true;
                    } else {
                        return false;
                    }
                })
            }
        },
        filterPrice: function() {
            var self = this;
            if (event.keyCode == 13) {
                self.minFilterPrice = parseFloat($('#minPrice').val());
                self.maxFilterPrice = parseFloat($('#maxPrice').val());
                if (isNaN(self.minFilterPrice)) {
                    self.minFilterPrice = 0;
                }
                if (isNaN(self.maxFilterPrice)) {
                    self.maxFilterPrice = Math.max.apply(Math, self.products.map(function(o) {
                        return o.p_price;
                    }));
                }
                this.products = this.originalValues.filter(function(value) {
                    if (value.p_price >= self.minFilterPrice && value.p_price <= self.maxFilterPrice) {
                        return true;
                    } else {
                        return false;
                    }
                })
            }
        }
    }
}
</script>
