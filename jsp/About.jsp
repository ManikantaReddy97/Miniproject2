<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width,initial-scale=1">
<head>
	<title>
		About the site
	</title>
	<style type="text/css">
	h1{

		color: black;
	}
	p{
		font-size: 20px;
		font-family: verdana;
		text-align: center;
		color: black;
	}
	ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #111111;
}

li {
    float: left;
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 30px;
    text-decoration: none;
}

li a:hover {
    background-color: #4F4F4F;
    -ms-transform: scale(1.5); 
    -webkit-transform: scale(1.5); 
    transform: scale(1.5); 
}
</style>
<link rel="icon" href="<%=request.getContextPath()%>/images/i1.png">
</head>
<body bgcolor="FFFFFF">
<div class="w3-container w3-black">
<nav class="w3-bar w3-black w3-container">
 <ul class="nav navbar-nav"><li class="active"><a href="<%=request.getContextPath()%>/JSP/Home.jsp"><i class="fa fa-home" style="font-size:20px;color:white"></i>    Home</a></li>
  <li><a href="<%=request.getContextPath()%>/JSP/contact.jsp">Contact</a></li>
   <li><a href="<%=request.getContextPath()%>/JSP/Pre.jsp">Previous Transfers </a></li>
  <li><a href="<%=request.getContextPath()%>/JSP/About.jsp">About</a></li>
  <li style="float:right"><a href="<%=request.getContextPath()%>/JSP/Login.jsp"><i class="fa fa-sign-in" style="font-size:20px;color:white"></i>    Login</a></li>
  <li style="float:right"><a href="<%=request.getContextPath()%>/JSP/Register.jsp"><i class="fa fa-user" style="font-size:20px;color:white"></i>    Sign Up</a></li>
</ul>
</nav>
</div>
<br><br>
<h1> About the site </h1>
<div>
<p>
	This site is mainly for those users who want a secure way for transferring the data from one user to another. 
	Here we are using various levels of security during	authentication and during the data transfer to give a good and secure user experience.
	So checkout the site and see the difference in terms of security.
</p>
</div>
</body>
</html>