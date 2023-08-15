<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="mvc.user.model.UserDTO, mvc.board.model.BoardDTO, mvc.content.model.ContentDTO, java.util.ArrayList" %>
<%
	UserDTO userInfo = (UserDTO)session.getAttribute("UserInfo");
	BoardDTO boardInfo = (BoardDTO)request.getAttribute("BoardInfo");
	
	ArrayList<ContentDTO> contentList = null;
	
	if(request.getAttribute("ContentList") != null) {
		contentList = (ArrayList<ContentDTO>)request.getAttribute("ContentList");
	}
	
	int totalPage = 1;
	if(request.getAttribute("TotalPage") != null) {
		totalPage = (Integer)request.getAttribute("TotalPage");
	}
	
	int pageNum = 1;
	if(request.getAttribute("PageNum") != null) {
		pageNum = (Integer)request.getAttribute("PageNum");
	}
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
				<img src="/MyProject/upload/profile/<%= userInfo.getProfileImg() %>" onerror="this.src='/MyProject/resource/images/basic_profile_img.jpg'" width="150" height="150" class="circle">
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
								<img src="/MyProject/upload/board/<%= boardInfo.getInfoImg() %>" onerror="this.src='/MyProject/resource/images/no-photo.png'" width="150" height="150">
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
						<img src="/MyProject/resource/images/no-photo.png" width="75" height="75" style="visibility: hidden;">
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
				
<!-- 				<br> -->
<!-- 				<hr> -->
<!-- 				<br> -->
				
<!-- 				<h6>좋아요 한 글</h6> -->
<!-- 				<table class="highlight"> -->
<!-- 					<thead> -->
<!-- 						<tr> -->
<!-- 							<th>제목</th> -->
<!-- 						</tr> -->
<!-- 					</thead> -->

<!-- 					<tbody> -->
<!-- 						<tr> -->
<!-- 							<td><a href="#" class="black-text">제목</a></td> -->
<!-- 						</tr> -->
<!-- 					</tbody> -->
<!-- 				</table> -->
			</div>
			
			<div class="col s6">
				<h6>내가 쓴 글</h6>
				<%
					if(contentList != null) {
						for (int i=0; i<contentList.size(); i++) {
				%>
				<div class="card">
					<div class="row">
						<div class="col s4">
							<div class="card-image">
								<%
									if(contentList.get(i).getFiles() != null) {
										String files[] = contentList.get(i).getFiles().split("/");
								%>
								<img src="/MyProject/upload/content/<%= files[0] %>" width="150" height="150">
								<%
									} else {
								%>
								<img src="/MyProject/resource/images/no-photo.png" width="150" height="150">
								<%
									}
								%>
							</div>
						</div>
						
						<div class="col s8">
							<div class="card-content">
								<a href="/MyProject/pages/board/readContent.content?contentId=<%= contentList.get(i).getContentId() %>" class="black-text">
									<h6><b><%= contentList.get(i).getTitle() %></b></h6>
									<p><%= contentList.get(i).getContent() %></p>
								</a>
							</div>
						</div>
					</div>
				</div>
				<%
						}
				%>
				<div class="row">
					<ul class="pagination center-align">
						<%
							if(pageNum == 1) {
						%>
						<li class="disabled"><a href="#"><i class="material-icons">chevron_left</i></a></li>
						<%
							} else {
						%>
						<li><a href="/MyProject/pages/user/info.user?id=<%= userInfo.getId() %>&userBoard=<%= userInfo.getManageBoard() %>&page=<%= pageNum-1 %>"><i class="material-icons">chevron_left</i></a></li>
						<%
							}
						%>
						<%
							for(int i=1; i<=totalPage; i++) {
								if(pageNum == i) {
						%>
						<li class="active yellow darken-3"><a href="/MyProject/pages/user/info.user?id=<%= userInfo.getId() %>&userBoard=<%= userInfo.getManageBoard() %>&page=<%= i %>"><%= i %></a></li>
						<%
								} else {
						%>
						<li><a href="/MyProject/pages/user/info.user?id=<%= userInfo.getId() %>&userBoard=<%= userInfo.getManageBoard() %>&page=<%= i %>"><%= i %></a></li>
						<%
								}
							}
						%>
					    <%
							if(pageNum == totalPage) {
						%>
						<li class="disabled"><a href="#"><i class="material-icons">chevron_right</i></a></li>
						<%
							} else {
						%>
						<li><a href="/MyProject/pages/user/info.user?id=<%= userInfo.getId() %>&userBoard=<%= userInfo.getManageBoard() %>&page=<%= pageNum+1 %>"><i class="material-icons">chevron_right</i></a></li>
						<%
								}
							}
						%>
				 	</ul>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/pages/include/footer.jsp" />
</body>
</html>