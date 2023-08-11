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
	String keyward = (String)request.getAttribute("Keyward");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색결과</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="/MyProject/pages/main/css/main.css" rel="stylesheet">
</head>
<body>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
	
	<jsp:include page="/pages/include/navbar.jsp"/>
	
	<div class="container">
		<div class="row">
			<div class="col s3"></div>
			
			<div class="col s6">
				<%
					if(boardList != null) {
						for(int i=0; i<boardList.size(); i++) {
				%>
				<div class="card">
					<div class="row">
						<div class="col s4">
							<div class="card-image">
								<img src="/MyProject/upload/board/<%= boardList.get(i).getInfoImg() %>" width="150" height="150">
							</div>
						</div>
						
						<div class="col s8">
							<div class="card-content">
								<h6><a href="/MyProject/pages/board/<%= boardList.get(i).getBoardId() %>.board?userBoard=<%= boardList.get(i).getBoardId() %>" class="black-text"><b><%= boardList.get(i).getTitle() %></b></a></h6>
								<p><%= boardList.get(i).getCategory() %></p>
								
								<div class="right-align">
									<a href="/MyProject/pages/board/<%= boardList.get(i).getBoardId() %>.board?userBoard=<%= boardList.get(i).getBoardId() %>" class="btn-small z-depth-0 yellow darken-3">바로가기</a>
								</div>
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
						<li><a href="/MyProject/pages/main/search.board?keyward=<%= keyward %>&page=<%= pageNum-1 %>&type=search"><i class="material-icons">chevron_left</i></a></li>
						<%
							}
						%>
						<%
							for(int i=1; i<=totalPage; i++) {
								if(pageNum == i) {
						%>
						<li class="active yellow darken-3"><a href="/MyProject/pages/main/search.board?keyward=<%= keyward %>&page=<%= i %>&type=search"><%= i %></a></li>
						<%
								} else {
						%>
						<li><a href="/MyProject/pages/main/search.board?keyward=<%= keyward %>&page=<%= i %>&type=search"><%= i %></a></li>
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
						<li><a href="/MyProject/pages/main/search.board?keyward=<%= keyward %>&page=<%= pageNum+1 %>&type=search"><i class="material-icons">chevron_right</i></a></li>
						<%
							}
						%>
				 	</ul>
				</div>
				<%
					} else {
				%>
				<div class="valign-wrapper center-align" style="height: 600px">
					<h4>"<%= keyward %>"에 대한 검색결과가 존재하지 않습니다.</h4>
				</div>
				<%	
					}
				%>
			</div>
			
			<div class="col s3"></div>
		</div>
	</div>
	
	<jsp:include page="/pages/include/footer.jsp"/>
</body>
</html>