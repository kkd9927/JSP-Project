<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mvc.user.model.UserDTO" %>
<%
	UserDTO userInfo = (UserDTO)session.getAttribute("UserInfo");
	
	if(userInfo != null) {
		String userBoard = userInfo.getManageBoard();
		
		if(userBoard != null) {
%>
<div class="row">
	<div class="col s4">
		<img src="/MyProject/resource/images/sample.jpg" width="75" height="75">
	</div>
	
	<div class="col s8">
		<span class="black-text">
			<b>게시판 이름</b><br>
			카테고리
		</span><br>
		<a href="#" class="btn-small z-depth-0 yellow darken-3">바로가기</a>
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
		<a href="#" class="btn-small z-depth-0 yellow darken-3">만들기</a>
	</div>
</div>
<%
		}
	} else {
%>
	<div class="row">
	<div class="col s4">
		<img src="/MyProject/resource/images/sample.jpg" width="75" height="75" style="visibility: hidden;">
	</div>
	
	<div class="col s8">
		<span class="black-text">
			로그인 하기<br>
		</span><br>
		<a href="/MyProject/pages/user/login.user" class="btn-small z-depth-0 yellow darken-3">로그인</a>
	</div>
</div>
<%
	}
%>