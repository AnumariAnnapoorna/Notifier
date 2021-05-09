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
String bname=request.getParameter("noteBookName");
try {
	Class.forName(dbDriver); 
	Connection con = DriverManager.getConnection(dbURL + dbName, 
	                                             dbUsername,  
	                                             dbPassword);
	PreparedStatement st1 = con 
            .prepareStatement("select * from notebook where noteBookName=? and user_id=?"); 
     st1.setString(1, bname); 
     st1.setString(2,(String)session.getAttribute("id"));
     ResultSet rs=st1.executeQuery();
     String nbid="";
     if(rs.next())
     {
    	 nbid=rs.getString("Id");
     }
    	PreparedStatement st = con 
                .prepareStatement("delete from notebook where noteBookName=?"); 
         st.setString(1, bname); 
         int i=st.executeUpdate();
         if(i>0)
         {
        	 PreparedStatement st2 = con 
                     .prepareStatement("delete from note where NotebookId=?"); 
              st2.setString(1, nbid);
              st2.executeUpdate();
         }
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