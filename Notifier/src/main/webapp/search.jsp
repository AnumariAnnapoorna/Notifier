<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="Dashboard.jsp"/>
<%
//if(session.getAttribute("noteid")!=null)
//{	  
String dbDriver = "com.mysql.jdbc.Driver"; 
String dbURL = "jdbc:mysql://localhost:3306/"; 
String dbName = "notifier"; 
String dbUsername = "root"; 
String dbPassword = "";  
Class.forName(dbDriver); 
Connection con = DriverManager.getConnection(dbURL + dbName, 
                                             dbUsername,  
                                             dbPassword);
try {
	PreparedStatement st1=null;
	String s=""+request.getParameter("search2");
	//out.println(s);
	if(!s.equals("null")){
    st1 = con.prepareStatement("select * from note where NoteName like'%"+s+"%'");
	}
    ResultSet rs=st1.executeQuery();
    while(rs.next())
    {
    		out.println("<div class='notediv'><h6>"+"<a href='noteDetails.jsp?NoteName="+rs.getString(1)+"' style='padding:0px 10px;'>"+rs.getString("NoteName")+"</a>"+"Started on: "+rs.getDate("StartDate")+"<input type='submit' value="+rs.getString("status")+"></h6>");
    		out.println("<a href='#desc?value="+rs.getString(7)+"' style='padding:1px;width:10px'>+</a><br><span id='desc' value=''></span></div>");
    }
    st1.close(); 
    con.close();
} 
catch (Exception e) { 
    e.printStackTrace(); 
} 
%>
</body>
</html>