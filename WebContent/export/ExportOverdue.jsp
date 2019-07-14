<%@ page import="java.io.*,java.sql.*"%>
<html>
<body>
<table>
<%
String filename = "c:\\csv\\export_Overdue.csv";
Connection conn = null;
String url = "jdbc:mysql://localhost:3306/";
String dbName = "lib";
String driver = "com.mysql.jdbc.Driver";
String userName = "root";
String password = "password";
Statement stmt;
try
{
FileWriter fw = new FileWriter(filename);
fw.append("Transaction Id");
fw.append(',');
fw.append("Book No");
fw.append(',');
fw.append("Book Name");
fw.append(',');
fw.append("Member Name");
fw.append(',');
fw.append("Expected Return Date");
fw.append(',');
fw.append("Days Passed");
fw.append('\n');
Class.forName(driver);
conn = DriverManager.getConnection(url+dbName,userName,password);
String query = "select * from transactions where str_to_date(expreturndate,'%Y-%m-%d')<=current_date() and tdeleted='n'";
stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery(query);
while(rs.next())
{
fw.append(rs.getString(1));
fw.append(',');
fw.append(rs.getString(7));
fw.append(',');
fw.append(rs.getString(11));
fw.append(',');
fw.append(rs.getString(9));
fw.append(',');
fw.append(rs.getString(5));
fw.append(',');
fw.append(rs.getString(2));
fw.append('\n');
}
fw.flush();
fw.close();
conn.close();
response.sendRedirect("../AdminDashboard/DashAdm.jsp");
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>