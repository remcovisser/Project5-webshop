<template>
  <div class="container">
    <div class="check-out">

      <div id="orders" class="bs-example4" data-example-id="simple-responsive-table">
        <div class="table-responsive">
          <table class="table-heading simpleCart_shelfItem">
            <tr>
              <th>Order ID</th>
              <th>User</th>
              <th>Date</th>
              <th>Info</th>
            </tr>
            <tr v-for="order in orders">
              <td>{{ order.order_id }}</td>
              <td>{{ order.user_id }}</td>
              <td> {{ order.order_date.substring(0, order.order_date.indexOf('T')) }} </td>
              <td><span @click="showOrderlines( order.order_id)" class="pointer">Show more info</span></td>
            </tr>
          </table>
        </div>
      </div>

      <div id="orderlines" class="bs-example4" data-example-id="simple-responsive-table">
        <div class="table-responsive">
          <table class="table-heading simpleCart_shelfItem">
            <hr />
            <table>
              <tr>
                <th>Product</th>
                <th>Quantity</th>
                <th>Price</th>
              </tr>
              <tr v-for="orderline in orderlines">
                <td><a :href="'/products/product.html?id='+orderline.product_id">{{ orderline.p_name }}</a></td>
                <td>{{ orderline.quantity }}</td>
                <td>${{ orderline.product_price }}</td>
              </tr>
            </table>
          </div>
        </div>

      </div>
    </div>
    </div>
  </div>
</template>

<script type="text/javascript">
$(function(){
    $("#orderlines").hide();
});

export default {
  created() {
    var self = this;
    $.get(local + 'orders', function(orders) {
      if(orders.length == 0) {
          message("danger", "There are no orders yet");
          $("#orders").hide();
      } else {
        self.orders = orders;
        $("#orders").show();
      }
    });
  },
  data() {
    return {
      orders: [],
      orderlines: []
    }
  },
  methods: {
    showOrderlines: function(order_id) {
      var self = this;
      self.orderlines = [];
      $.get(local + 'orderlines/info/' + order_id, function(orderlines) {
        self.orderlines = orderlines;
        $("#orderlines").show();
      });
    }
  }
}
</script>
