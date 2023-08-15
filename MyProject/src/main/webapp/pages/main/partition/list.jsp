<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, mvc.board.model.BoardDTO" %>
<%
	ArrayList<BoardDTO> boardList = null;
	
	if(request.getAttribute("BoardList") != null) {
		boardList = (ArrayList<BoardDTO>)request.getAttribute("BoardList");
	}
	
	int totalPage = (Integer)request.getAttribute("TotalPage");
	int pageNum = (Integer)request.getAttribute("PageNum");
	String category = (String)request.getAttribute("Category");
%>
<div class="row">
	<%
		if(boardList != null) {
			for(int i=0; i<boardList.size(); i++) {
	%>
	<div class="col s3">
		<div class="card">
		    <div class="card-image">
		    	<img class="activator" src="/MyProject/upload/board/<%= boardList.get(i).getInfoImg() %>" onerror="this.src='/MyProject/resource/images/no-photo.png'" height="200">
		    </div>
		    <div class="card-content">
		    	<span class="card-title activator grey-text text-darken-4"><%= boardList.get(i).getTitle() %><i class="material-icons right">add</i></span>
		    	<p><a href="/MyProject/pages/board/<%= boardList.get(i).getBoardId() %>.board?userBoard=<%= boardList.get(i).getBoardId() %>">바로가기</a></p>
		    </div>
		    <div class="card-reveal">
		    	<span class="card-title grey-text text-darken-4"><%= boardList.get(i).getTitle() %><i class="material-icons right">close</i></span>
		    	<p><%= boardList.get(i).getCategory() %></p>
		    	<p><%= boardList.get(i).getDescription() %></p>
		    </div>
    	</div>
	</div>
	<%
			}
	%>
</div>

<div class="row">
	<ul class="pagination center-align">
		<%
			if(pageNum == 1) {
		%>
		<li class="disabled"><a href="#"><i class="material-icons">chevron_left</i></a></li>
		<%
			} else {
		%>
		<li><a href="/MyProject/pages/main/main.board?category=<%= category %>&page=<%= pageNum-1 %>&type=list"><i class="material-icons">chevron_left</i></a></li>
		<%
			}
		%>
		<%
			for(int i=1; i<=totalPage; i++) {
				if(pageNum == i) {
		%>
		<li class="active yellow darken-3"><a href="/MyProject/pages/main/main.board?category=<%= category %>&page=<%= i %>"><%= i %></a></li>
		<%
				} else {
		%>
		<li><a href="/MyProject/pages/main/main.board?category=<%= category %>&page=<%= i %>&type=list"><%= i %></a></li>
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
		<li><a href="/MyProject/pages/main/main.board?category=<%= category %>&page=<%= pageNum+1 %>&type=list"><i class="material-icons">chevron_right</i></a></li>
		<%
			}
		%>
 	</ul>
 	<%
		} else {
 	%>
 	<div class="valign-wrapper center-align" style="height: 500px">
		<h4>"<%= category %>"에 대한 검색결과가 존재하지 않습니다.</h4>
	</div>
	<%
		}
	%>
</div>