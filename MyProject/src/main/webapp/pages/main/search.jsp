<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<!-- 			검색결과가 있을경우 -->
				<%
// 					for(int i=0; i<5; i++) {
				%>
<!-- 				<div class="card"> -->
<!-- 					<div class="row"> -->
<!-- 						<div class="col s4"> -->
<!-- 							<div class="card-image"> -->
<!-- 								<img src="/MyProject/resource/images/sample.jpg" width="150" height="150"> -->
<!-- 							</div> -->
<!-- 						</div> -->
						
<!-- 						<div class="col s8"> -->
<!-- 							<div class="card-content"> -->
<!-- 								<h6><a href="#" class="black-text"><b>게시판 이름</b></a></h6> -->
<!-- 								<p>카테고리</p> -->
								
<!-- 								<div class="right-align"> -->
<!-- 									<a href="#" class="btn-small z-depth-0 yellow darken-3">바로가기</a> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
				<%
// 					}
				%>
				
<%-- 				<jsp:include page="/pages/main/partition/pagination.jsp" /> --%>

<!-- 			검색결과가 없을경우 -->
				<div class="valign-wrapper center-align" style="height: 600px">
					<h4>"검색어"에 대한 검색결과가 존재하지 않습니다.</h4>
				</div>

			</div>
			
			<div class="col s3"></div>
		</div>
	</div>
	
	<jsp:include page="/pages/include/footer.jsp"/>
</body>
</html>