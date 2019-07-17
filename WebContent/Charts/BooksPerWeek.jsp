<%@page import="java.sql.*" %>
  <%@page import="java.util.*" %>
  <%@page import="org.json.JSONObject" %>

<%
    Connection con= null;
 try{
  Class.forName("com.mysql.jdbc.Driver").newInstance();
 con =      DriverManager.getConnection("jdbc:mysql://localhost:3306/lib","root","password");

        ResultSet rs = null;
        List bookpw = new LinkedList();
        JSONObject responseObj = new JSONObject();

   		 String query = "SELECT transactiondate,count(transactiondate) as quantity, week_of_month, MName, MONTH FROM booksperweek WHERE transactiondate>=date_sub(current_date(),INTERVAL 12 WEEK) AND transactiondate<=current_date()+1 group by week_of_month, month ORDER BY MONTH,week_of_month";
         PreparedStatement pstm= con.prepareStatement(query);

           rs = pstm.executeQuery();
           JSONObject weekObj = null;

        while (rs.next()) {
            String transactiondate = rs.getString("transactiondate");
            int week_of_month = rs.getInt("week_of_month"); 
            int quantity = rs.getInt("quantity");
            String MName = rs.getString("MName");
           /*  int month = rs.getInt("MONTH"); */
            weekObj = new JSONObject();
            weekObj.put("transactiondate", transactiondate);
            weekObj.put("week_of_month", week_of_month); 
            weekObj.put("quantity", quantity);
            weekObj.put("MName",MName);
          /*   weekObj.put("month",month); */
            bookpw.add(weekObj);
        }
        responseObj.put("bookpw", bookpw);
    out.print(responseObj.toString());
    }
    catch(Exception e){
        e.printStackTrace();
    }finally{
        if(con!= null){
            try{
            con.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        }
    }
 %>
  