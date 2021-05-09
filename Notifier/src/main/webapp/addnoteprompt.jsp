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
  
  <form class="modal-content animate" action="addnote.jsp" method="post">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
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
      <option value="Progess">Progess</option>
      <option value="Completed">Completed</option>
      </select name="tag"><br>
      <label for="tag"><b>Tag</b></label><br>
      <select name="tag">
      <option value="Private" selected>Private</option>
      <option value="Public">Public</option>
      </select>  <br>
      <label for="description"><b>Description</b></label><br>
      <textarea rows="5" cols="145" placeholder="Write notes.." name="description"></textarea>    
      <button type="submit" onclick="fun1()">submit</button>
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