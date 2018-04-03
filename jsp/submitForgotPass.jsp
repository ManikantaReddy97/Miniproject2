<%@page import="com.helper.FindUser"%>
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
<title>Submit register</title>
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
</head>
<body bgcolor="#ecf0f1">
<center>
<h1> Submit ForgotPass Page</h1>
<% 
if(FindUser.updateUserPassword(request.getParameter("username"), request.getParameter("newPass")) == true){	
 %>
 <h1> Password Successfully Updated </h1>
 <a href="<%=request.getContextPath()%>/JSP/Login.jsp">Click here to go to the Login page</a>
<%
}
else{
	%>
	<h1>  Password not Updated</h1>
     <p> <h2>Click <a href="forgotPass.jsp">here</a> to go to the ForgotPass page</h2></p>
     <%   
}
	
	%>
</center>
</body>
</html>