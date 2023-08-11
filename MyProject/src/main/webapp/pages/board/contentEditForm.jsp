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

	<jsp:include page="/pages/include/navbar.jsp" />

	<div class="container">
		<div class="row">
			<div class="col s12 center-align">
				<h1>글 수정</h1>
			</div>
		</div>
		
		<div class="row">
			<div class="col s3"></div>

			<form class="col s6">
				<div class="row">
					<div class="input-field col s12">
						<input id="input_text" type="text">
						<label for="input_text">제목</label>
					</div>
				</div>

				<div class="row">
					<div class="col s12">
						<div class="carousel carousel-slider">
							<a href="/MyProject/resource/images/sample.jpg" target="_blank" class="carousel-item">
								<img src="/MyProject/resource/images/sample.jpg">
							</a>
							<a href="/MyProject/resource/images/sample.jpg" target="_blank" class="carousel-item">
								<img src="/MyProject/resource/images/sample.jpg">
							</a>
							<a href="/MyProject/resource/images/sample.jpg" target="_blank" class="carousel-item">
								<img src="/MyProject/resource/images/sample.jpg">
							</a>
						</div>
					</div>
				
					<div class="input-field col s12">
						<textarea id="textarea2" style="height: 300px;" class="materialize-textarea"></textarea>
						<label for="textarea2">내용</label>
					</div>
				</div>
				
				<div class="row">
					<div class="file-field input-field col s6">
						<div class="btn z-depth-0 yellow darken-3">
							<span>File</span>
							<input type="file">
						</div>
						<div class="file-path-wrapper">
							<input type="text" placeholder="이미지 삽입(1개당 5MB 이하)" class="file-path validate">
						</div>
					</div>
					
					<div class="col s6">
						<b>삽입된 이미지</b>
						<p>sample.jpg<a href="#" class="red-text text-darken-3"><i class="tiny material-icons">close</i></a></p>
						<p>sample.jpg<a href="#" class="red-text text-darken-3"><i class="tiny material-icons">close</i></a></p>
						<p>sample.jpg<a href="#" class="red-text text-darken-3"><i class="tiny material-icons">close</i></a></p>
					</div>
				</div>
				
				<div class="row">
					<div class="col s6 left-align">
						<a href="#" class="btn-large z-depth-0 blue-grey lighten-2">취소</a>
					</div>
					
					<div class="col s6 right-align">
						<input type="submit" value="수정하기" class="btn-large z-depth-0 yellow darken-3">
					</div>				
				</div>
			</form>

			<div class="col s3"></div>
		</div>
	</div>

	<jsp:include page="/pages/include/footer.jsp" />
</body>
</html>