<%@ page import="java.sql.*" %>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>
<html>
<head>
<link rel='stylesheet' href='../bootstrap.min.css'/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">body { background:  white !important; }
.btn {
  background-color: DodgerBlue;
  border: none;
  color: white;
  padding: 12px 30px;
  cursor: pointer;
  font-size: 20px;
}
</style>
<script>
function editRecord(id){
    var f=document.form;
    f.method="post";
    f.action='LibEdit.jsp?id='+id;
    f.submit();
}
function deleteRecord(id){
    var f=document.form;
    f.method="post";
    f.action='LibDelete.jsp?id='+id;
    f.submit();
}
function myFunction() {
  window.print();
}
function greeting(){
    alert("Thanks For Download The File! It will be downloaded in csv folder of the C: directory");
}
function confirmComplete() {
	var answer=confirm("Are you sure you want to delete the member?");
	if (answer==true)
	  {
	    return true;
	  }
	else
	  {
	    return false;
	  }
}
</script>
</head>
<body>
<%
	response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
	response.setHeader("Pragma","no-cache");
	response.setHeader("Expires","0");
if(session.getAttribute("username")==null)
{
	response.sendRedirect("../index.jsp");
}
%>
<jsp:include page="navheader.jsp" />
<div style="width:300px">
<div style="float: right; width: 100px">
<button id="myBtn" class="btn" style="float:right">ADD </button>
</div>
<div style="float:right; width:200px">
<form name="TrainerMenu" action="../export/exportLib.jsp" method="post" onsubmit="greeting()">
<button id="myBtn" class="btn"  style="float:right" onclick="openPage('exportLib.jsp')" >DOWNLOAD AS CSV</button>
</form>
</div>
</div>


<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <span class="close">&times;</span>
      <h2 align="center"><strong>ADD LIBRARIAN</strong></h2>
    </div>
<div class="modal-body">
 <div class="container">
<div class="row">
<div class="col-sm-8">
<form action="AddLibrarianCheck.jsp" method="post" style="width:300px" >
<div class="form-group">
<label for="name1">LIBRARIAN ID</label>
<%
int sumcount=0;
int count=0;
try {
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lib", "root", "password");
String query = "select * from librarian ORDER BY id DESC LIMIT 1";
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
while(rs.next()){
	count=rs.getInt(1);
%>
<input type="text" class="form-control" name="id" id="name1" placeholder="Employee Id" readonly value=<%="LIB00"%><%=count+1%> >
<%
}
%>

<%
}
catch(Exception e){
	System.out.println(e);
}
%>
</div>
<div class="form-group">
    <label for="name1">Librarian Name&nbsp;<font color="red">*</font></label>
    <input type="text" class="form-control" name="lname" id="name1" placeholder="Name" style="text-transform: capitalize;" required/>
</div>
<div class="form-group">
    <label for="name1">Librarian's First Time Password&nbsp;<font color="red">*</font></label>
    <input type="password" class="form-control" name="lcurrentpassword" id="name1" placeholder="First Time Password" required/>
</div>
<div class="form-group">
    <label for="name1">Librarian Contact&nbsp;<font color="red">*</font></label>
    <input type="text" class="form-control" name="lcontact" id="lcontact" placeholder="Phone Contact No"  pattern="[7-9]{1}[0-9]{9}"
       title="Phone number with 7-9 and remaing 9 digit with 0-9" required/>
</div>
<div class="form-group">
    <label for="email1">Librarian Email&nbsp;<font color="red">*</font></label>
    <input type="email" class="form-control" name="lemail" id="email1" placeholder="Email" pattern="[a-zA-Z]{3,}.+@americantower.com" title="Format of email id is name@americantower.com" required/>
</div>
<div class="form-group">
    <label for="name1">Librarian Address</label>
    <input type="text" class="form-control" name="laddress" id="laddress" style="text-transform: capitalize;" placeholder="Address"/>
</div>
<div class="form-group">
    <label for="name1">Librarian's City</label>
    <input type="text" class="form-control" name="lcity" id="name1" style="text-transform: capitalize;" placeholder="City"/>
</div>

<button type="submit" class="button">Submit</button>
</form>

 </div>
</div>
</div>
    </div>
    <div class="modal-footer">
    </div>
  </div>

</div>
<jsp:include page="../navfooter.jsp" />
<br>
<br>
<form method="post" name="form" onsubmit="greeting()">
<div class='container'>
<table class='table table-bordered table-striped' border="1">
<tr><th>EID</th><th>NAME</th><th >CONTACT</th><th>EMAIL_ID</th><th >ADDRESS</th><th>CITY</th><th></th><th></th></tr>
<%
Connection con = null;
String url = "jdbc:mysql://localhost:3306/";
String db = "lib";
String driver = "com.mysql.jdbc.Driver";
String userName ="root";
String password="password";


Statement st;
try{
Class.forName(driver);
con = DriverManager.getConnection(url+db,userName,password);
String query = "select * from librarian where bdeleted='n'";
st = con.createStatement();
ResultSet rs = st.executeQuery(query);
%>
<%
while(rs.next()){
%>
<tr><td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>

<td><%=rs.getString("lcontact")%></td>
<td><%=rs.getString("lemail")%></td>
<td><%=rs.getString(6)%></td>
<td><%=rs.getString(7)%></td>
<script>
function confirmComplete(id) {
	var answer=confirm("Are you sure you want to delete the Librarian permanently?");
	if (answer==true)
	  {
		deleteRecord(id);
	  }
	else
	  {
	    return false;
	  }
}
</script>
<td><input type="button" name="edit" value="Edit" style="background-color:green;font-weight:bold;color:white;" onclick="editRecord(<%=rs.getString(1)%>);"></td>
<td><input type="button" name="delete" value="Mark As Deleted" style="background-color:red;font-weight:bold;color:white;" onclick="{return confirmComplete(<%=rs.getString(1)%>);}"></td>
</tr>
<%
}
%>
<%
}
catch(Exception e){
e.printStackTrace();
}
%>
</table>
</div>
</form>
</body>
</html>