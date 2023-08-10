<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="mvc.board.model.BoardDTO, java.util.ArrayList" %>
<%
	BoardDTO boardInfo = (BoardDTO)session.getAttribute("BoardInfo");
	ArrayList<String> category = (ArrayList<String>)request.getAttribute("category");
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
		function updateCheck() {
			document.updateForm.submit();
		}
		
		var state = 0;
		
		function btnChangeState(elem) {
			var input = elem.parentElement.previousElementSibling.firstElementChild;
			
			if(state == 0) {
				state = 1;
				input.removeAttribute("readonly");
				elem.innerHTML = "확인";
			} else if(state == 1) {
				state = 0;
				input.setAttribute("readonly", true);
				elem.innerHTML = "변경";
			}
		}
	</script>

	<jsp:include page="/pages/include/navbar.jsp" />

	<div class="container">
		<div class="row">
			<div class="col s12 center-align">
				<h1>게시판 수정</h1>
			</div>
		</div>
		
		<div class="row">
			<div class="col s3"></div>

			<form action="/MyProject/pages/board/updateSend.board" method="post" name="updateForm" enctype="multipart/form-data" class="col s6">
				<input type="hidden" name="id" value="<%= boardInfo.getUserId() %>">
				
				<div class="row">
					<div class="input-field col s8">
						<input id="domain" name="domain" value="<%= boardInfo.getBoardId() %>" type="text" readonly>
						<label for="domain">게시판 주소</label>
					</div>
					
					<div class="input-field col s4">
						<select id="category" name="category" class="browser-default">
							<option value="" disabled>카테고리</option>
							<%
								for(int i=0; i<category.size(); i++) {
									if(category.get(i).equals(boardInfo.getCategory())) {
							%>
							<option value="<%= category.get(i) %>" selected><%= category.get(i) %></option>
							<%
									} else {
							%>
							<option value="<%= category.get(i) %>"><%= category.get(i) %></option>
							<%
									}
								}
							%>
						</select>
					</div>
				</div>

				<div class="row">
					<div class="input-field col s10">
						<input id="title" name="title" value="<%= boardInfo.getTitle() %>" type="text" readonly>
						<label for="title">게시판 이름</label>
					</div>
					<div class="col s2">
						<button type="button" id="change_title" onClick="btnChangeState(this)" class="btn-small z-depth-0 yellow darken-3">변경</button>
					</div>
				</div>

				<div class="row">
					<div class="input-field col s10">
						<textarea id="description" name="description" class="materialize-textarea" readonly><%= boardInfo.getDescription() %></textarea>
						<label for="description">게시판 소개</label>
					</div>
					<div class="col s2">
						<button type="button" id="change_desc" onClick="btnChangeState(this)" class="btn-small z-depth-0 yellow darken-3">변경</button>
					</div>
				</div>
				
				<div class="row">
					<div class="file-field input-field col s6">
						<div class="btn z-depth-0 yellow darken-3">
							<span>File</span>
							<input type="file" name="titleImg">
						</div>
						<div class="file-path-wrapper">
							<input type="text" placeholder="타이틀 이미지(5MB 이하)" class="file-path validate">
						</div>
					</div>
					
					<div class="file-field input-field col s6">
						<div class="btn z-depth-0 yellow darken-3">
							<span>File</span>
							<input type="file" name="infoImg">
						</div>
						<div class="file-path-wrapper">
							<input type="text" placeholder="소개 이미지(5MB 이하)" class="file-path validate">
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col s6 left-align">
						<a href="/MyProject/pages/main/main.jsp" class="btn-large z-depth-0 blue-grey lighten-2">취소</a>
						<a href="/MyProject/pages/board/delete.board?domain=<%= boardInfo.getBoardId() %>" class="btn-large z-depth-0 blue-grey lighten-2">삭제</a>
					</div>
					
					<div class="col s6 right-align">
						<a onClick="updateCheck()" class="btn-large z-depth-0 yellow darken-3">수정하기</a>
					</div>				
				</div>
			</form>

			<div class="col s3"></div>
		</div>
	</div>

	<jsp:include page="/pages/include/footer.jsp" />
</body>
</html>