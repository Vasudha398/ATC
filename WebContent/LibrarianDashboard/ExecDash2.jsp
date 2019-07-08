<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>Executive Dashboard</title>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
  <!-- Bootstrap core CSS -->
  <link href="../css/bootstrap.min.css" rel="stylesheet">
  <!-- Material Design Bootstrap -->
  <link href="../css/mdb.min.css" rel="stylesheet">
  <!-- Your custom styles (optional) -->
  <link href="../css/style.css" rel="stylesheet">
</head>

<body>
<div class="jumbotron text-center" style="background-color: powderblue;height:150px;margin-bottom:0;">
  <h2 ><strong><img src="ATClogo.PNG" width="100" height="70">&nbsp;&nbsp;AMERICAN TOWER CORPORATION</strong></h2>
</div>
<jsp:include page="../LibrarianDashboard/HeaderPage2.jsp"/> 

  <!-- Start your project here-->
  <!--Main layout-->
<main>
  <div class="container-fluid">

      <!--Section: Modals-->
      <section>



      </section>
      <!--Section: Modals-->

     <!--Section: Main panel-->
<section class="card card-cascade narrower mb-5">

  <!--Grid row-->
  <div class="row">

  <!--Grid column-->
<div class="col-md-5">
  
  <!--Panel Header-->
  <div class="view view-cascade py-3 gradient-card-header info-color-dark">
      <h5 class="mb-0">EXECUTIVE CORNER</h5>
  </div>
  <!--/Panel Header-->

  <!--Panel content-->
  <div class="card-body">

      <!--Grid row-->
      <div class="row">

          <!--Grid column-->
          <div class="col-md-6 mb-4">
          <!--Date select-->
<p class="lead">
  <span class="badge info-color-dark p-2">Date range</span>
</p>
<select class="mdb-select colorful-select dropdown-info">
  <option value="" disabled>Choose time period</option>
  <option value="1">Today</option>
  <option value="2">Yesterday</option>
  <option value="3">Last 7 days</option>
  <option value="3">Last 30 days</option>
  <option value="3">Last week</option> 
  <option value="3">Last month</option>
</select>
<!--Date pickers-->
<p class="lead my-4">
  <span class="badge info-color-dark p-2">Custom date</span>
</p>
<div class="md-form">
  <input placeholder="D-M-Y" type="text" id="from" class="form-control datepicker">
  <label for="date-picker-example">From</label>
</div>
<div class="md-form">
  <input placeholder="D-M-Y" type="text" id="to" class="form-control datepicker">
  <label for="date-picker-example">To</label>
</div>
          </div>
          <!--Grid column-->

          <!--Grid column-->
          <div class="col-md-6 mb-4 text-center">
          <!--Summary-->
<p>BOOKS ISSUED:
    <strong>2000</strong>
    <button type="button" class="btn btn-info btn-sm p-2" data-toggle="tooltip" data-placement="top" title="Total books issued in the given period">
        <i class="fas fa-question"></i>
    </button>
</p>
<p>BOOKS BOUGHT:
    <strong>100</strong>
    <button type="button" class="btn btn-info btn-sm p-2" data-toggle="tooltip" data-placement="top" title="books bought in the given period">
        <i class="fas fa-question"></i>
    </button>
</p>
          </div>
          <!--Grid column-->
<!--Change chart-->
<span class="min-chart my-4" id="chart-sales" data-percent="76">
    <span class="percent"></span>
</span>
      </div>
      <!--Grid row-->

  </div>
  <!--Panel content-->

</div>

<!--Grid column-->

  <!--Grid column-->
<div class="col-md-7">

    <!--Panel Header-->
    <div class="view view-cascade py-3 gradient-card-header info-color-dark mb-4">

        <canvas id="lineChart"></canvas>

    </div>
    <!--/Card image-->

</div>
<!--Grid column-->

  </div>
  <!--Grid row-->

</section>
<!--Section: Main panel-->

      <!--Section: Table-->
      <section class="mb-5">



      </section>
      <!--Section: Table-->

      <!--Section: Accordion-->
      <section class="mb-5">



      </section>
      <!--Section: Accordion-->

  </div>
</main>
<!--Main layout-->
  <!-- Start your project here-->

  <!-- SCRIPTS -->
  <!-- JQuery -->
  <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
  <!-- Bootstrap tooltips -->
  <script type="text/javascript" src="js/popper.min.js"></script>
  <!-- Bootstrap core JavaScript -->
  <script type="text/javascript" src="js/bootstrap.min.js"></script>
  <!-- MDB core JavaScript -->
  <script type="text/javascript" src="js/mdb.min.js"></script>
  <script>
//Material Select Initialization
  $(document).ready(function () {
  $('.mdb-select').material_select();
  });
//Tooltip Initialization
  $(function () {
  $('[data-toggle="tooltip"]').tooltip()
  })
//Minimalist chart
  $(function () {
      $('.min-chart#chart-sales').easyPieChart({
          barColor: "#4caf50",
          onStep: function (from, to, percent) {
              $(this.el).find('.percent').text(Math.round(percent));
          }
      });
  });
//Main chart
  var ctxL = document.getElementById("lineChart").getContext('2d');
  var myLineChart = new Chart(ctxL, {
  type: 'line',
  data: {
  labels: ["January", "February", "March", "April", "May", "June", "July"],
  datasets: [{
  label: "NUMBER OF BOOKS ISSUED PER MONTH",
  fillColor: "#fff",
  backgroundColor: 'rgba(255, 255, 255, .3)',
  borderColor: 'rgba(255, 255, 255)',
  data: [0, 10, 5, 2, 20, 30, 45],
  }]
  },
  options: {
  legend: {
  labels: {
      fontColor: "#fff",
  }
  },
  scales: {
  xAxes: [{
      gridLines: {
          display: true,
          color: "rgba(255,255,255,.25)"
      },
      ticks: {
          fontColor: "#fff",
      },
  }],
  yAxes: [{
      display: true,
      gridLines: {
          display: true,
          color: "rgba(255,255,255,.25)"
      },
      ticks: {
          fontColor: "#fff",
      },
  }],
  }
  }
  });
  </script>
</body>

</html>
