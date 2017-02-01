<template>
  <div>
      <div class="form-group">
          <label for="image">Image</label>
          <input type="text" class="form-control" id="image" />
      </div>
      <div class="form-group">
          <label for="name">Name</label>
          <input type="text" class="form-control" id="name"/>
      </div>
      <div class="form-group">
          <label for="description">Description</label>
          <textarea class="form-control" id="description"></textarea>
      </div>
      <div class="form-group">
          <label for="brand">Brand</label>
          <input type="text" class="form-control" id="brand"/>
      </div>
      <div class="form-group">
          <label for="model">Model</label>
          <input type="text" class="form-control" id="model"/>
      </div>
      <div class="form-group">
          <label for="submodel">Submodel</label>
          <input type="text" class="form-control" id="submodel"/>
      </div>
      <div class="form-group">
          <label for="color">Color</label>
          <input type="text" class="form-control" id="color"/>
      </div>
      <div class="form-group">
          <label for="construction_year">Construction year</label>
          <input type="text" class="form-control" id="construction_year"/>
      </div>
      <div class="form-group">
          <label for="price">Price</label>
          <input type="text" class="form-control" id="price"/>
      </div>
      <button v-on:click="saveData" id="submitFormButton" class="btn btn-default" name="save">Create product</button>
  </div>
</template>

<script>
export default {
  methods: {
    saveData: function () {
        // Place them in variables for the form checks
        var image = document.getElementById('image').value;
        var name = document.getElementById('name').value;
        var description = document.getElementById('description').value;
        var brand = document.getElementById('brand').value;
        var model = document.getElementById('model').value;
        var submodel = document.getElementById('submodel').value;
        var color = document.getElementById('color').value;
        var construction_year = document.getElementById('construction_year').value;
        var price = document.getElementById('price').value;

        if(name == "" || description == "" || brand == "" || model == "" || price == "" || submodel == "" || construction_year == ""){
          message("danger", "Please fill in all the fields");
        } else {
          // Place the data in an object to convert to a json string
          var values = {
              p_image : image,
              p_name : name,
              p_description : description,
              p_brand : brand,
              p_model : model,
              p_submodel : submodel,
              p_color : color,
              p_construction_year : construction_year,
              p_price : price
          };

          // Convert object to jsonstring
          values = JSON.stringify(values);
          // HTTP post request
          var xhr = new XMLHttpRequest();
          xhr.open('POST', local+'/products/create');
          // Send our values
          xhr.send(values);
          window.location = '/admin/products';
      }
    }
  }
}

</script>
