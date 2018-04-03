<%@page import="java.sql.Date"%>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import = "javax.servlet.http.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import="com.helper.User"%>
<%@ page import="com.helper.Notification"%>
<%@page import="com.helper.NotificationData"%>
<%@ page import="com.crypto.CryptoUtils"%>
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
<title>Upload page</title>
<link rel="icon" href="<%=request.getContextPath()%>/images/i1.png">
</head>
<body bgcolor="#ecf0f1">

<%
	final String UPLOAD_DIRECTORY = "C:\\Development\\FileUpload";
    User user=(User)session.getAttribute("user");
    String filePath = UPLOAD_DIRECTORY+ File.separator + user.getUserId();
	if (ServletFileUpload.isMultipartContent(request)) {
		try {
			List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
			String fileName = null;
			String selectedUser ="";
			String wtext ="";
			for (FileItem item : multiparts) {
				
				if (!item.isFormField()) {
					File tempFile = new File(item.getName());
					fileName = tempFile.getName();

					byte[] fileBytes = item.get();

					CryptoUtils.encrypt(fileBytes, fileName, filePath);
					} else {
						 if (item.getFieldName().equalsIgnoreCase("Duser")) {
							 selectedUser = item.getString();
						 } else if (item.getFieldName().equalsIgnoreCase("wtext")) {
							 wtext = item.getString();
						 }
					}
			}
		
		     Notification notify=new Notification();
		     notify.setSenderId(user.getUserId());
		     notify.setReceiverId(Integer.parseInt(selectedUser));
		     notify.setFilePath(filePath);
		     notify.setFileName(fileName);
		     notify.setWrittenText(wtext);
		
		   NotificationData.insertNotifyRecordIntoTable(notify);
		
			request.setAttribute("message", "File Uploaded Successfully");
			System.out.println("File Uploaded Successfully");
		%>
		<h3><center> Your File has been transfered successfully to user <%= selectedUser %></center></h3>	
		<%} catch (final Exception e) {
			e.printStackTrace();
			request.setAttribute("message", "File Upload Failed.");
			%>
			<h1> <center> A problem occurred while uploading the file </center></h1> 
	      <% }
	} else {
		request.setAttribute("message", "Sorry this Servlet only handles file upload request");
	}
%>
</body>
</html>