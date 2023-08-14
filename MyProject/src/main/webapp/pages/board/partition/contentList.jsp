<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="mvc.user.model.UserDTO, mvc.board.model.BoardDTO, mvc.content.model.ContentDTO, java.util.ArrayList" %>
<%
	ArrayList<ContentDTO> contentList = null;
	
	if(request.getAttribute("ContentList") != null) {
		contentList = (ArrayList<ContentDTO>)request.getAttribute("ContentList");
	}
%>    
<%
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
	}
%>
