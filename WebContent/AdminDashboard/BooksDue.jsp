<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.*,java.util.*"%>
<%@ page import="java.sql.*" %>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import = "java.util.Date" %>

<%@ page import = "javax.servlet.*,java.text.*" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>BooksDue</title>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
  <!-- Bootstrap core CSS -->
  <link href="../css/bootstrap.min.css" rel="stylesheet">
  <!-- Material Design Bootstrap -->
  <link href="../css/mdb.min.css" rel="stylesheet">
  <!-- Your custom styles (optional) -->
  <link href="../css/style.css" rel="stylesheet">

<title>Insert title here</title>
</head>
<body>
<%
         Date dNow = new Date( );
         SimpleDateFormat ft = 
         new SimpleDateFormat ("dd/MM/yyyy");
         out.print( "<h2 align=\"center\">" + ft.format(dNow) + "</h2>"); 
      %>

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
<section class="mb-5">
<style> .equal-width td {   width: 21%; } </style>

<table class="equal-width" align="center" cellpadding="7" cellspacing="5" border="1">
<tr>

</tr>
<tr  bgcolor="white">
<td><b>BookNo</b></td>
<td><b>MemberId</b></td>
<td><b>Expected Return Date</b></td>
</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="select * from trans where str_to_date(expreturndate,'%d/%m/%Y') <= current_date() and tdeleted='n' and ReturnDate='0000-00-00 00:00:00'";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#DEB887">
<td><%=resultSet.getString("bookno") %></td>
<td><%=resultSet.getString("memid") %></td>
<td><%=resultSet.getString("expreturndate") %></td>
</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</section>

</body>
</html>