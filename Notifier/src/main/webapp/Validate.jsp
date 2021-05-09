<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
try{
	PreparedStatement st = con 
            .prepareStatement("select * from user where Email=? and Password=?"); 
     String email=request.getParameter("email");
     st.setString(1, email); 
     String password=request.getParameter("psw");
     st.setString(2, password); 
    // HttpSession session=request.getSession();
     session.setAttribute("email", email);
     session.setAttribute("password", password);
     ResultSet rs=st.executeQuery(); 
     if(rs.next())
     {
     	session.setAttribute("id",rs.getString(1));
     	session.setAttribute("name",rs.getString(2));
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