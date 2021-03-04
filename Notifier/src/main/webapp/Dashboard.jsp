<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="login.css">
</head>
<body>
<div style="background-color:black;">
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="#">NoteBooks</a>
  <a href="#">Notes</a>
  <a href="EditUser.html">Edit User</a>
</div>

<div id="main">
  <span style="font-size:25px;cursor:pointer" onclick="openNav()"><i class="fa fa-bars" style="color:white;"></i></span>
<i class="fa fa-bell" id="bell" style="color:white;font-size:22px;"></i>
<i class="fa fa-sign-out" id="signout" style="color:white;font-size:20px;">Signout</i>
<span class="badge">3</span>
</div>
</div>
<script>
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
 