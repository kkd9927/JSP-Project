<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색결과</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="/MyProject/pages/main/css/main.css" rel="stylesheet">
</head>
<body>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
	
	<jsp:include page="/pages/include/navbar.jsp"/>
	
	<div class="container">
		<div class="row">
			<div class="col s3"></div>
			
			<div class="col s6">
				<div class="valign-wrapper center-align" style="height: 600px">
					<h3>회원탈퇴가 완료되었습니다.</h3>
				</div>
				<div class="center-align">
					<a href="/MyProject/pages/user/signup.user" class="btn-large z-depth-0 yellow darken-3">회원가입</a>
					<a href="/MyProject/pages/main/main.jsp" class="btn-large z-depth-0 yellow darken-3">메인으로</a>
				</div>
			</div>
			
			<div class="col s3"></div>
		</div>
	</div>
	
	<jsp:include page="/pages/include/footer.jsp"/>
</body>
</html>