<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.util.Date,java.text.SimpleDateFormat "%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="login.css">
</head>
<body>
<%
if(session.getAttribute("name")==null)
{
	response.sendRedirect("Login.jsp");
}
%>
<%! String b=""; %>
<div style="background-color:black;">
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <h2 style="color:white";>Hai
  <%out.print((String)session.getAttribute("name"));%></h2>
  <a href="NoteBook.jsp">NoteBooks</a>
  <a href="Dashboard.jsp">Notes</a>
  <a onclick="document.getElementById('id01').style.display='block'">Edit User</a>
</div>
<div id="id01" class="modal">
  
  <form class="modal-content animate" action="./Edituser" method="post">
  <center><P>ADD NOTEBOOK</P></center>
  
   <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
    </div>
<hr>
        <div class="container">
          <h4 class="text-center font-weight-bold"> Login </h4>
          <label for="InputName1">Username</label>
           <input type="text" name="uname" placeholder="Enter name" required>
          <label for="InputPhno1">MobileNumber</label>
          <input type="text" name="phno" placeholder="Enter Phno" required>
          <label for="InputEmail1">Email</label>
          <input type="text" name="email" placeholder="Enter email" required>
          <label for="InputPassword1">Password</label>
          <input type="password" name="psw" placeholder="Enter Password" required>
        <button type="submit" class="btn btn-primary btn-block">Submit</button>
        </div>
    </form>
</div>
<div id="main">
  <span style="font-size:25px;cursor:pointer" onclick="openNav()"><i class="fa fa-bars" style="color:white;"></i></span>
  <%
  //if(session.getAttribute("noteid")!=null)
  b=""+request.getParameter("id");
  if(!b.equals("null"))
  {
	  session.setAttribute("noteid",request.getParameter("id"));
	  out.print("<button class='addnote' onclick=document.getElementById('id02').style.display='block' style='width:auto;background-color:black;height:10px;padding:10px;outline:none;'>ADDNOTE</button>");
  }
	  else{
		  
	  }
  %>
<span style="font-size:25px;cursor:pointer" onclick="openNotification()"><i class="fa fa-bell" id="bell" style="color:white;font-size:22px;"></i></span>
<span id="notif" style="position:absolute;top:60px;border-radius:3px;right:35px;width:200px;border:1px solid black;padding:2px;display:none;background-color:white;">
<%!
public static Connection initializeDatabase() 
        throws SQLException, ClassNotFoundException 
    { 
        String dbDriver = "com.mysql.jdbc.Driver"; 
        String dbURL = "jdbc:mysql://localhost:3306/"; 
        String dbName = "notifier"; 
        String dbUsername = "root"; 
        String dbPassword = ""; 
  
        Class.forName(dbDriver); 
        Connection con = DriverManager.getConnection(dbURL + dbName, 
                                                     dbUsername,  
                                                     dbPassword); 
        return con; 
    } 
