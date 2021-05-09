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
String nname=request.getParameter("uname");
String bname=(String)session.getAttribute("notebookname");
out.println(nname+""+bname);
try {
	Class.forName(dbDriver); 
	Connection con = DriverManager.getConnection(dbURL + dbName, 
	                                             dbUsername,  
	                                             dbPassword);
    	PreparedStatement st = con 
                .prepareStatement("update notebook set noteBookName=? where noteBookName=?"); 
         st.setString(1, nname); 
         st.setString(2, bname); 
          st.executeUpdate();
    st.close(); 
    con.close();
} 
catch (Exception e) { 
    e.printStackTrace(); 
} 
%>
<%response.sendRedirect("NoteBook.jsp"); %>

</body>
</html>