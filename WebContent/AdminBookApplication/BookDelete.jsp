<%@ page import="java.sql.*" %> 
<%
int id = Integer.parseInt(request.getParameter("id"));
try{
           Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lib", "root", "password");
           Statement st=con.createStatement();
           int i=st.executeUpdate("update books set bdeleted='y' where id="+id+"");
           response.sendRedirect("BookApplication.jsp");
}
catch (Exception e){
System.out.println(e);
}
%>