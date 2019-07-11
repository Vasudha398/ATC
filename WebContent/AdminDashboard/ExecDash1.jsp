<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.*,java.util.*"%>
<%@ page import="java.sql.*" %>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import = "java.util.Date" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>Admin Dashboard</title>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
  <!-- Bootstrap core CSS -->
  <link href="../css/bootstrap.min.css" rel="stylesheet">
  <!-- Material Design Bootstrap -->
  <link href="../css/mdb.min.css" rel="stylesheet">
  <!-- Your custom styles (optional) -->
  <link href="../css/style.css" rel="stylesheet">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
   


<!-- <style type="text/css">body { background:  white !important; }
.amt-head-stripe {
    background: #fff;
    height: 100px;
    left: 0;
    position: absolute;
    top: 0;
    width: 100%;
}
.amt-logo-container {
    text-align: center;
    -moz-box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
	-webkit-box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
	background: #fff;
	width: 200px;
	height: 90px;
}
.amt-main-nav {
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    padding-left: 90px;
    top: 75px;
    width: 100%;
    }
   .perc-region {
    min-height: 0px !important;
}
</style> -->
 
</head>

<body>
<div class="perc-region"> 
<div class="rxbodyfield">
<div class="amt-main-nav amt-nav">
<div class="amt-logo-container"><a href="http://www.atctower.in/en/index.htm" title="Home">
<img alt="atc-india-logo" class="amt-logo" height="81" src="../atc_india_logo.png" width="185" />
</a>
</div>
</div>
</div>
<%
String id = request.getParameter("userId");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "lib";
String userId = "root";
String password = "password";
String f=request.getParameter("from");
String t=request.getParameter("to");

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>

<jsp:include page="../AdminDashboard/HeaderPage1.jsp"/> 

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
  <input placeholder="FROM (D-M-Y)" input type="text" id="datepicker1">
</div>
<div class="md-form">
  <input placeholder="TO (D-M-Y)" input type="text" id="datepicker2">
</div>
<input type="submit" value="Transaction Records">
          </div>
          <!--Grid column-->

          <!--Grid column-->
          <div class="col-md-6 mb-4 text-center">
                <!--Grid row2-->
      <div class="row-md-4">
      
      <section class="mb-5">
       <p>Date: <input type="text" id="datepicker"></p>
<%-- <div class="table-responsive">
<table class="table table-striped w-auto table-bordered table-hover table-fixed" align="right">
<tr>

</tr>

<tr bgcolor="">
<td><b>TransId</b></td>
<td><b>BookName</b></td>
<td><b>MemberName</b></td>
<td><b>Issue Date</b></td>
<td><b>Return Date</b></td>
</tr>

<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName+"?zeroDateTimeBehavior=convertToNull", userId, password);
statement=connection.createStatement();


String sql="select * from transactions where date_format('"+f+"', '%Y-%m-%d')<=date_format(transactiondate, '%Y-%m-%d') and date_format(transactiondate, '%Y-%m-%d')<=date_format('"+t+"', '%Y-%m-%d') order by transno asc";

System.out.println(sql);

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>


<tr>
<td><%=resultSet.getInt("transno") %></td>
<td><%=resultSet.getString("bookname") %></td>
<td><%=resultSet.getString("mname") %></td>
<td><%=resultSet.getDate("transactiondate") %></td>
<td><%=resultSet.getDate("ReturnDate")%></td>
</tr>




<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table> --%>
 </div>     
      </div>
 <!--Grid row2 ends-->
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
  <script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
  <!-- Bootstrap tooltips -->
  <script type="text/javascript" src="../js/popper.min.js"></script>
  <!-- Bootstrap core JavaScript -->
  <script type="text/javascript" src="../js/bootstrap.min.js"></script>
  <!-- MDB core JavaScript -->
  <script type="text/javascript" src="../js/mdb.min.js"></script>
   <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
    $( function() {
        $( "#datepicker" ).datepicker();
      } );
      $(function () {
          var $dp1 = $("#datepicker1"); 
          $dp1.datepicker({
            changeYear: true,
            changeMonth: true,
            dateFormat: "yy-m-dd",
            yearRange: "-100:+20",
          });           
                
          var $dp2 = $("#datepicker2");  
          $dp2.datepicker({
            changeYear: true,
            changeMonth: true,
            yearRange: "-100:+20",
            dateFormat: "yy-m-dd",
          });                   
        });
    </script>
  <script>
  $(document).ready(function () {
	  $('.mdb-select').material_select();
	  });
  </script>
</body>

</html>