module.exports = {
    createAddress: function(street, city, country, postalcode, housenumber, callback) {
        getStreetID(street, city, country, postalcode, housenumber, callback);
        function getStreetID(street, city, country, postalcode, housenumber, callback) {
          var street_id;
          $.get(local + '/streets/exists/'+street, function(result) {
            if(result.length == 0) {
              var values = { street: street };
              $.post(local + '/streets/create', JSON.stringify(values), function(result) {
                  $.get(local + '/streets/exists/'+street, function(result) {
                    street_id = result[0]['street_id'];
                    getCityID(street_id, city, country, postalcode, housenumber, callback);
                  });
              });
            } else {
              street_id = result[0]['street_id'];
              getCityID(street_id, city, country, postalcode, housenumber, callback);
            }
          });
        }

        // Get the city ID
        function getCityID(street_id, city, country, postalcode, housenumber, callback) {
          var city_id;
          $.get(local + '/cities/exists/'+city, function(result) {
            if(result.length == 0) {
              var values = { city: city };
              $.post(local + '/cities/create', JSON.stringify(values), function(result) {
                  $.get(local + '/cities/exists/'+city, function(result) {
                    city_id = result[0]['city_id'];
                    getCountryID(street_id, city_id, country, postalcode, housenumber, callback);
                  });
              });
            } else {
              city_id = result[0]['city_id'];
              getCountryID(street_id, city_id, country, postalcode, housenumber, callback);
            }
          });
        }
        // Get the country ID
        function getCountryID(street_id, city_id, country, postalcode, housenumber, callback) {
          var country_id;
          $.get(local + '/countries/exists/'+country, function(result) {
            if(result.length == 0) {
              var values = { country: country };
              $.post(local + '/countries/create', JSON.stringify(values), function(result) {
                  $.get(local + '/countries/exists/'+country, function(result) {
                    country_id = result[0]['country_id'];
                    insertAddress(street_id, city_id, country_id, postalcode, housenumber, callback);
                  });
              });
            } else {
              country_id = result[0]['country_id'];
              insertAddress(street_id, city_id, country_id, postalcode, housenumber, callback);
            }
          });
        }

        // Create the address
        function insertAddress(street_id, city_id, country_id, postalcode, housenumber, callback) {
          var address_id;
          $.get(local + '/address/exists/'+street_id+'/'+city_id+'/'+country_id+'/'+postalcode+'/'+housenumber, function(result) {
            if(result.length == 0) {
              var values = {
                street_id: street_id,
                city_id: city_id,
                country_id: country_id,
                postal_code: postalcode,
                housenumber: housenumber
              };
              values = JSON.stringify(values);
              $.post(local + '/address/create', values, function(result) {
                $.get(local + '/address/exists/'+street_id+'/'+city_id+'/'+country_id+'/'+postalcode+'/'+housenumber, function(result) {
                  address_id = result[0]['address_id'];
                  callback(address_id);
                });
              });
            } else {
              address_id = result[0]['address_id'];
              callback(address_id);
            }
          });
        }
    }
}
