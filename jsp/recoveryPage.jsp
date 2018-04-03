<%@page import="com.helper.RecoveryQuestion"%>
<%@page import="com.helper.Question"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.RecoveryAnswer"%>
<%@page import="com.helper.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<head>
<title>Recovery</title>
<link rel="icon" href="<%=request.getContextPath()%>/images/i1.png">
<style type="text/css">
label {
	color: black;
	font-size: 17px;
	font-family: arial;
}

h3 {
	font-style: bold;
}
</style>
</head>
<body bgcolor="#ecf0f1">
	<center>
	<%User user=new User(); 
	  user.setUserName(request.getParameter("Uname"));
	%>
  <h2>Hello   <%= request.getParameter("username") %>  enter your recovery answer to change your password.</h2>	
	<h2> RECOVERY</h2>
		<br>
		<form action="<%=request.getContextPath()%>/JSP/forgotPass.jsp" method="post">
			<br>
			<input type="hidden" name="username" value="<%= request.getParameter("username") %>">
			
			<div>
			<label for="rquestion">Recovery Question: </label> <select
				name="Requestion">
				<%
					List<Question> questions = RecoveryQuestion.getAllQuestions();
					for (final Question question : questions) {
				%>
					<option value="<%=question.getQid()%>"><%=question.getQvalue()%></option>
				<%
					}
				%>
			</select>
		</div>
			<br> <br>
			<div>
				<label for="answer">Enter your Answer Here: <input id="answer" type="text" name="Answer" size="20" placeholder="Enter the answer here..." required></label><br> <br>			
			</div>
			<br> <br> <input type="submit" class="w3-btn w3-black" value="submit" />
	</center>
	</form>
	</center>	
</body>
</html>
