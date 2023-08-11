<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, mvc.board.model.BoardDAO" %>
<%
	ArrayList<String> category = BoardDAO.getCategory();
%>
<div class="center-align">
	<a href="/MyProject/pages/main/main.board?category=전체&page=1&type=list" class="btn z-depth-0 yellow darken-3">전체</a>
	<%
		for(int i=0; i<category.size(); i++) {
	%>
	<a href="/MyProject/pages/main/main.board?category=<%= category.get(i) %>&page=1&type=list" class="btn z-depth-0 yellow darken-3"><%= category.get(i) %></a>
	<%
		}
	%>
</div>