<template>
  <div>
    <canvas id="usersChart"></canvas>
    <br /> <hr > <br />
    <label for = "productsChart">Best selling products</label>
    <canvas id="productsChart"></canvas>
    <br /> <br /> <hr > <br /><br />
    <canvas id="ordersChart"></canvas>
  </div>
</template>


<script>
export default {
  created() {
     var x = $.cookie("user");

     var backgroundColors = ["#FF6384", "#36A2EB","#FFCE56", "#4BC0C0", "#7743CE", "#8e44ad", "#27ae60", "#e67e22", "#d35400", "#2c3e50"];

    // Users chart


    $.ajax({
         url: local + '/admin/registered-users',
         type: "GET",
         beforeSend: function(xhr){
           xhr.setRequestHeader('authorization', x.token);
         },
         success: function(data) {
            createUserChart(data);
          }
      });

    function createUserChart(data){
      var ctx = document.getElementById("usersChart");
      var myChart = new Chart(ctx, {
          type: 'bar',
          data: {
              labels: data[0].day,
              datasets: [{
                  label: '# Of total registerd users per day',
                  data: data[0].users,
                  backgroundColor: [
                      'rgba(255, 99, 132, 0.2)',
                      'rgba(54, 162, 235, 0.2)',
                      'rgba(255, 206, 86, 0.2)',
                      'rgba(75, 192, 192, 0.2)',
                      'rgba(153, 102, 255, 0.2)',
                      'rgba(255, 159, 64, 0.2)',
                      'rgba(255, 99, 132, 0.2)',
                      'rgba(54, 162, 235, 0.2)',
                      'rgba(255, 206, 86, 0.2)',
                      'rgba(75, 192, 192, 0.2)',
                      'rgba(153, 102, 255, 0.2)',
                      'rgba(255, 159, 64, 0.2)',
                  ],
                  borderColor: [
                      'rgba(255,99,132,1)',
                      'rgba(54, 162, 235, 1)',
                      'rgba(255, 206, 86, 1)',
                      'rgba(75, 192, 192, 1)',
                      'rgba(153, 102, 255, 1)',
                      'rgba(255, 159, 64, 1)',
                      'rgba(255, 159, 64, 0.2)',
                      'rgba(54, 162, 235, 1)',
                      'rgba(255, 206, 86, 1)',
                      'rgba(75, 192, 192, 1)',
                      'rgba(153, 102, 255, 1)',
                      'rgba(255, 159, 64, 1)',
                      'rgba(255, 159, 64, 0.2)',
                  ],
                  borderWidth: 1
              }]
          },
          options: {
              scales: {
                  yAxes: [{
                      ticks: {
                          beginAtZero:true
                      }
                  }]
              }
          }
      });
    }


    // Products chart
    var xhrProducts = new XMLHttpRequest();
    xhrProducts.open('GET', local + '/admin/best-selling-products/10');
    xhrProducts.setRequestHeader('authorization', x.token);
    xhrProducts.onload = function () {
      createProductsChart(JSON.parse(xhrProducts.responseText));
    }
    xhrProducts.send();

    function createProductsChart(data){
      var hoverData = data[0].productnames;
      var amountData = data[0].amount;

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
    var xhrOrders = new XMLHttpRequest();
    xhrOrders.open('GET', local + '/admin/sumorders');
    xhrOrders.setRequestHeader('authorization', x.token);
    xhrOrders.onload = function () {
      createOrdersChart(JSON.parse(xhrOrders.responseText));
    }
    xhrOrders.send();

    function createOrdersChart(data){
        var ctx = document.getElementById('ordersChart').getContext('2d');
        var userchart = new Chart(ctx, {
        type: 'line',
        data: {
          labels: data[0].weekNumbers,
          datasets: [{
            label: 'Total value of the orders per week',
            data: data[0].total,
            backgroundColor: "rgba(153,255,51,0.4)"
          }]
        }
      });
    }
  }
}
</script>
