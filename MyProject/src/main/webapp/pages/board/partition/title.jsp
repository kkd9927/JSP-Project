<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mvc.user.model.UserDTO, mvc.board.model.BoardDTO" %>
<%
	UserDTO loginInfo = null;

	if(session.getAttribute("UserInfo") != null) {
		loginInfo = (UserDTO)session.getAttribute("UserInfo");
	}
	
	UserDTO userInfo = (UserDTO)request.getAttribute("UserInfo");
	BoardDTO boardInfo = (BoardDTO)request.getAttribute("BoardInfo");
%>
<div class="card b-title z-depth-0">
	<div class="card-image">
		<img src="/MyProject/upload/board/<%= boardInfo.getTitleImg() %>" height="300">
		<span class="card-title"><a href="/MyProject/pages/board/<%= boardInfo.getBoardId() %>.board?userBoard=<%= boardInfo.getBoardId() %>" class="white-text"><b><%= boardInfo.getTitle() %></b></a></span>
	</div>
	
	<%
		if(loginInfo != null) {
			if(loginInfo.getManageBoard().equals(boardInfo.getBoardId())) {
	%>
	<div class="fixed-action-btn title-action-btn">
		<a class="btn-floating btn-large white">
			<i class="large black-text material-icons">add</i>
		</a>
		
		<ul>
			<li><a href="/MyProject/pages/board/update.board" class="btn-floating tooltipped title-tooltip white" data-position="bottom" data-tooltip="수정"><i class="black-text material-icons">build</i></a></li>
			<li><a href="#" class="btn-floating tooltipped title-tooltip white" data-position="bottom" data-tooltip="글 목록"><i class="black-text material-icons">list</i></a></li>
			<li><a href="/MyProject/pages/board/write.content?domain=<%= boardInfo.getBoardId() %>&userid=<%= loginInfo.getId() %>" class="btn-floating tooltipped title-tooltip white" data-position="bottom" data-tooltip="글 쓰기"><i class="black-text material-icons">create</i></a></li>
		</ul>
	</div>
	<%
			}
		}
	%>
</div>