<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String url = request.getHeader("referer");
%>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="/MyProject/pages/board/css/board.css" rel="stylesheet">
</head>
<body>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
	<script src="/MyProject/pages/board/js/board.js"></script>

	<script type="text/javascript">
		function loginCheck() {
			document.loginForm.submit();
		}
	</script>

	<jsp:include page="/pages/include/navbar.jsp" />

	<div class="container">
		<div class="row">
			<div class="col s12 center-align">
				<h1>로그인</h1>
			</div>
		</div>
		
		<div class="row">
			<div class="col s4"></div>

			<form action="/MyProject/pages/user/loginSend.user?url=<%= url %>" method="post" name="loginForm" class="col s4">
				<div class="row">
					<div class="input-field col s12">
						<input id="id" name="id" type="text">
						<label for="id">아이디</label>
					</div>
				</div>

				<div class="row">
					<div class="input-field col s12">
						<input id="pw" name="pw" type="password">
						<label for="pw">비밀번호</label>
					</div>
				</div>
				
				<div class="row">
					<div class="col s6 right-align">
						<a onClick="loginCheck()" class="btn-large z-depth-0 yellow darken-3">로그인</a>
					</div>
					
					<div class="col s6 left-align">
						<a href="/MyProject/pages/user/signup.user" class="btn-large z-depth-0 yellow darken-3">회원가입</a>
					</div>
				</div>
			</form>

			<div class="col s4"></div>
		</div>
		
		<div class="row">
			<div class="col s12" style="height: 115px;"></div>
		</div>
	</div>

	<jsp:include page="/pages/include/footer.jsp" />
</body>
</html>