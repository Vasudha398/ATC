<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.*,java.util.*"%>
<%@ page import="java.sql.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import = "java.util.Date" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
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
  
</head>

<body>
<%
String id = request.getParameter("userId");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "lib";
String userId = "root";
String password = "password";
String selDate=request.getParameter("dt");

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<div class="jumbotron text-center" style="background-color: powderblue;height:150px;margin-bottom:0;">
  <h2 ><strong><img src="../atc_india_logo.png" width="100" height="70">&nbsp;&nbsp;AMERICAN TOWER CORPORATION</strong></h2>
</div>
<jsp:include page="HeaderPage2.jsp"/> 

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
   <div class="row-md-5">
  <!--Panel Header row 1 management-->

     <div class="view view-cascade py-3 gradient-card-header info-color-dark">
       <h5 class="mb-0 mr-5">&nbsp;&nbsp;MANAGEMENT OVERVIEW</h5>
  </div>
  <!--/Panel Header-->
    <!--Panel content-->
  <div class="card-body">

      <!--Grid row-->
      <div class="row">

          <!--Grid column 1-->
          <div class="col-md-4 mb-1">
          <!--no of admins-->
<p class="lead">
  <span class="badge info-color-dark p-2">ADMINS </br></br>
     <!-- SQL -->
  

<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT COUNT(*) FROM admin";

resultSet = statement.executeQuery(sql);
String countrow="";
while(resultSet.next()){
	%>
	<% countrow=resultSet.getString(1);
	out.println(countrow);}
%>
<% 
}

catch (Exception e) {
e.printStackTrace();
}
%>
  
  </span></p>
  
  <!-- SQL -->
  


</div>
        <!--Grid column 1-->
          <!-- Grid column 2 -->          
          <div class="col-md-4 mb-4">
          <!--no of librarians-->
<p class="lead">
  <span class="badge info-color-dark p-2">LIBRARIANS</br></br>
  <%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql1 ="SELECT COUNT(*) FROM librarian where bdeleted='n'";

resultSet = statement.executeQuery(sql1);
String countrow1="";
while(resultSet.next()){
	%>
	<% countrow1=resultSet.getString(1);
	out.println(countrow1);}
%>
<% 
}

catch (Exception e) {
e.printStackTrace();
}
%>
</span>
</p>

</div>
          
          <!--Grid column 2 -->
          <!-- Grid column 3 -->          
          <div class="col-md-4 mb-4">
          <!--no of members-->
<p class="lead">
  <span class="badge info-color-dark p-2">MEMBERS</br></br>
  <%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql2 ="SELECT COUNT(*) FROM mem where mdeleted='n'";

resultSet = statement.executeQuery(sql2);
String countrow2="";
while(resultSet.next()){
	%>
	<% countrow2=resultSet.getString(1);
	out.println(countrow2);}
%>
<% 
}

catch (Exception e) {
e.printStackTrace();
}
%></span>
</p>
</div>
          </div>
          <!--Grid column 3 -->
      </div>
      <!--Grid row-->

  </div>
  <!--Panel content row 2 book management-->
  
  <div class="row-md-5">
  <!--Panel Header-->
   &nbsp;&nbsp;&nbsp;
  <div class="view view-cascade py-3 gradient-card-header info-color-dark">
      <h5 class="mb-0">&nbsp;&nbsp;BOOK MANAGEMENT</h5>
  </div>
  <!--/Panel Header-->
    <!--Panel content-->
  <div class="card-body">

      <!--Grid row-->
      <div class="row">

          <!--Grid column 1-->
          <div class="col-md-4 mb-4">
          <!--no of admins-->
<p class="lead">
  <span class="badge info-color-dark p-2">TOTAL BOOKS</br></br> <%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql3 ="SELECT sum(qoh) FROM books where bdeleted='n'";

resultSet = statement.executeQuery(sql3);
String countrow4="";
while(resultSet.next()){
	%>
	<% countrow4=resultSet.getString(1);
	out.println(countrow4);}
%>
<% 
}

catch (Exception e) {
e.printStackTrace();
}
%></span>
</p>

</div>
        <!--Grid column 1-->
          <!-- Grid column 2 -->          
          <div class="col-md-4 mb-4">
          <!--no of librarians-->
<p class="lead">
  <span class="badge info-color-dark p-2">ISSUED BOOKS</br></br><%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT sum(issued) FROM books where bdeleted='n'";

resultSet = statement.executeQuery(sql);
String countrow="";
while(resultSet.next()){
	%>
	<% countrow=resultSet.getString(1);
	out.println(countrow);}
%>
<% 
}

catch (Exception e) {
e.printStackTrace();
}
%></span>
</p>

