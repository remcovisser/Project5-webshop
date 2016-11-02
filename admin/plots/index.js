$(document).ready(function() {
  document.title += 'plots';
});

var userData;
var xhrExist = new XMLHttpRequest();
xhrExist.open('GET', local + '/admin/registered-users');
xhrExist.onload = function () {
  createUserChart(JSON.parse(xhrExist.responseText));
}
xhrExist.send();

function createUserChart(data){
  var ctx = document.getElementById('myChart').getContext('2d');
    var myChart = new Chart(ctx, {
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
