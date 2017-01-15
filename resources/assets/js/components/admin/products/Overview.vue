<template>
  <div>
    <ul>
      <table class="table">
        <tr>
          <th><a class="btn btn-primary" href="/admin/products/create.html">Create</a></th>
          <th>Name</th>
          <th>Brand</th>
          <th>Model</th>
          <th>Price</th>
          <th>Update</th>
          <th>Delete</th>
        </tr>
      <tbody id="demo" v-for="product in products">
          <tr>
            <td><img :src="product.p_image" style="max-width:150px;" :alt="product.p_name" class="full"/></td>
            <td>{{product.p_name}}</td>
            <td>{{product.p_brand}}</td>
            <td>{{product.p_model}}</td>
            <td>{{product.p_price}}</td>
            <td><a class="btn btn-primary" :href="'/admin/products/edit.html?id=' + product.product_id" name="edit">Update</a></td>
            <td><button class="btn" name="delete" v-on:click="deleteData(product.product_id)">Delete</button></td>
          </tr>
      </tbody>
      </table>
    </ul>
</div>
</template>


<script>
export default {
  created() {
    var self = this;
    $.get(local + '/products', function(products) {
        self.products = products;
      });
  },
  data() {
    return {
      products: []
    }
  },
  methods: {
    deleteData: function (id) {
      var localDelete = local+'products/'+id;
      // HTTP post request
      var xhr = new XMLHttpRequest();
      xhr.open('DELETE', localDelete);
      // Send our values
      xhr.send();
      alert("Product was deleted.");
      window.location = window.location;
    }
  }
}
</script>
