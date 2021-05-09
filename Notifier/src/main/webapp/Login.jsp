<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="login.css">

<script>
function validate()
{
var msg="";
var email=document.login.email.value;
var en=new RegExp("[\\w]+.com");
if(!email.match(en))
msg+="email should be of form abc@gmail.com";
if(msg!="")
{
alert(msg);
return false;
}
return true;
}
</script>

</head>
<body>
<%
if(session.getAttribute("email")!=null)
{
	response.sendRedirect("Dashboard.jsp");
}
%>
<h2><center>RemindMe</center></h2>
<center>
<form action="" method="post" name="login">
<table>
<caption><h3>Login</h3></caption>
<tr>
  <div class="container">
   <td>
   <input type="text" placeholder="email" name="email" required>
   </td>
   </tr>
   <tr>
   <td>
   <input type="password" placeholder="password" name="psw" required>
   </td>
   </tr>
    <tr><td><button type="submit" onclick="return validate()">Login</button></td></tr>
	<tr><td><span class="psw">Not a member?<a href="SignUp.html">Sign Up</a></span></td></tr>
  </div>
  </table>
</form>
</center>
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
try{
	PreparedStatement st = con 
            .prepareStatement("select * from user where Email=? and Password=?"); 
     String email=request.getParameter("email");
     st.setString(1, email); 
     String password=request.getParameter("psw");
     st.setString(2, password); 
     session.setAttribute("email", email);
     session.setAttribute("password", password);
     ResultSet rs=st.executeQuery(); 
     if(rs.next())
     {
     	session.setAttribute("id",rs.getString(1));
     	session.setAttribute("name",rs.getString(2));
     	 
     	PreparedStatement st1 = con 
                .prepareStatement("select * from note n,notebook nb,user u where u.id=nb.user_id and nb.id=n.NotebookId and u.id=?");
     	st1.setString(1,(String)session.getAttribute("id"));
     	ResultSet rs1=st1.executeQuery();
     	while(rs1.next())
     	{
     		//out.println(rs1.getDate("EndDate"));
     		//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					//String dt= sdf.format(new Date()); 
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        	Date d=rs1.getDate("EndDate");
        	String s=sdf.format(d);
        	Date d1=rs1.getDate("StartDate");
        	String s1=sdf.format(d1);
        	Date d2=new Date();
        	String s2=sdf.format(d2);
        	if(s2.compareTo(s1)==0)
         	{
        		PreparedStatement st2 = con 
                        .prepareStatement("update note n,notebook nb,user u set n.Status='Started' where nb.user_id=u.id and nb.id=n.NotebookId and u.id="+(String)session.getAttribute("id")+" and n.EndDate='"+d+"'");
        		st2.executeUpdate();
         	}
        	else if(s2.compareTo(s1)>0 && s2.compareTo(s)<0)
        	{
        		PreparedStatement st2 = con 
                        .prepareStatement("update note n,notebook nb,user u set n.Status='Inprogress' where nb.user_id=u.id and nb.id=n.NotebookId and u.id="+(String)session.getAttribute("id")+" and n.EndDate='"+d+"' and n.startDate='"+d1+"'");
        		st2.executeUpdate();	
        	}
        	else if(s2.compareTo(s)>0)
         	{
        		PreparedStatement st2 = con 
                        .prepareStatement("update note n,notebook nb,user u set n.Status='Completed' where nb.user_id=u.id and nb.id=n.NotebookId and u.id="+(String)session.getAttribute("id")+" and n.EndDate='"+d+"'");
        		st2.executeUpdate();
         	}
     	}
     	response.sendRedirect("Dashboard.jsp");
     }
     st.close(); 
     con.close();   
 } 
 catch (Exception e) { 
     e.printStackTrace(); 
 } 
%>

</body>
</html>
