<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="/MyProject/pages/board/css/board.css" rel="stylesheet">
</head>
<body>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
	<script src="/MyProject/pages/board/js/board.js"></script>
	<script src="/MyProject/pages/user/js/user.js"></script>

	<jsp:include page="/pages/include/navbar.jsp" />

	<div class="container">
		<div class="row">
			<div class="col s12 center-align">
				<h1>회원가입</h1>
			</div>
		</div>
		
		<div class="row">
			<div class="col s3"></div>

			<form action="/MyProject/pages/user/signupSend.user" method="post" name="signupForm" enctype="multipart/form-data" class="col s6">
				<div class="row">
					<div class="input-field col s12">
						<input id="id" name="id" type="text">
						<label for="id">아이디</label>
					</div>
				</div>

				<div class="row">
					<div class="input-field col s6">
						<input id="pw" name="pw" type="password">
						<label for="pw">비밀번호</label>
						<span class="helper-text" data-error="wrong" data-success="right">영문 대/소문자 및 숫자 조합 8자 이상</span>
					</div>
					
					<div class="input-field col s6">
						<input id="check_pw" type="password">
						<label for="check_pw">비밀번호 확인</label>
					</div>
				</div>

				<div class="row">
					<div class="input-field col s12">
						<input id="nickname" name="nickname" type="text">
						<label for="nickname">닉네임</label>
					</div>
				</div>
				
				<div class="row">
					<div class="file-field input-field col s12">
						<div class="btn z-depth-0 yellow darken-3">
							<span>File</span>
							<input type="file" name="profileImg">
						</div>
						
						<div class="file-path-wrapper">
							<input type="text" placeholder="프로필 이미지(5MB 이하)" class="file-path validate">
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col s6 left-align">
						<a href="/MyProject/pages/main/main.jsp" class="btn-large z-depth-0 blue-grey lighten-2">취소</a>
					</div>
					
					<div class="col s6 right-align">
						<a onClick="signupCheck()" class="btn-large z-depth-0 yellow darken-3">가입하기</a>
					</div>				
				</div>
			</form>

			<div class="col s3"></div>
		</div>
	</div>

	<jsp:include page="/pages/include/footer.jsp" />
</body>
</html>