%>
<%!int c=0; %>
<%
try {
    Connection con =initializeDatabase(); 
    PreparedStatement st=null;
    if(b.equals("null")){
    st = con.prepareStatement("select * from note n,notebook nb,user u where nb.user_id=u.id and nb.id=n.NotebookId and u.id="+(String)session.getAttribute("id")+"");
    }
    else
    {
    	st=con.prepareStatement("select * from note where NoteBookId=?");
    	st.setString(1,b);
    }
    ResultSet rs=st.executeQuery();
    c=0;
    out.println("<h3>Reminder</h3>");
    while(rs.next())
    {
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	Date d=rs.getDate("EndDate");
    	String s=sdf.format(d);
    	Date d1=rs.getDate("ReminderDate");
    	String s1=sdf.format(d1);
    	Date d2=new Date();
    	String s2=sdf.format(d2);
    	if(s2.compareTo(s1)==0)
    	{
    		c++;
    		out.println("<hr><a href='noteDetails.jsp?NoteName="+rs.getString(1)+"'><center>"+rs.getString("NoteName")+"</a><br>"+rs.getDate("StartDate")+"</center>");
    		//out.println("<h4>"+rs.getString("NoteName")+"</h4><h6>StartDate: "+rs.getDate("StartDate")+"<br>EndDate: "+rs.getString("EndDate")+"</h6>");
    	}   	
    }
    st.close(); 
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
</span>
<span class="badge">
<%=c %>
</span>
<a href="Signout.jsp"><i class="fa fa-sign-out" id="signout" style="color:white;font-size:20px;">Signout</i></a>
</div>

<div class="leftdiv">
<h3>Your daily Tasks!!!!!!</h3>
<%//if(session.getAttribute("noteid")!=null)
	 // {
try {
	Connection con =initializeDatabase(); 
	PreparedStatement st1=null;
	if(b.equals("null")){
	    st1 = con.prepareStatement("select * from note n,notebook nb,user u where nb.user_id=u.id and nb.id=n.NotebookId and u.id="+(String)session.getAttribute("id")+"");
	    }
	    else
	    {
	    	st1=con.prepareStatement("select * from note where NoteBookId=?");
	    	st1.setString(1,b);
	    }  
	ResultSet rs=st1.executeQuery();
    while(rs.next())
    {
    	out.println("<h4>"+rs.getString("NoteName")+"</h4><h6>StartDate: "+rs.getDate("StartDate")+"<br>EndDate: "+rs.getString("EndDate")+"</h6>");
    }
    st1.close(); 
    
} 
catch (Exception e) { 
    e.printStackTrace(); 
}
%>
</div>
<div class="rightdiv">
<form class="example" action="" style="margin:auto;max-width:300px" method="post">
  <input type="text" placeholder="Search.." name="search2" value="">
  <button type="submit"><i class="fa fa-search"></i></button>
</form>
<div id="id02" class="modal">
  
  <form name="form" class="modal-content animate" action="addnote.jsp" method="post">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">&times;</span>
    </div>

    <div class="container">
      <label for="uname"><b>NoteName</b></label><br>
      <input type="text" placeholder="noteBookName" name="nname" required>  
      <label for="sdate"><b>StartDate</b></label>
      <input type="date" name="sdate" required>  
      <label for="edate"><b>EndDate</b></label>
      <input type="date" name="edate" required>  
      <label for="rdate"><b>RemainderDate</b></label>
      <input type="date" name="rdate" required><br>  
      <label for="status"><b>Status</b></label><br>
      <select name="status"><br>
      <option value="Started" selected>Started</option>
      <option value="Progess">Inprogess</option>
      <option value="Completed">Completed</option>
      </select name="tag"><br>
      <label for="tag"><b>Tag</b></label><br>
      <select name="tag">
      <option value="Private" selected>Private</option>
      <option value="Public">Public</option>
      </select>  <br>
      <label for="description"><b>Description</b></label><br>
      <textarea rows="5" cols="145" placeholder="Write notes.." name="description"></textarea>    
      <button type="submit" >submit</button>
    </div>
</div>
Notes
<%
try {
	Connection con =initializeDatabase(); 
	PreparedStatement st1=null;
	String s=""+request.getParameter("search2");
	if(!s.equals("null")){
    st1 = con.prepareStatement("select * from note n,notebook nb,user u where n.NoteName like'%"+s+"%' and nb.user_id=u.id and nb.id=n.NotebookId and u.id="+(String)session.getAttribute("id")+"");
	}
	else
	{
		if(b.equals("null")){
		    st1 = con.prepareStatement("select * from note n,notebook nb,user u where nb.user_id=u.id and nb.id=n.NotebookId and u.id="+(String)session.getAttribute("id")+"");
		    }
		    else
		    {
		    	st1=con.prepareStatement("select * from note where NoteBookId=?");
		    	st1.setString(1,b);
		    }}
    ResultSet rs=st1.executeQuery();
    while(rs.next())
    {
    	String desc=""+request.getParameter("value");
    	if(desc.equals("null")){
   			b=rs.getString(7);
    		out.println("<div class='notediv'><h6>"+"<a href='noteDetails.jsp?NoteName="+rs.getString(1)+"' style='padding:0px 10px;'>"+rs.getString("NoteName")+"</a>"+"Started on: "+rs.getDate("StartDate")+"<input type='submit' value="+rs.getString("status")+"></h6>");
    		out.println("<a href='Dashboard.jsp?value="+rs.getString(7)+"' style='padding:1px;width:10px'>+</a>"+
    				"<a href='deleteNote.jsp?NoteName="+rs.getString(1)+"&NotebookId="+rs.getString("NotebookId")+"' style='float:right;padding:0px 20px;'>delete</a>"
    			    +"<a href='editNote.jsp?NoteName="+rs.getString(1)+"&NotebookId="+rs.getString("NotebookId")+"' style='float:right;'>Edit</a><br>"+
    					"</div>");
    	}
    	else
    	{
    		b=rs.getString(7);
    		out.println("<div class='notediv'><h6>"+"<a href='noteDetails.jsp?NoteName="+rs.getString(1)+"' style='padding:0px 10px;'>"+rs.getString("NoteName")+"</a>"+"Started on: "+rs.getDate("StartDate")+"<input type='submit' value="+rs.getString("status")+"></h6>");
    		out.println("<a href='Dashboard.jsp' style='padding:1px;width:10px'>+</a>"+
    				"<a href='deleteNote.jsp?NoteName="+rs.getString(1)+"&NotebookId="+rs.getString("NotebookId")+"' style='float:right;padding:0px 20px;'>delete</a>"
    			    +"<a href='editNote.jsp?NoteName="+rs.getString(1)+"&NotebookId="+rs.getString("NotebookId")+"' style='float:right;'>Edit</a><br>"+
    					"<p>"+b+"</p>"
    			    		+"</div>");
    	}
    }
    st1.close(); 
    con.close();
} 
catch (Exception e) { 
    e.printStackTrace(); 
} 
%>
</div>
<script>
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
function openNotification()
{
	if(document.getElementById("notif").style.display==="none")
		document.getElementById("notif").style.display="inline";
	else 
		document.getElementById("notif").style.display="none";
}

</script>
</body>
</html> 
 