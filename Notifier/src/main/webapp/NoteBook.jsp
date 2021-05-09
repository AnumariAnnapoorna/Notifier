<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="login.css">
<title>Insert title here</title>
</head>
<body>
<div style="background-color:black;">
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <h2 style="color:white";>Hai
  <%out.print((String)session.getAttribute("name"));%></h2>
  <a href="NoteBook.jsp">NoteBooks</a>
  <a href="Dashboard.jsp">Notes</a>
  <a href="EditUser.html">Edit User</a>
</div>

<div id="main">
  <span style="font-size:25px;cursor:pointer" onclick="openNav()"><i class="fa fa-bars" style="color:white;"></i></span>
<button class="addnotebook" onclick="document.getElementById('id01').style.display='block'" style="width:auto;background-color:black;height:10px;padding:10px;outline:none;">NEW NOTEBOOK</button>
<i class="fa fa-sign-out" id="signout" style="color:white;font-size:20px;">Logout</i>

</div>
</div>

<div id="id01" class="modal">
  
  <form class="modal-content animate" action="NoteBook.jsp" method="post">
  <center><P>ADD NOTEBOOK</P></center>
  
   <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
    </div>
<hr>
    <div class="container">
      <label for="uname"><b>NoteBookName</b></label><br>
      <input type="text" placeholder="noteBookName" name="bname" required>  
      <button type="submit" onclick="fun1()">submit</button>
    </div>
    </form>
</div>
<div id="id02" class="modal">
  
  <form class="modal-content animate" action="addnote.jsp" method="post">
  <center><P>ADD NOTE</P></center>
  
   <div class="imgcontainer">
      <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">&times;</span>
    </div>
<hr>
    
    </form>
</div>

<form class="example" action="" style="margin:auto;max-width:300px" method="post">
  <input type="text" placeholder="Search.." name="search2">
  <button type="submit"><i class="fa fa-search"></i></button>
</form>
<p style="font-size:20px;">Note Books<p>

<%
String dbDriver = "com.mysql.jdbc.Driver"; 
String dbURL = "jdbc:mysql://localhost:3306/"; 
String dbName = "notifier"; 
String dbUsername = "root"; 
String dbPassword = "";  
String bname=""+request.getParameter("bname");
String search=""+request.getParameter("search2");

try {
	Class.forName(dbDriver); 
	Connection con = DriverManager.getConnection(dbURL + dbName, 
	                                             dbUsername,  
	                                             dbPassword);
	PreparedStatement st1=null;
	if(!bname.equals("null")){
    st1 = con.prepareStatement("select * from notebook where noteBookName=? and user_id=?");
     st1.setString(1,bname);
     st1.setString(2,(String)session.getAttribute("id"));
     
    ResultSet rs=st1.executeQuery();
    if(rs.next()){
    }
    else
    {
    	PreparedStatement st = con 
                .prepareStatement("insert into notebook(noteBookName,user_id) values(?,?)"); 
         st.setString(1,bname); 
         st.setString(2,(String)session.getAttribute("id"));
         st.executeUpdate();
    }}
    if(!search.equals("null")){
    st1 = con.prepareStatement("select * from notebook where user_id=? and noteBookName like '%"+search+"%'");}
    else{
    	st1 = con.prepareStatement("select * from notebook where user_id=?");
    }
    st1.setString(1,(String)session.getAttribute("id"));
   ResultSet rs1=st1.executeQuery();
    while(rs1.next())
    {
    	 session.setAttribute("noteid"," ");
    	String s=rs1.getString("noteBookName");
    	out.println("<div style='margin:5% 10%;background-color:#F0F3F3;width:80%;height:30px;padding:5px 7px 7px 10px;'>"
    +"<div style='background-color:white;'>"
    + "<a href='Dashboard.jsp?id="+rs1.getString(1)+"' style='padding:5px;'>"+s+"</a>"
    		+"<a href='delete.jsp?noteBookName="+s+"' style='float:right;padding:0px 20px;'>delete</a>"
    +"<a href='edit.jsp?noteBookName="+s+"' style='float:right;'>Edit</a>"
    		+ "</div>"
    		+ "</div>");
    }
    st1.close(); 
    con.close();
} 
catch (Exception e) { 
    e.printStackTrace(); 
} 
%>
<%!
int fun()
{
return 1;
}%>
<script>
var modal = document.getElementById('id01');

window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
var modal = document.getElementById('id02');

window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
  document.getElementById("main").style.marginLeft = "250px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0px";
  document.getElementById("main").style.marginLeft = "0px";
}
</script>
</body>
</html>