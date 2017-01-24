<template>
  <div>
    <div id="no-recommended-products" class="soft-hide">
      <div class="alert alert-danger" style="display: block;"><strong>Danger!</strong> <span class="danger-value">No recommended products found.</span></div>
    </div>

    <div v-for="recommendedProduct in recommendedProducts" class="col-md-3 item-grid simpleCart_shelfItem">
        <div class="mid-pop">
            <div class="pro-img">
                <a :href="'/products/product.html?id=' + recommendedProduct.product_id">
                  <img :src="recommendedProduct.p_image" class="img-responsive" alt="Product image">
                </a>
            </div>
            <div class="mid-1">
                <div class="women">
                    <div class="women-top">
                        <span>Category</span>
                        <h6 class="product_title">  <a :href="'/products/product.html?id=' + recommendedProduct.product_id">{{ recommendedProduct.p_name}}</a></h6>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="mid-2">
                    <p><em class="item_price">${{recommendedProduct.p_price}}</em></p>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
  </div>
</template>

<script>
export default {
  created() {
    var self = this;
    var product_id = (window.location.href.split('?id='))[1];
    $.get(local + 'products/recommended/' + product_id, function(products) {
        if(products.length == 0) {
          $("#no-recommended-products").show();
        } else {
          self.recommendedProducts = products;
        }
    });
  },
  data() {
    return {
      recommendedProducts: [],
    }
  }
}
</script>
