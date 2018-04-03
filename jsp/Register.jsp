<%@page import="com.helper.RecoveryQuestion"%>
<%@page import="com.helper.Question"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<head>
	<title>Registration form
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
a:hover {
	color: white;
	 -ms-transform: scale(1.6); 
    -webkit-transform: scale(1.6); 
    transform: scale(1.6); 
}

label{
      color: black;
      font-size: 20px;
      font-family: arial;
    }

    h1{
      font-style: bold;
    }
    
	</style>

<script type="text/javascript">
	var f1,f2="select",f3=0;
	function fun(){
		
		 var x = document.getElementById("pass");
		    if (x.type === "password") {
		        x.type = "text";
		    } else {
		        x.type = "password";
		    }
	}
	
	function verifyPass(){
		f1=document.reg_form.Pass.value;
		if(f1=="")
			alert("Enter the Password to Continue");
	}
	
</script>
</head>
<body bgcolor="#ecf0f1">
<div class="w3-container w3-black">
<nav class="w3-bar w3-black w3-container">
 <ul class="nav navbar-nav"><li class="active"><a href="<%=request.getContextPath()%>/JSP/Home.jsp"><i class="fa fa-home" style="font-size:20px;color:white"></i>   Home</a></li>
  <li><a href="<%=request.getContextPath()%>/JSP/contact.jsp">Contact</a></li>
  <li><a href="<%=request.getContextPath()%>/JSP/About.jsp">About</a></li>
  <li style="float:right"><a href="<%=request.getContextPath()%>/JSP/Login.jsp"><i class="fa fa-sign-in" style="font-size:20px;color:white"></i>     Login</a></li>
  <li style="float:right"><a href="<%=request.getContextPath()%>/JSP/Register.jsp"><i class="fa fa-user" style="font-size:20px;color:white"></i>     Sign Up</a></li>
</ul>
</nav>
</div>
<br><br>
<h1>Registration Form</h1>
<h3> Please fill in this form to create an account</h3><br>
<form method="post" action="submitRegister.jsp" name="reg_form"> 
<label for="first">First Name: <input id="first" type="text" name="First" placeholder="John" required></label><br><br>
<label for="last">Last Name: <input id="last" type="text" name="Last" placeholder="smith" required></label><br><br>
<label for="uname">User Name: <input id="uname" type="text" name="Uname" placeholder="john123" required></label><br><br>
<div>
<label for="email"> Email           :     <input id="email" type="Email" name="Email" placeholder="Your Email" required></label><br><br>
<label for="pass">Password: <input id="pass" type="Password" name="Pass" placeholder="Enter the password" required></label><br><br>
<label for="spass"><input id="spass" type="checkbox" name="Spass" onclick="fun()">  Show Password</label><br><br>
<label for="pass">Passwords:</label><br><br>
<label for="pass1">Textual Passwords<input id="pass1" type="checkbox" name="pass1"></label>
<label for="pass2">Color Rating<input id="pass2" type="checkbox" name="pass2"></label>
<label for="pass3">Image Clicks<input id="pass" type="checkbox" name="pass3"></label>
<label for="pass4">Random Images<input id="pass" type="checkbox" name="pass4"></label><br><br>
</div>
		<div>
			<label for="rquestion">Recovery Question: </label> <select
				name="Requestion" onclick="verifyPass()">
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
	<label for="answer">Enter your Answer Here: <input id="answer" type="text" name="Answer" placeholder="Enter the answer here..." required></label><br><br>
	</div>
<br>
<input type="submit" class="w3-btn w3-black" value="submit"/>
</form>
</body>
</html>