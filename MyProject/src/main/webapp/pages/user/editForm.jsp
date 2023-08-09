<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="mvc.user.model.UserDTO" %>
<%
	UserDTO userInfo = (UserDTO)session.getAttribute("UserInfo");
	String id = userInfo.getId();
	String pw = userInfo.getPw();
	String nickname = userInfo.getNickname();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정</title>
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
				<h1>정보수정</h1>
			</div>
		</div>
		
		<div class="row">
			<div class="col s12 center-align">
				<img src="/MyProject/upload/profile/<%= userInfo.getProfileImg() %>" width="150" height="150" class="circle">
				<br>
			</div>
			
			<div class="col s3"></div>
			
			<form action="/MyProject/pages/user/editInfoSend.user" method="post" name="editForm" enctype="multipart/form-data" class="col s6">
				<div class="row">
					<div class="input-field col s12">
						<input id="id" name="id" type="text" value="<%= userInfo.getId() %>" readonly>
						<label for="id">아이디</label>
					</div>
				</div>

				<div class="row">
					<div class="input-field col s10">
						<input id="pw" name="pw" type="password" value="<%= userInfo.getPw() %>" readonly>
						<label for="pw">비밀번호</label>
					</div>
					<div class="col s2">
						<button type="button" id="change_pw" onClick="btnChangeState(this)" class="btn-small z-depth-0 yellow darken-3">변경</button>
					</div>
				</div>

				<div class="row">
					<div class="input-field col s10">
						<input id="nickname" name="nickname" type="text" value="<%= userInfo.getNickname() %>" readonly>
						<label for="nickname">닉네임</label>
					</div>
					<div class="col s2">
						<button type="button" id="change_nn" onClick="btnChangeState(this)" class="btn-small z-depth-0 yellow darken-3">변경</button>
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
						<a href="/MyProject/pages/user/delete.user?id=<%= userInfo.getId() %>" class="btn-large z-depth-0 blue-grey lighten-2">탈퇴</a>
					</div>
					
					<div class="col s6 right-align">
						<a onClick="editCheck()" class="btn-large z-depth-0 yellow darken-3">수정하기</a>
					</div>				
				</div>
			</form>

			<div class="col s3"></div>
		</div>
	</div>

	<jsp:include page="/pages/include/footer.jsp" />
</body>
</html>