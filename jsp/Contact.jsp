<%@page import="com.helper.RegisterForm"%>
<%@page import="com.helper.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
<title>Contact Page</title>
<link rel="icon" href="<%=request.getContextPath()%>/images/i1.png">
<style type="text/css">
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
</head>
<body bgcolor="#FFFFFF">
	<div class="w3-container w3-black">
<nav class="w3-bar w3-black w3-container">
 <ul class="nav navbar-nav"><li class="active"><a href="<%=request.getContextPath()%>/JSP/Home.jsp"><i class="fa fa-home" style="font-size:20px;color:white"></i>    Home</a></li>
  <li><a href="<%=request.getContextPath()%>/JSP/contact.jsp">Contact</a></li>
  <li><a href="<%=request.getContextPath()%>/JSP/Pre.jsp">Previous Transfers </a></li>
  <li><a href="<%=request.getContextPath()%>/JSP/About.jsp">About</a></li>
  </ul>
</nav>
</div>
<br><br>
<center>
	<div class="w3-container w3-content w3-padding-64" style="max-width:800px" id="contact">
    <h1 class="w3-wide w3-center">CONTACT</h1>
    <h2 class="w3-opacity w3-center">For any problems during the login or during the data transfer? Drop a Note!<i></i></h2>
    <div class="w3-row w3-padding-32">
      <div class="w3-col m6 w3-large w3-margin-bottom">
        <i class="fa fa-map-marker" style="width:30px"></i> City, Country<br><br>
        <i class="fa fa-phone" style="width:30px"></i> Phone: +00 10191191<br><br>
        <i class="fa fa-envelope" style="width:30px"> </i> Email: mail@mail.com<br><br>
      </div>
      <div class="w3-col m6">
        <form action="/action_page.php" target="_blank">
          <div class="w3-row-padding" style="margin:0 -16px 8px -16px">
            <div class="w3-half">
              <input class="w3-input w3-border" type="text" placeholder="Name" required name="Name"><br><br>
            </div>
            <div class="w3-half">
              <input class="w3-input w3-border" type="text" placeholder="Email" required name="Email"><br><br>
            </div>
          </div>
          <input class="w3-input w3-border" type="text" placeholder="Message" required name="Message"><br><br>
          <button class="w3-button w3-black w3-section w3-right" type="submit">SEND</button>
        </form>
      </div>
    </div>
  </div>
</center>
</body>
</html>

