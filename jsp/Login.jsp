<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<head>
	<title>
		Login Page
	</title>
<link rel="icon" href="<%=request.getContextPath()%>/images/i1.png">
<style type="text/css">
		body{
			text-align: center;
		}
		.b1 {
  padding: 10px 20px;
  font-size: 15px;
  text-align: center;
  cursor: pointer;
  outline: none;
  color: #fff;
  background-color: #303030;
  border: none;
  border-radius: 10px;
  box-shadow: 0 5px #303030;
}

.b1:hover {background-color: #303030}

.b1:active {
  background-color: #303030;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
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
	<script type="text/javascript">
       function getInput(){
	var username=document.getElementById("uname").value;
	alert("username  "+username);
	document.getElementById('forGotPassowrdId').setAttribute("href", "<%=request.getContextPath()%>/JSP/recoveryPage.jsp?username="+username);
}
  
</script>
</head>
<body bgcolor="#ecf0f1">
<div class="w3-container w3-black">
<nav class="w3-bar w3-black w3-container">
 <ul class="nav navbar-nav"><li class="active"><a href="<%=request.getContextPath()%>/JSP/Home.jsp"><i class="fa fa-home" style="font-size:20px;color:white"></i>   Home</a></li>
  <li><a href="<%=request.getContextPath()%>/JSP/Contact.jsp">Contact</a></li>
  <li><a href="<%=request.getContextPath()%>/JSP/About.jsp">About</a></li>
  <li style="float:right"><a href="<%=request.getContextPath()%>/JSP/Login.jsp"><i class="fa fa-sign-in" style="font-size:20px;color:white"></i>    Login</a></li>
  <li style="float:right"><a href="<%=request.getContextPath()%>/JSP/Register.jsp"><i class="fa fa-user" style="font-size:20px;color:white"></i>     Sign Up</a></li>
</ul>
</nav>
</div>
<br><br>
<h1>Login Form</h1>
<form action="<%=request.getContextPath()%>/JSP/submitLogin.jsp" method="post">
<center> 
<div>
<label for="uname">User Name:  <input id="uname" type="text" name="Uname" placeholder="Username" required size="40"/></label>
<br><br>	
<label for="pass">Password: <input id="pass" type="password" name="Pass" placeholder="Password" required size="40"/></label><br><br>
</div>
<br><br>
<input type="submit" class="w3-btn w3-black" value="Login"/>
<br><br>
<a id="forGotPassowrdId" href="#" onclick="getInput()">Forgot Password</a><br><br>
</center>
</form>
</body>
</html>