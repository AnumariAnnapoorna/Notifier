<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.div1{
background-color:#F0F3F3;
}
table
{
width:90%;
float:right;
border-collapse:collapse;
}
</style>
</head>
<body>
<% 
String dbDriver = "com.mysql.jdbc.Driver"; 
String dbURL = "jdbc:mysql://localhost:3306/"; 
String dbName = "notifier"; 
String dbUsername = "root"; 
String dbPassword = "";  
Class.forName(dbDriver); 
Connection con = DriverManager.getConnection(dbURL + dbName, 
                                             dbUsername,  
                                             dbPassword);
String note=request.getParameter("NoteName");
try {
    PreparedStatement st1 = con.prepareStatement("select * from note n,notebook nb,user u where u.id=nb.user_id and nb.id=n.NotebookId and NoteName=? and u.id=?");
    st1.setString(1,note);
    st1.setString(2,(String)session.getAttribute("id"));
    ResultSet rs=st1.executeQuery();
    while(rs.next())
    {
    	out.println("<table>"
    			+"<tr><td style='font-size:25px;'><b>Note</b></td></tr>"
    			+"<tr class=div1><td><b>Name</b></td>"
    			+"<td>"+rs.getString(1)+"</td>"
    			+"</tr>"
    			+"<tr><td><b>StartDate</b></td>"
    	    	+"<td>"+rs.getString(2)+"</td>"
    	    	+"</tr>"
    	    	+"<tr class=div1><td><b>EndDate</b></td>"
    	    	+"<td>"+rs.getString(3)+"</td>"
    	    	+"</tr>"
    	    	+"<tr><td><b>ReminderDate</b></td>"
    	    	+"<td>"+rs.getString(4)+"</td>"
    	    	+"</tr>"
    	    	+"<tr class=div1><td><b>Status</b></td>"
    	    	+"<td>"+rs.getString(5)+"</td>"
    	    	+"</tr>"
    	    	+"<tr><td><b>Tag</b></td>"
    	    	+"<td>"+rs.getString(6)+"</td>"
    	    	+"</tr>"
    	    	+"<tr class=div1><td><b>Description</b></td>"
    	    	+"<td>"+rs.getString(7)+"</td>"
    	       	+"</tr>"
    	       	+"</tr>"
    	       	+"<tr><td><a onclick=fun()><h3 style='color:blue'>Back</h3></a></b></td>"
    	    	+"</tr>"
    	    	+"</table>"
    	    	);
    			
    }
    st1.close(); 
    con.close();
} 
catch (Exception e) { 
    e.printStackTrace(); 
} 
%>
<script>
function fun(){
	window.history.back();
}
</script>
</body>
</html>