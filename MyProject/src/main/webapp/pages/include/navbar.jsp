<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mvc.user.model.UserDTO" %>
<%
	UserDTO userInfo = (UserDTO)session.getAttribute("UserInfo");
%>
<link href="/MyProject/pages/include/css/navbar.css" rel="stylesheet">
<script src="/MyProject/pages/include/js/navbar.js"></script>

<nav class="row z-depth-0 yellow darken-2">
	<div class="col m4">
		<a href="/MyProject/pages/main/main.jsp"><img src="/MyProject/resource/images/logo.png" width="50" height="50" style="margin-top: 7px"></a>
	</div>
	
   	<div class="nav-wrapper col m4">
		<form action="#" method="post">
	        <div class="input-field">
	        	<input name="search" type="search" required>
	        	<label class="label-icon" for="search"><i class="material-icons">search</i></label>
				<i class="material-icons">close</i>
	        </div>
     	</form>
  	</div>
  	
	<div class="col m4">
		<div class="right">
			<%
				if(userInfo == null) {
			%>
			<a href="/MyProject/pages/user/login.user" class="btn yellow darken-3 z-depth-0">로그인</a>
			<a href="/MyProject/pages/user/signup.user" class="btn yellow darken-3 z-depth-0">회원가입</a>
			<%
				} else {
			%>
			<div class="fixed-action-btn navbar-action-btn">
				<a class="btn-floating click-to-toggle btn-large red z-depth-0">
					<img src="/MyProject/upload/profile/<%= userInfo.getProfileImg() %>" class="circle responsive-img" style="width: 100%; height: 100%">
				</a>
				<ul>
					<li><a href="/MyProject/pages/user/logout.user" class="btn-floating tooltipped nav-tooltip red" data-position="left" data-tooltip="로그아웃"><i class="material-icons">exit_to_app</i></a></li>
					<li><a href="#" class="btn-floating tooltipped nav-tooltip yellow darken-1" data-position="left" data-tooltip="게시판 생성"><i class="material-icons">edit</i></a></li>
					<li><a href="#" class="btn-floating tooltipped nav-tooltip green" data-position="left" data-tooltip="내 게시판"><i class="material-icons">view_list</i></a></li>
					<li><a href="/MyProject/pages/user/info.user?id=<%= userInfo.getId() %>" class="btn-floating tooltipped nav-tooltip blue" data-position="left" data-tooltip="내 정보"><i class="material-icons">person</i></a></li>
				</ul>
			</div>
			<%
				}
			%>
		</div>
 	</div>
</nav>
