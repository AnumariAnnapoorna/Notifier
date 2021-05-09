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
try {
	Class.forName(dbDriver); 
	Connection con = DriverManager.getConnection(dbURL + dbName, 
	                                             dbUsername,  
	                                             dbPassword);
    	PreparedStatement st = con 
                .prepareStatement("update note set StartDate=?,EndDate=?,ReminderDate=?,Status=?,Tag=?,Description=? where NoteName=? and NotebookId=?"); 
         st.setString(1, request.getParameter("sdate")); 
         st.setString(2, request.getParameter("edate"));
         st.setString(3, request.getParameter("rdate")); 
         st.setString(4, request.getParameter("status"));
         st.setString(5, request.getParameter("tag")); 
         st.setString(6, request.getParameter("description"));
         st.setString(7, request.getParameter("nname")); 
         st.setString(8, request.getParameter("noteid"));
          int i=st.executeUpdate();
    st.close(); 
    con.close();
} 
catch (Exception e) { 
    e.printStackTrace(); 
} 
%>
<%response.sendRedirect("Dashboard.jsp"); %>

</body>
</html>