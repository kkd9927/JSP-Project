<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mvc.user.model.UserDTO, mvc.board.model.BoardDTO, mvc.content.model.ContentDTO" %>
<%
	UserDTO loginInfo = null;

	if(session.getAttribute("UserInfo") != null) {
		loginInfo = (UserDTO)session.getAttribute("UserInfo");
	}
	
	UserDTO writerInfo = (UserDTO)request.getAttribute("WriterInfo");
	ContentDTO contentInfo = (ContentDTO)request.getAttribute("ContentInfo");
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
	
	<jsp:include page="/pages/include/navbar.jsp"/>

	<div class="container">
		<jsp:include page="/pages/board/partition/title.jsp"/>
		
		<div class="row">
			<div class="col m2"></div>
			
			<div class="col m8">
				<div class="card b-container">
					<div class="card-content b-title">
				<!-- 글 작성 당일 자정 이전 -->
						<p><%= contentInfo.getWriteDate() %></p>
				<!-- 글 작성 당일 자정 이후 -->		
				<!-- 		<p>n일 전</p> -->
						<span class="card-title b-subject"><b><%= contentInfo.getTitle() %></b></span>
						<p class="right-align b-writer">
							<a href="#" class="black-text">
								<%= writerInfo.getNickname() %>
								<span class="btn-floating btn-small">
									<img src="/MyProject/upload/profile/<%= writerInfo.getProfileImg() %>" onerror="this.src='/MyProject/resource/images/basic_profile_img.jpg'">
								</span>
							</a>
						</p>
					</div>
					
					<div class="card-content b-content">
						<%
							if(contentInfo.getFiles() != null) {
								String files[] = contentInfo.getFiles().split("/");
						%>
						<div class="carousel carousel-slider">
						<%
								for(int i=0; i<files.length; i++) {
						%>
							<a href="/MyProject/upload/content/<%= files[i] %>" target="_blank" class="carousel-item">
								<img src="/MyProject/upload/content/<%= files[i] %>">
							</a>
						<%
								}
						%>
						</div>
						<%
							}
						%>
						
						<p><%= contentInfo.getContent() %></p>
					</div>
					
					<div class="card-content">
					<%
						if(loginInfo != null) {
							if(writerInfo.getId().equals(loginInfo.getId())) {
					%>
						<div class="right-align">
							<a href="/MyProject/pages/board/edit.content?contentId=<%= contentInfo.getContentId() %>" class="btn-small z-depth-0 yellow darken-3">수정</a>
							<a href="/MyProject/pages/board/delete.content?contentId=<%= contentInfo.getContentId() %>&userBoard=<%= contentInfo.getBoardId() %>" class="btn-small z-depth-0 blue-grey lighten-2">삭제</a>
						</div>
					<%
							}
						}
					%>
					</div>
				</div>
			</div>
			
			<div class="col m2">
			
			</div>
		</div>
	</div>

	<jsp:include page="/pages/include/footer.jsp"/>
</body>
</html>