<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
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
String nname=request.getParameter("nname");
String start=request.getParameter("sdate");
String end=request.getParameter("edate");
String rem=request.getParameter("rdate");
String status=request.getParameter("status");
String tag=request.getParameter("tag");
String des=request.getParameter("description");
try {
	Class.forName(dbDriver); 
	Connection con = DriverManager.getConnection(dbURL + dbName, 
	                                             dbUsername,  
	                                             dbPassword);
    	PreparedStatement st = con 
                .prepareStatement("insert into note values(?,?,?,?,?,?,?,?)"); 
         st.setString(1, nname); 
         st.setString(2, start); 
         st.setString(3, end); 
         st.setString(4, rem); 
         st.setString(5, status); 
         st.setString(6, tag); 
         st.setString(7, des); 
         st.setString(8,(String)session.getAttribute("noteid"));
         st.executeUpdate();
    st.close(); 
    con.close();
} 
catch (Exception e) { 
    e.printStackTrace(); 
} 
%>
<%response.sendRedirect("Dashboard.jsp?id="+session.getAttribute("noteid"));%>
</body>
</html>