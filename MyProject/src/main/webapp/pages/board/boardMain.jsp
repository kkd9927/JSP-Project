<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	<jsp:include page="/pages/include/navbar.jsp"/>

	<div class="container">
		<jsp:include page="/pages/board/partition/title.jsp"/>
		
		<div class="row">
			<div class="col m3">
				<jsp:include page="/pages/board/partition/info.jsp"/>
			</div>
			
			<div class="col m7">
				<jsp:include page="/pages/board/partition/content.jsp"/>
<%-- 				<jsp:include page="/pages/board/partition/pagination.jsp"/>				 --%>
			</div>
			
			<div class="col m2">
			
			</div>
		</div>
	</div>

	<jsp:include page="/pages/include/footer.jsp"/>
</body>
</html>