</div>
          
          <!--Grid column 2 -->
          <!-- Grid column 3 -->          
          <div class="col-md-4 mb-4">
          <!--no of members-->
<p class="lead">
  <span class="badge info-color-dark p-2">BOOKS OVERDUE</br></br><%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT sum(mPending) FROM mem where mdeleted='n'";

resultSet = statement.executeQuery(sql);
String countrow="";
while(resultSet.next()){
	%>
	<% countrow=resultSet.getString(1);
	out.println(countrow);}
%>
<% 
}

catch (Exception e) {
e.printStackTrace();
}
%></span>
</p>

</div>
          </div>
          <!--Grid column 3 -->
      </div>
      <!--Grid row-->

  </div>
  <!--Panel content row 3 daily tracking-->
  
  <div class="row-md-5">
  <!--Panel Header-->
   &nbsp;&nbsp;&nbsp;
  <div class="view view-cascade py-3 gradient-card-header info-color-dark">
      <h5 class=" mb-0 ">&nbsp;&nbsp;DAILY TRACKING TRANSACTION RECORDS</h5>
  </div>
  <!--/Panel Header-->
    <!--Panel content-->
  <div class="card-body">

      <!--Grid row1-->
      <div class="row">

          <!--Grid column 1-->
          <div class="col-md-4 mb-4">
                   <!--Date select-->
                  <p> <form method="post">
                   
      <select name="dt" class="mdb-select colorful-select dropdown-info">
  <option value="" disabled>Choose time period</option>
  <option value="0">Today</option>
  <option value="1">Yesterday</option>
  <option value="7">Last 7 days</option>
  <option value="30">Last 30 days</option>
</select>
<input type="submit" value="Transaction Records">

</form></p>
</div>
        <!--Grid column 1-->
          <!-- Grid column 2 -->          
          <div class="col-md-4 mb-4">
          <!--no of librarians-->
</div>
           <!--Grid column 2 -->
          <!-- Grid column 3 -->          
</div>
          <!--Grid column 3 -->
      </div>
      <!--Grid row1-->
       <!--Grid row2-->
      <div class="row-md-4">
      
      <section class="mb-5">
<style> .equal-width td {   width: 50%; } </style>

<table class="equal-width" align="center" cellpadding="5" cellspacing="4" border="1">
<tr>

</tr>
<tr  bgcolor="white">
<td><b>TransId</b></td>
<td><b>BookNo</b></td>
<td><b>MemberId</b></td>
<td><b>Transaction Date</b></td>
<td><b>Return Date</b></td>
</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();


String sql="select * from trans where date_sub(current_date(),interval '"+selDate+"' day)<=date_format(transactiondate, '%Y-%m-%d') and date_format(transactiondate, '%Y-%m-%d')<=current_date()";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>


<tr bgcolor="#DEB887">
<td><%=resultSet.getInt("transno") %></td>
<td><%=resultSet.getString("bookno") %></td>
<td><%=resultSet.getString("memid") %></td>
<td><%=resultSet.getDate("transactiondate") %></td>
<td><%=resultSet.getString("ReturnDate") %></td>
</tr>




<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
      
      </div>
 <!--Grid row2 ends-->
      
  </div>
  <!--Panel content-->
  
     </div>

<!--Grid column 1 of main panel over-->

<!--Grid column 2 of main panel -->
  
<div class="col-md-7">
      <!--row 1-->
<%--      <div class="row-md-7">
    <!--NOTOFICATION PANEL HEADER-->
    <div class="view view-cascade py-3 gradient-card-header info-color-dark mb-4">
    <h5 class="mb-0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    NOTIFICATION</h5>
    </div>
   <jsp:include page= "notif.jsp"/> --%>
<!--row 1 over-->

<!--row 2-->
     <div class="row-md-7">
    <!--TODAY'S DUE PANEL HEADER-->
    <div class="view view-cascade py-3 gradient-card-header info-color-dark mb-4">
    <h5 class="mb-0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    ONGOING DUES</h5>
    </div>
  <jsp:include page="../AdminDashboard/BooksDue.jsp"/>
    <!--/Card image-->
<!--row 2 over-->

   <!--row 3-->
     <div class="row-md-7">
    <!--USER DEFAULTERS PANEL HEADER-->
    <div class="view view-cascade py-3 gradient-card-header info-color-dark mb-4">
    <h5 class="mb-0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    USER DEFAULTERS</h5>
    </div>
   <jsp:include page="../AdminDashboard/Defaulters.jsp"/>
  
    <!--/Card image-->
<!--row 3 over-->


</div>
<!--Grid column 2 of main panel over-->

  </div> 
  <!--Grid row of main panel over-->
  

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
  <script>
  $(document).ready(function () {
	  $('.mdb-select').material_select();
	  });
  </script>
</body>

</html>
