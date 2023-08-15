<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String domain = request.getParameter("domain");
	String userid = request.getParameter("userid");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link href="/MyProject/pages/board/css/board.css" rel="stylesheet">
</head>
<body>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
	<script src="/MyProject/pages/board/js/board.js"></script>
	
<!-- 	<script type="text/javascript"> -->
<!-- 		function checkWrite() { -->
<!-- 			document.writeForm.submit; -->
<!-- 		} -->
<!-- 	</script> -->
	
	<jsp:include page="/pages/include/navbar.jsp" />

	<div class="container">
		<div class="row">
			<div class="col s12 center-align">
				<h1>글 쓰기</h1>
			</div>
		</div>
		
		<div class="row">
			<div class="col s3"></div>

			<form action="/MyProject/pages/board/writeSend.content" method="post" name="writeForm" enctype="multipart/form-data" class="col s6">
				<input type="hidden" name="domain" value="<%= domain %>">
				<input type="hidden" name="userid" value="<%= userid %>">
				
				<div class="row">
					<div class="input-field col s12">
						<input id="title" name="title" type="text">
						<label for="title">제목</label>
					</div>
				</div>

				<div class="row">
					<div class="input-field col s12">
						<textarea id="content" name="content" style="height: 300px;" class="materialize-textarea"></textarea>
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
				</div>
				
				<div class="row">
					<div class="col s6 left-align">
						<a href="/MyProject/pages/board/<%= domain %>.board" class="btn-large z-depth-0 blue-grey lighten-2">취소</a>
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