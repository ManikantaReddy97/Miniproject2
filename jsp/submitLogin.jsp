<%@page import="com.helper.RegisterForm"%>
<%@page import="com.helper.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width,initial-scale=1">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Submit Login</title>
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

.dropbtn {
    display: inline-block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
    margin-top: 16px;
}
.dropdown:hover .dropbtn {
    background-color: #4F4F4F;
}
li.dropdown {
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 120px;
    box-shadow: 0px 10px 18px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    text-align: left;
}

.dropdown-content a:hover {background-color: #f1f1f1}

.dropdown:hover .dropdown-content {
    display: block;
}
	</style>
	
	<script type="text/javascript">
      function getUsername(){
	var username=document.getElementById("uname").value;
	  alert("username  "+username);
	 document.getElementById('successLoginId').setAttribute("href", "<%=request.getContextPath()%>/JSP/successLogin.jsp?username="+username);
} 
</script>
</head>
<body bgcolor="skyblue">
	<div class="w3-container w3-black">
    <nav class="w3-bar w3-black w3-container">
    <ul class="nav navbar-nav">
    <li class="active"><a href="<%=request.getContextPath()%>/JSP/Home.jsp">Home</a></li>
    <li><a href="#contact">Contact</a></li>
    <li class="dropdown">
    <a href="javascript:void(0)" class="dropbtn">Previous Transfers</a>
    <div class="dropdown-content">
    <a href="#">Last Week</a>
    <a href="#">Last Month</a>
      <a href="#">Last Several Months</a>
    </div>
  </li>
  <li style="float:right"><a class="active" href="<%=request.getContextPath()%>/JSP/Home.jsp">Logout</a>
  </li>
  </ul>
 </nav>
 </div>
 <br><br>  
  <%if ((request.getParameter("Uname")== null) && request.getParameter("Pass")== null) {
  	    response.sendRedirect("failureLogin.jsp");
     }%>
  
  <% User user = new User();
  		user = RegisterForm.fetchData(request.getParameter("Uname"),request.getParameter("Pass"));
  %>
  
  <%if (user== null) {
	  response.sendRedirect("failureLogin.jsp");
  }
  
  else{ %>
	  <h2>Click here to go to the Data Transfer Page</h2>
      <a id="successLoginId" href="#" onclick="getUsername()">   Click here to go to the Data Transferring Page </a><br><br>
      <% 
	   session.setAttribute("user",  user);
       response.sendRedirect("successLogin.jsp?username="+request.getParameter("Uname"));
  } %>
 </body>
</html>