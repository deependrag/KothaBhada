<!DOCTYPE html>
<html>
<%@page import="Connection.ConnectionManager"%>
<%@page import="java.sql.*"%>
<%@page import="com.kothabhada.ClientDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600'
	rel='stylesheet' type='text/css'>
<link
	href="//netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css"
	rel="stylesheet">
<link rel="stylesheet" href="assets/css/formStyle.css">
</head>
<body>
	<%
		response.setHeader("Cache-Control", "no-cache, no-store ,must-revalidate");//HTTP 1.1
		response.setHeader("Pragma", "no-cache");//HTTP 1.0
		response.setHeader("Expires", "0"); //Proxies
		
		ClientDto clientDto = new ClientDto();
		
		if (!session.getAttribute("user_role").equals("admin")) {
			response.sendRedirect("./index.jsp");
		}else{
			if(session.getAttribute("edit_user_details") == null){
				response.sendRedirect("./DisplayClient");
			}else{
				clientDto = (ClientDto) session.getAttribute("edit_user_details");
			}
		}
		
	%>
	<div class="testbox">
		<h1>Edit</h1>
		<form action="./UpdateUser?id=<%= clientDto.getCid()%>" method="post">
			<hr>
			<label id="icon" for="name"><i class="icon-envelope "></i></label> <input
				type="text" name="email" id="name" value="<%=clientDto.getEmail()%>"
				required /> <label id="icon" for="name"><i
				class="icon-user"></i></label> <input type="text" name="name" id="name"
				value="<%=clientDto.getName()%>" required /> <label id="icon"
				for="name"><i class="icon-shield"></i></label> <input
				type="password" name="password" id="name"
				value="<%=clientDto.getPass()%>" required />
			<c:if test="${not empty alertMsg}">
				<p class="alert-message warning">
					<i class="ico fa fa-exclamation-circle"></i> ${alertMsg}
				</p>
			</c:if>
			<a href="" class="button"><input type="submit" class="btn"
				value="Update" /></a>
		</form>
	</div>
</body>
</html>