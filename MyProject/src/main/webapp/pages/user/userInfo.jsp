<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="mvc.user.model.UserDTO, mvc.board.model.BoardDTO" %>
<%
	UserDTO userInfo = (UserDTO)session.getAttribute("UserInfo");
	BoardDTO boardInfo = (BoardDTO)session.getAttribute("BoardInfo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
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
				<h1>회원정보</h1>
			</div>
		</div>
		
		<div class="row">
			<div class="col s12 center-align">
				<img src="/MyProject/upload/profile/<%= userInfo.getProfileImg() %>" width="150" height="150" class="circle">
			</div>
			
			<div class="col s12 center-align">
				<h5><%= userInfo.getNickname() %></h5>
			</div>
			<br>
			<div class="col s12 center-align">
				<a href="/MyProject/pages/user/editInfo.user" class="btn z-depth-0 yellow darken-3">정보수정</a>
				<hr>
			</div>
		</div>
		
		<div class="row">
			<div class="col s6">
				<h6>내 게시판</h6>
				<%
					if(userInfo.getManageBoard() != null) {
				%>
				<div class="card">
					<div class="row">
						<div class="col s4">
							<div class="card-image">
								<img src="/MyProject/upload/board/<%= boardInfo.getInfoImg() %>" width="150" height="150">
							</div>
						</div>
						
						<div class="col s8">
							<div class="card-content">
								<h6><a href="/MyProject/pages/board/<%= userInfo.getManageBoard() %>.board?userBoard=<%= userInfo.getManageBoard() %>" class="black-text"><b><%= boardInfo.getTitle() %></b></a></h6>
								<p><%= boardInfo.getCategory() %></p>
								
								<div class="right-align">
									<a href="/MyProject/pages/board/update.board" class="btn-small z-depth-0 blue-grey lighten-2">수정</a>
									<a href="/MyProject/pages/board/<%= userInfo.getManageBoard() %>.board?userBoard=<%= userInfo.getManageBoard() %>" class="btn-small z-depth-0 yellow darken-3">바로가기</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<%
					} else {
				%>
				<div class="row">
					<div class="col s4">
						<img src="/MyProject/resource/images/sample.jpg" width="75" height="75" style="visibility: hidden;">
					</div>
					
					<div class="col s8">
						<span class="black-text">
							운영중인 게시판이 없어요<br>
						</span><br>
						<a href="/MyProject/pages/board/create.board" class="btn-small z-depth-0 yellow darken-3">만들기</a>
					</div>
				</div>
				<%
					}
				%>
				
				<br>
				<hr>
				<br>
				
				<h6>좋아요 한 글</h6>
				<table class="highlight">
					<thead>
						<tr>
							<th>제목</th>
						</tr>
					</thead>

					<tbody>
						<%
							for(int i=0; i<3; i++) {
						%>
						<tr>
							<td><a href="#" class="black-text">제목</a></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
			
			<div class="col s6">
				<h6>내가 쓴 글</h6>
				<%
				for (int i = 0; i < 3; i++) {
				%>
				<div class="card">
					<div class="row">
						<div class="col s12">
							<div class="card-content">
								<a href="#" class="black-text">
									<h6><b>글 제목</b></h6>
									<p>글 내용</p>
								</a>
							</div>
						</div>
					</div>
				</div>
				<%
					}
				%>
			</div>
		</div>
	</div>

	<jsp:include page="/pages/include/footer.jsp" />
</body>
</html>