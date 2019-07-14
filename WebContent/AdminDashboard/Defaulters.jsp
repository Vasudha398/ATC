<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.*,java.util.*"%>
<%@ page import="java.sql.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>BooksDue</title>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
  <!-- Bootstrap core CSS -->
  <link href="../css/bootstrap.min.css" rel="stylesheet">
  <!-- Material Design Bootstrap -->
  <link href="../css/mdb.min.css" rel="stylesheet">
  <!-- Your custom styles (optional) -->
  <link href="../css/style.css" rel="stylesheet">
  <style type="text/css">
  
   .my-custom-scrollbar {
position: center;
height: 200px;
overflow: auto;
}
.table-wrapper-scroll-y {
display: block;
}
  </style>

<title>Insert title here</title>
</head>
<body>


<%
String id = request.getParameter("userId");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "lib";
String userId = "root";
String password = "password";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<div class="table-responsive text-nowrap table-wrapper-scroll-y my-custom-scrollbar">
<table id="dtDynamicVerticalScrollExample" width="100%" class="table table-striped table-bordered table-hover table-condensed" align="center">
<tr>

</tr>
<tr  bgcolor="white">
<td><b>TransactionId</b></td>
<td><b>MemberId</b></td>
<td><b>MemberName</b></td>
<td><b>Contact</b></td>
</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="select * from defaulter where str_to_date(expreturndate,'%Y-%m-%d')<=current_date()";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>

<td><%=resultSet.getInt("transno") %></td>
<td><%=resultSet.getString("memid") %></td>
<td><%=resultSet.getString("mname") %></td>
<td><%=resultSet.getString("mcontact") %></td>
</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</div>


</body>
</html>