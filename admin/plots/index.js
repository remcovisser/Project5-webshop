$(document).ready(function() {
  document.title += 'plots';
});

// Users chart
var xhrUsers = new XMLHttpRequest();
xhrUsers.open('GET', local + '/admin/registered-users');
xhrUsers.onload = function () {
  createUserChart(JSON.parse(xhrUsers.responseText));
}
xhrUsers.send();

function createUserChart(data){
    var ctx = document.getElementById('usersChart').getContext('2d');
    var userchart = new Chart(ctx, {
    type: 'line',
    data: {
      labels: data[0].users,
      datasets: [{
        label: 'Total registered users per day',
        data: data[0].day,
        backgroundColor: "rgba(153,255,51,0.4)"
      }]
    }
  });
}

// Products chart
var xhrProducts = new XMLHttpRequest();
xhrProducts.open('GET', local + '/admin/best-selling-products/10');
xhrProducts.onload = function () {
  createProductsChart(JSON.parse(xhrProducts.responseText));
}
xhrProducts.send();

function createProductsChart(data){
  var hoverData = data[0].productnames;
  var amountData = data[0].amount;
  var backgroundColors = ["#FF6384", "#36A2EB","#FFCE56", "#4BC0C0", "#7743CE", "#8e44ad", "#27ae60", "#e67e22", "#d35400", "#2c3e50"];

  var data = {
      labels: hoverData,
      datasets: [
          {
              data: amountData,
              backgroundColor: backgroundColors,
              hoverBackgroundColor: backgroundColors
          }]
  };
  var ctx = document.getElementById('productsChart').getContext('2d');
  var productsChart = new Chart(ctx,{
      type: 'pie',
      data: data
  });
}


// Orders chart
