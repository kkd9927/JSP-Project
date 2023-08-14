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
									<img src="/MyProject/upload/profile/<%= writerInfo.getProfileImg() %>">
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
						<div class="right-align">
				<!-- 추천 안했을 경우 -->
							<a href="#" class="black-text"><i class="samll material-icons">favorite_border</i></a>
				<!-- 추천 했을 경우 -->							
				<!-- 			<a href="#" class="black-text"><i class="samll material-icons">favorite</i></a> -->
						</div>
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