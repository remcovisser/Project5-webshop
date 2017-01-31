window.$ = window.jQuery = require('jquery');
window.$cookie = require('jquery.cookie');
$.cookie.json = true;

window.Vue = require('vue');
window.md5 = require('md5');
require('bootstrap');

window.local = "http://localhost:9000/";
window.message = require('./helpers/messages').message;
window.auth = require('./helpers/general').auth;
window.admin = require('./helpers/general').admin;
window.helper = require('./helpers/general');
window.validate = require('./helpers/validater');
window.createAddress = require('./helpers/address').createAddress;

$.ajaxSetup({    
    beforeSend: function(xhr){
        var x = $.cookie("user");
        if(x != null){
            xhr.setRequestHeader('authorization', x.token);
        }else{console.log('no token defined');}
    }
});