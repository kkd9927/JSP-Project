<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mvc.user.model.UserDTO" %>
<%
	UserDTO userInfo = (UserDTO)session.getAttribute("UserInfo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="/MyProject/pages/main/css/main.css" rel="stylesheet">
</head>
<body>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
	
	<jsp:include page="/pages/include/navbar.jsp"/>
	
	<div class="container">
		<div class="row">
			<div class="col s3">
				<jsp:include page="/pages/main/partition/userBoard.jsp"/>
			</div>
			
			<div class="col s6">
 				<jsp:include page="/pages/main/partition/category.jsp"/>
			</div>
			
			<div class="col s3"></div>
			
			<div class="col s12">
				<jsp:include page="/pages/main/partition/list.jsp"/>
			</div>
		</div>
	</div>
	
	<jsp:include page="/pages/include/footer.jsp"/>
</body>
</html>