$(function() {
    document.title += 'Cart test page';
});

function addToCartClicked(product_id)
{
  message("success", "Item has been added to your cart");
  getProductInfo(product_id);
}

function getProductInfo(product_id)
{
  var xhrProduct = new XMLHttpRequest();
  xhrProduct.open('GET', local + '/products/' + product_id);
  xhrProduct.onload = function () {
    addItemToCar(JSON.parse(xhrProduct.responseText));
  }
  xhrProduct.send();
}

function addItemToCar(productInfo)
{
  if($.cookie('cart') != undefined) {
    var value = $.cookie('cart') + "&" + JSON.stringify(productInfo[0]);
  } else {
    var value = JSON.stringify(productInfo[0]);
  }
  $.cookie('cart', value, { expires: 7, path: '/' });
  product.modifiedValues = getParsedCartData();
}

function getParsedCartData()
{
  var parsedData = [];
  if($.cookie('cart') == undefined) {
    message("danger", "Your cart is empty", 2000);
  } else {
    var DataArray = $.cookie('cart').split("&");
    for (i = 0; i < DataArray.length; i++) {
      parsedData.push(JSON.parse(DataArray[i]));
    }
  }
  return parsedData;
}


function emptyCart()
{
  message("success", "Your cart has been emptied");
  $.removeCookie('cart', { path: '/' });
  product.modifiedValues = [];
}

var parsedData = getParsedCartData();
Vue.component('product-list',
{
  props: ['id', 'name', 'description', 'price', 'image', 'index'],
  template: '#product-template'
});

var product = new Vue({
  el: '#cart',
  data : {
    modifiedValues : parsedData
  },
});
