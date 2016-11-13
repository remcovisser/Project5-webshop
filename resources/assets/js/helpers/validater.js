module.exports = {
    uniqueUsername: function(username) {
        result = true;
        $.ajax({
            url: local + 'users/' + username + '/find',
            async: false,
            dataType: 'json',
            success: function(user) {
                if (user.length != 0)
                    result = false;
            }
        });
        return result;
    },
    password: function(password) {
        if (password.length < 5) {
            return false;
        }
        return true;
    },
    date: function(date) {
        if (date == '')
            return false;

        var rxDatePattern = /^(\d{4})(\/|-)(\d{1,2})(\/|-)(\d{1,2})$/;
        var dtArray = date.match(rxDatePattern);

        if (dtArray == null)
            return false;

        dtMonth = dtArray[3];
        dtDay = dtArray[5];
        dtYear = dtArray[1];

        if (dtMonth < 1 || dtMonth > 12)
            return false;
        else if (dtDay < 1 || dtDay > 31)
            return false;
        else if ((dtMonth == 4 || dtMonth == 6 || dtMonth == 9 || dtMonth == 11) && dtDay == 31)
            return false;
        else if (dtMonth == 2) {
            var isleap = (dtYear % 4 == 0 && (dtYear % 100 != 0 || dtYear % 400 == 0));
            if (dtDay > 29 || (dtDay == 29 && !isleap))
                return false;
        }
        return true;
    },
    email: function(email) {
        var emailRegex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        if (emailRegex.test(email)) {
            return true;
        }
        return false;
    }
}
