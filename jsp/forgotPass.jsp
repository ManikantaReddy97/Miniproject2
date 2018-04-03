<%@page import="com.helper.User"%>
<%@page import="com.helper.RecoveryAnswer"%>
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
<title>Insert title here</title>
<link rel="icon" href="<%=request.getContextPath()%>/images/i1.png">
<style type="text/css">
label {
	color: black;
	font-size: 20px;
	font-family: arial;
}

h3 {
	font-style: bold;
}
</style>

<script type="text/javascript">
function val1(){
	  var firstPass= document.getElementById("newPass").value;
	  var secondPass= document.getElementById("confPass").value;
	  
	  if(firstPass != secondPass){
		   alert("Password doesn't match");
	     return false;
	  }	  
}
</script>
</head>
<body bgcolor="#ecf0f1">
<% 
if(RecoveryAnswer.userRecoveryAnswer(request.getParameter("username"), request.getParameter("Answer")) == true){	
 %>
 <h2> Correct Answer Entered </h2>
<%
}
else{
	%>
	<h1> Answer Entered is Incorrect, Please Re-Enter the Answer</h1>
	<% 
      response.sendRedirect("recoveryPage.jsp?username="+request.getParameter("username"));
     %> <%    
}
	
	%>
	<form action="<%=request.getContextPath()%>/JSP/submitForgotPass.jsp" method="post">
		<input type="hidden" name="username" value="<%= request.getParameter("username") %>">
		<center>
		<%User user=new User(); 
	     user.setUserName(request.getParameter("Uname"));
	%>
       <h2>Hello   <%= request.getParameter("username") %> don't Worry if you forgot your password</h2>
			<br>
			<br>
			<div>
				<label for="newPass"> Enter the new Password: <input id="newPass" type="password" name="newPass" size="32" placeholder="Enter the new Password here..." required></label><br>
				<br> <label for="confPass"> Confirm the new Password: <input id="confPass" type="password" name="confPass" size="32"
					placeholder="Re-Enter the new Password here..." required></label><br>
			</div>
			<br>
			<br> <input type="submit" class="w3-btn w3-black" value="submit" onclick="val1()"/>
		</center>
	</form>
</body>
</html>