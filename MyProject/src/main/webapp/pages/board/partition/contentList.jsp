<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="mvc.user.model.UserDTO, mvc.board.model.BoardDTO, mvc.content.model.ContentDTO, java.util.ArrayList" %>
<%
	ArrayList<ContentDTO> contentList = null;
	
	if(request.getAttribute("ContentList") != null) {
		contentList = (ArrayList<ContentDTO>)request.getAttribute("ContentList");
	}
	
	UserDTO userInfo = (UserDTO)request.getAttribute("UserInfo");
	BoardDTO boardInfo = (BoardDTO)request.getAttribute("BoardInfo");

	int totalPage = 1;
	if(request.getAttribute("TotalPage") != null) {
		totalPage = (Integer)request.getAttribute("TotalPage");
	}
	
	int pageNum = 1;
	if(request.getAttribute("PageNum") != null) {
		pageNum = (Integer)request.getAttribute("PageNum");
	}

	if(contentList != null) {
		for(int i=0; i<contentList.size(); i++) {
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
		<li><a href="/MyProject/pages/board/<%= boardInfo.getBoardId() %>.board?userBoard=<%= boardInfo.getBoardId() %>&page=<%= pageNum-1 %>"><i class="material-icons">chevron_left</i></a></li>
		<%
			}
		%>
		<%
			for(int i=1; i<=totalPage; i++) {
				if(pageNum == i) {
		%>
		<li class="active yellow darken-3"><a href="/MyProject/pages/board/<%= boardInfo.getBoardId() %>.board?userBoard=<%= boardInfo.getBoardId() %>&page=<%= i %>"><%= i %></a></li>
		<%
				} else {
		%>
		<li><a href="/MyProject/pages/board/<%= boardInfo.getBoardId() %>.board?userBoard=<%= boardInfo.getBoardId() %>&page=<%= i %>"><%= i %></a></li>
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
		<li><a href="/MyProject/pages/board/<%= boardInfo.getBoardId() %>.board?userBoard=<%= boardInfo.getBoardId() %>&page=<%= pageNum+1 %>"><i class="material-icons">chevron_right</i></a></li>
		<%
				}
			}
		%>
 	</ul>
</div>
