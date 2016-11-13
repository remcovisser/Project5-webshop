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
    }
}
