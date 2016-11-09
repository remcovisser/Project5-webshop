$(function() {
    document.title += 'Cart test page';

    //sumCart();
});

$.cookie.json = true;
var cookie = $.cookie('cart');
var cartData = [];

function getProductsInCart(callbackSum)
{
  if(cookie == undefined) {
    message("danger", "Your cart is empty", 2000);
  } else {
    for (i = 0; i < cookie.length; i++) {
        var data = getProductInfo(cookie[i]["p"], cookie[i]["q"]);
    }
    callbackSum()
    return data;
  }
}

function getProductInfo(product_id, quantity = null)
{
  $.get(local + '/products/' + product_id, function(product) {
      if(quantity != null) {
          product[0]['quantity'] = quantity;
      }
      cartData.push(product[0]);
  });
  return cartData
}

function addToCartClicked(product_id)
{
  addItemToCar(product_id);
  message("success", "Item has been added to your cart");
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

function emptyCart()
{
  message("success", "Your cart has been emptied");
  $.removeCookie('cart', { path: '/' });
  product.modifiedValues = [];
}

function quantityChange(quantity, product_id)
{
  var values = [];
  for(var i = 0; i < cookie.length; i++) {
    if(quantity <= 0) {
      if(cookie[i]["p"] != product_id) {
        values.push({"p":cookie[i]["p"], "q":cookie[i]["q"]});
      }
    } else {
      if(cookie[i]["p"] == product_id) {
          cookie[i]["q"] = quantity;
          values = cookie;
        }
      }
    }
    message("success", "Cart has been updated", 5000)
    $.cookie('cart', values, { expires: 7, path: '/' });
    cartData = [];
    cartData = getProductsInCart(sumCart);
}

function sumCart()
{
  var sum = 0;
  for(var i = 0; i < cartData.length; i++) {
    sum += (cartData[i]["p_price"] * cartData[i]["quantity"]);
  }
  $("#totalPrice").html(sum);
  return sum;
}


cartData = getProductsInCart(sumCart);
Vue.component('product-list',
{
  props: ['id', 'name', 'description', 'price', 'image', 'quantity', 'index'],
  template: '#product-template'
});

var product = new Vue({
  el: '#cart',
  data : {
    modifiedValues : cartData
  },
});
