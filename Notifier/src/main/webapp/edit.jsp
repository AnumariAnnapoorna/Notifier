<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="login.css">
<title>Insert title here</title>
</head>
<body onload="document.getElementById('id01').style.display='block'">
<h2>Modal Login Form</h2>


<div id="id01" class="modal">
  
  <form class="modal-content animate" action="editbook.jsp" method="post">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
    </div>

    <div class="container">
      <label for="uname"><b>Username</b></label>
      <input type="text" placeholder="Enter Username" name="uname" required>  
      <button type="submit">Login</button>
    </div>
</div>
<script>
var modal = document.getElementById('id01');

window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
<%String nname=request.getParameter("uname");
session.setAttribute("notebookname",request.getParameter("noteBookName")); %>
</body>
</html>