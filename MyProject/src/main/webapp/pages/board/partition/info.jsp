<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mvc.user.model.UserDTO, mvc.board.model.BoardDTO" %>
<%
	UserDTO userInfo = (UserDTO)session.getAttribute("UserInfo");
	BoardDTO boardInfo = (BoardDTO)session.getAttribute("BoardInfo");
%>
<div class="card b-info">
	<div class="card-image b-info-imgcon">
		<div class="b-info-imgbox">
			<img src="/MyProject/upload/board/<%= boardInfo.getInfoImg() %>">
		</div>
	</div>
	
	<div class="card-content">
		<h6><a href="#" class="black-text"><b><%= boardInfo.getTitle() %></b></a></h6>
		<p><%= boardInfo.getCategory() %></p>
		<br>
		<p>
			<a href="/MyProject/pages/user/info.user?id=<%= userInfo.getId() %>&userBoard=<%= userInfo.getManageBoard() %>" class="black-text">
				<span class="btn-floating btn-small">
					<img src="/MyProject/upload/profile/<%= userInfo.getProfileImg() %>">
				</span>
				<%= boardInfo.getUserId() %>
			</a>
			<br>
		</p>
		<br>
		<p>
			<%= boardInfo.getDescription() %>
		</p>
	</div>

	<div class="card-action">
		<nav class="white z-depth-0 b-search">
			<div class="nav-wrapper">
				<form action="#" method="post">
					<div class="input-field">
						<input id="search" type="search">
						<label class="label-icon" for="search">
							<i class="black-text material-icons">search</i>
						</label>
						<i class="material-icons">close</i>
					</div>
				</form>
			</div>
		</nav>
	</div>
</div>