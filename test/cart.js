
var test = require('unit.js');
var clone = require('clone');

var Vue = require('vue');
var component = require('../resources/assets/js/components/user/Cart.vue');
console.log(component);


describe('Unit tests', () => {
    // ------- Generate fake cart -------
    var fakeCart = []
    fakeCart[0] = {
        "product_id":1,
        "p_name":"Lamborghini Aventador",
        "p_description":"Brutally powerful and obscenely flamboyant, the Aventador is unburdened by reality. Crazy expensive and crazy fast, it’s capable of amazing performance without feeling like it’s going to snap-spin into a ditch, which is refreshing in a supercar. ",
        "p_price":"5",
        "p_brand":"Lamborghini",
        "p_model":"Aventador",
        "p_submodel":"AB",
        "p_color":"Black",
        "p_construction_year":2016,
        "p_image":"https://openclipart.org/image/2400px/svg_to_png/222252/feels.png",
        "boolean_deleted":0,
        "quantity":2,
        "subtotal":10
    };
    fakeCart[1] = {
      "product_id":2,
      "p_name":"Toyota Corolaa",
      "p_description":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit dui justo, non varius purus pellentesque at. Integer sit amet augue velit. Pellentesque vulputate quam a varius fringilla. Aliquam quam urna, convallis id fermentum et, consequat u",
      "p_price":"123456",
      "p_brand":"Toyota",
      "p_model":"Corola",
      "p_submodel":"CD",
      "p_color":"Red",
      "p_construction_year":2014,
      "p_image":"http://i.imgur.com/yneAVIJ.jpg",
      "boolean_deleted":0,
      "quantity":4,
      "subtotal":493.824
    };


    // ------- Cart unit tests -------

    it('Cart length', () => {
        test.assert.equal(2, fakeCart.length);
    });

    it('Sum cart', () => {
        var sum = 0;
        for (var i = 0; i < fakeCart.length; i++) {
            sum += fakeCart[i]['p_price'] * fakeCart[i]['quantity'];
        }
        test.assert.equal(493834, sum);
    });

    it('Quantity change postive quantity', () => {
        var product_id = 1;
        var quantity = 20;
        var expectedResult = clone(fakeCart);
        expectedResult[0]["quantity"] = quantity;
        expectedResult[0]["subtotal"] = expectedResult[0]['p_price'] * quantity;

        for (var i = 0; i < fakeCart.length; i++) {
            if (quantity > 0) {
                if (fakeCart[i]["product_id"] == product_id) {
                    fakeCart[i]["quantity"] = quantity;
                    fakeCart[i]['subtotal'] = fakeCart[i]['p_price'] * quantity;
                }
            }
        }

        test.array(expectedResult).is(fakeCart);
    });

    it('Quantity change negative quantity', () => {
        var product_id = 1;
        var quantity = 0;
        var expectedResult = clone(fakeCart);

        for (var i = 0; i < fakeCart.length; i++) {
            if (quantity <= 0) {
                if (fakeCart[i]["product_id"] == product_id) {
                    expectedResult.splice(i, 1);
                }
            }
        }
        test.object(expectedResult[0]).is(fakeCart[1]);
    });

});
