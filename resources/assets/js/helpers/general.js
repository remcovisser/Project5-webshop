module.exports = {
    auth: function() {
        if ($.cookie('user') != undefined) {
            return true;
        }
        return false;
    },
    admin: function() {
        if ($.cookie('user') != undefined && $.cookie('user').admin == 1) {
            return true;
        }
        return false;
    },
    capitalize: function(string) {
        return string.replace(/\b\w/g, l => l.toUpperCase());
    },
    price: function(string) {
        string += '';
        x = string.split('.');
        x1 = x[0];
        x2 = x.length > 1 ? '.' + x[1] : '';
        var rgx = /(\d+)(\d{3})/;
        while (rgx.test(x1)) {
            x1 = x1.replace(rgx, '$1' + '.' + '$2');
        }
        return x1 + x2;
    }
}
