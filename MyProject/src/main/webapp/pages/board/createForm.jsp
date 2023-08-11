<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="mvc.user.model.UserDTO, java.util.ArrayList" %>
<%
	UserDTO userInfo = (UserDTO)session.getAttribute("UserInfo");
	ArrayList<String> category = (ArrayList<String>)request.getAttribute("category");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="/MyProject/pages/board/css/board.css" rel="stylesheet">
</head>
<body>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
	<script src="/MyProject/pages/board/js/board.js"></script>
	
	<jsp:include page="/pages/include/navbar.jsp" />

	<div class="container">
		<div class="row">
			<div class="col s12 center-align">
				<h1>게시판 생성</h1>
			</div>
		</div>
		
		<div class="row">
			<div class="col s3"></div>

			<form action="/MyProject/pages/board/createSend.board" method="post" name="createForm" enctype="multipart/form-data" class="col s6">
				<input type="hidden" name="id" value="<%= userInfo.getId() %>">
				
				<div class="row">
					<div class="input-field col s8">
						<input id="domain" name="domain" type="text">
						<label for="domain">게시판 주소</label>
						<span class="helper-text" data-error="wrong" data-success="right">영문 소문자 및 숫자 조합 20자 이하</span>
					</div>
					
					<div class="input-field col s4">
						<select id="category" name="category" class="browser-default">
							<option value="" disabled selected>카테고리</option>
							<%
								for(int i=0; i<category.size(); i++) {
							%>
							<option value="<%= category.get(i) %>"><%= category.get(i) %></option>
							<%
								}
							%>
						</select>
					</div>
				</div>

				<div class="row">
					<div class="input-field col s12">
						<input id="title" name="title" type="text">
						<label for="title">게시판 이름</label>
						<span class="helper-text" id="titleLength" data-error="wrong" data-success="right">한글 1글자당 2byte, 영문, 숫자 1글자당 1byte / 50byte</span>
					</div>
				</div>

				<div class="row">
					<div class="input-field col s12">
						<textarea id="description" name="description" class="materialize-textarea"></textarea>
						<label for="description">게시판 소개</label>
						<span class="helper-text" data-error="wrong" data-success="right">100자 이하</span>
					</div>
				</div>
				
				<div class="row">
					<div class="file-field input-field col s6">
						<div class="btn z-depth-0 yellow darken-3">
							<span>File</span>
							<input type="file" name="titleImg">
						</div>
						<div class="file-path-wrapper">
							<input type="text" placeholder="타이틀 이미지(5MB 이하)" class="file-path validate">
						</div>
					</div>
					
					<div class="file-field input-field col s6">
						<div class="btn z-depth-0 yellow darken-3">
							<span>File</span>
							<input type="file" name="infoImg">
						</div>
						<div class="file-path-wrapper">
							<input type="text" placeholder="소개 이미지(5MB 이하)" class="file-path validate">
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col s6 left-align">
						<a href="/MyProject/pages/main/main.jsp" class="btn-large z-depth-0 blue-grey lighten-2">취소</a>
					</div>
					
					<div class="col s6 right-align">
						<a onClick="createCheck()" class="btn-large z-depth-0 yellow darken-3">생성하기</a>
					</div>				
				</div>
			</form>

			<div class="col s3"></div>
		</div>
	</div>

	<jsp:include page="/pages/include/footer.jsp" />
	
	<script src="/MyProject/pages/board/js/form.js"></script>
</body>
</html>