$(function() {
    document.title += 'Cart test page';
});
$.cookie.json = true;
var cookie = $.cookie('cart');
var cartData = [];

function addToCartClicked(product_id)
{
  addItemToCar(product_id);
  message("success", "Item has been added to your cart");
}

function getProductInfo(product_id, quantity = null)
{
  $.get(local + '/products/' + product_id, function(product) {
      if(quantity != null) {
          product[0]['quantity'] = quantity;
      }
      cartData.push(product[0]);
  });
}

function addItemToCar(product_id)
{
  var newItem = true;
  if(cookie != undefined) {
    for(var i = 0; i < cookie.length; i++) {
      if(cookie[i]["p"] == product_id) {
        cookie[i]["q"]++;
        newItem = false;
        var values = cookie;
      }
    }
    if(newItem) {
      var product = {"p":product_id, "q":1};
      cookie.push(product);;
      var values = cookie;
    }
  } else {
    var values = [{"p":product_id, "q":1}];
  }

  $.cookie('cart', values, { expires: 7, path: '/' });
  cookie = $.cookie('cart');
}

function getProductsInCart()
{
  if(cookie == undefined) {
    message("danger", "Your cart is empty", 2000);
  } else {
    for (i = 0; i < cookie.length; i++) {
        getProductInfo(cookie[i]["p"], cookie[i]["q"]);
    }
  }
}

function emptyCart()
{
  message("success", "Your cart has been emptied");
  $.removeCookie('cart', { path: '/' });
  product.modifiedValues = [];
}

getProductsInCart();
var parsedData = cartData;
Vue.component('product-list',
{
  props: ['id', 'name', 'description', 'price', 'image', 'quantity', 'index'],
  template: '#product-template'
});

var product = new Vue({
  el: '#cart',
  data : {
    modifiedValues : parsedData
  },
});
