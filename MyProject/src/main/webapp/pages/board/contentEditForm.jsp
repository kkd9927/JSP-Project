<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="mvc.content.model.ContentDTO" %>
<%
	ContentDTO contentInfo = (ContentDTO)request.getAttribute("ContentInfo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="/MyProject/pages/board/css/board.css" rel="stylesheet">
</head>
<body>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
	<script src="/MyProject/pages/board/js/board.js"></script>
	
	<script type="text/javascript">
		function deleteFile(elem) {
			var span = elem.parentElement;
			var input = elem.parentElement.previousElementSibling
			
			if(confirm("정말 사진을 제거 하시겠습니까?")) {
				span.remove();
				input.remove();
			}
		}
	</script>
	
	<jsp:include page="/pages/include/navbar.jsp" />

	<div class="container">
		<div class="row">
			<div class="col s12 center-align">
				<h1>글 수정</h1>
			</div>
		</div>
		
		<div class="row">
			<div class="col s3"></div>

			<form action="/MyProject/pages/board/editSend.content" method="post" name="editForm" enctype="multipart/form-data" class="col s6">
				<input type="hidden" name="domain" value="<%= contentInfo.getBoardId() %>">
				<input type="hidden" name="contentId" value="<%= contentInfo.getContentId() %>">
				<input type="hidden" name="userid" value="<%= contentInfo.getUserId() %>">
				
				<div class="row">
					<div class="input-field col s12">
						<input id="title" name="title" type="text" value="<%= contentInfo.getTitle() %>">
						<label for="title">제목</label>
					</div>
				</div>

				<div class="row">
					<div class="input-field col s12">
						<textarea id="content" name="content" style="height: 300px;" class="materialize-textarea"><%= contentInfo.getContent() %></textarea>
						<label for="content">내용</label>
					</div>
				</div>
				
				<div class="row">
					<div class="file-field input-field col s6">
						<div class="btn z-depth-0 yellow darken-3">
							<span>File</span>
							<input type="file" name="contentImg" multiple>
						</div>
						<div class="file-path-wrapper">
							<input type="text" placeholder="이미지 삽입(1개당 5MB 이하)" class="file-path validate">
						</div>
					</div>
					<div class="col s6">
						<%
							if(contentInfo.getFiles() != null) {
								String files[] = contentInfo.getFiles().split("/");
						%>
						<input type="hidden" name="filesLength" value="<%= files.length %>">
						<%
								for(int i=0; i<files.length; i++) {
						%>
						<input type="hidden" name="originImg<%= i+1 %>" value="<%= files[i] %>">
						<span><%= files[i] %><a href="#" onClick="deleteFile(this)"><i class="tiny material-icons red-text">close</i></a></span>
						<%
								}
							}
						%>
					</div>
				</div>
				
				<div class="row">
					<div class="col s6 left-align">
						<a href="/MyProject/pages/board/<%= contentInfo.getBoardId() %>.board" class="btn-large z-depth-0 blue-grey lighten-2">취소</a>
					</div>
					
					<div class="col s6 right-align">
<!-- 						<a onclick="checkWrite()" class="btn-large z-depth-0 yellow darken-3">등록하기</a> -->
						<input type="submit" value="등록하기" class="btn-large z-depth-0 yellow darken-3">
					</div>				
				</div>
			</form>

			<div class="col s3"></div>
		</div>
	</div>

	<jsp:include page="/pages/include/footer.jsp" />
</body>
</html>