<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<style>
	.card-title {
		margin-left: 25%;
	}
	
	.title-action-btn {
		position: absolute;
		right: 1%;
 		bottom: 4%;
 		padding: 0px;
	}
	
	.b-info {
		position: relative;
		top: -115px;
		padding: 5px;
	}
	
	.b-info-imgcon {
		position: relative;
		width: 100%;
		height: 0;
		padding-bottom: 100%;
	}

	.b-info-imgbox {
		position: absolute;
		width: 100%;
		height: 100%;
		top: 0;
		left: 0;
	}
	
	.b-info-imgbox img {
		width: 100%;
		height: 100%;
	}
	
	.card .card-action {
		padding: 0;
	}
	
	.card .card-content .card-title {
		margin-left: 0;
	}
	
	.card .row {
		margin-bottom: 0;
	}
	
	.btn-floating img {
		width: 100%;
		height: 100%;
	}
	
	.carousel {
		margin-bottom: 24px;
	}
	
	.b-container .b-content {
		padding-top: 0;
		padding-bottom: 0;
	}
	
	.b-container .b-bottom {
		padding: 10px 24px 10px 24px;
	}
	
	.b-container .b-comment {
		padding: 24px;
	}
	
	.b-container .b-comment h6, p {
		margin: 0;
	}
	
	.b-container .b-comment .b-comment-line {
		padding-top: 5px;
		padding-bottom: 5px;
	}
</style>
<body>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
	
	<script type="text/javascript">
		document.addEventListener('DOMContentLoaded', function() {
			var elems = document.querySelectorAll('.title-action-btn');
			var instances = M.FloatingActionButton.init(elems, {
				direction : 'left'
			});
		});
		
		document.addEventListener('DOMContentLoaded', function() {
			var elems = document.querySelectorAll('.title-tooltip');
			var instances = M.Tooltip.init(elems, {
				position: 'bottom'
			});
		});
		
		document.addEventListener('DOMContentLoaded', function() {
		    var elems = document.querySelectorAll('.carousel');
		    var instances = M.Carousel.init(elems, {
		        fullWidth: true,
		        indicators: true
		    });
		});
	</script>
	
	<jsp:include page="../include/navbar.jsp"/>

	<div class="container">
		<div class="card b-title z-depth-0">
			<div class="card-image">
				<img src="../../resource/images/sample.jpg" height="300">
				<span class="card-title"><b>게시판 이름</b></span>
			</div>
			
			<div class="fixed-action-btn title-action-btn">
				<a class="btn-floating btn-large white">
					<i class="large black-text material-icons">add</i>
				</a>
				<ul>
					<li><a href="#" class="btn-floating tooltipped title-tooltip white" data-position="bottom" data-tooltip="관리"><i class="black-text material-icons">build</i></a></li>
					<li><a href="#" class="btn-floating tooltipped title-tooltip white" data-position="bottom" data-tooltip="캘린더"><i class="black-text material-icons">today</i></a></li>
					<li><a href="#" class="btn-floating tooltipped title-tooltip white" data-position="bottom" data-tooltip="글 목록"><i class="black-text material-icons">view_list</i></a></li>
					<li><a href="#" class="btn-floating tooltipped title-tooltip white" data-position="bottom" data-tooltip="글쓰기"><i class="black-text material-icons">create</i></a></li>
					<li><a href="#" class="btn-floating tooltipped title-tooltip white" data-position="bottom" data-tooltip="가입하기"><i class="black-text material-icons">person_add</i></a></li>
				</ul>
			</div>
		</div>
		
		<div class="row">
			<div class="col m3">
				<div class="card b-info">
					<div class="card-image b-info-imgcon">
						<div class="b-info-imgbox">
							<img src="../../resource/images/sample.jpg">
						</div>
					</div>
					
					<div class="card-content">
						<h6><a href="#" class="black-text"><b>게시판 이름</b></a></h6>
						<p>
							카테고리<br><br>
							<a href="#" class="black-text">
								<span class="btn-floating btn-small">
									<img src="../../resource/images/basic_profile_img.jpg">
								</span>
								@관리자_닉네임
							</a>
							<br>
							관리자_이메일
						</p>
					</div>

					<div class="card-action">
						<nav class="white z-depth-0 b-search">
							<div class="nav-wrapper">
								<form action="#" method="post">
									<div class="input-field">
										<input id="search" type="search">
										<label class="label-icon" for="search">
											<i class="black-text material-icons">search</i>
										</label>
										<i class="material-icons">close</i>
									</div>
								</form>
							</div>
						</nav>
					</div>
				</div>
			</div>
			
			<div class="col m7">
				<div class="card b-container">
					<div class="card-content b-title">
						<span class="card-title b-subject"><b>글 제목</b></span>
						<p class="right-align b-writer">
							<a href="#" class="black-text">
								@작성자_닉네임
								<span class="btn-floating btn-small">
									<img src="../../resource/images/basic_profile_img.jpg">
								</span>
							</a>
						</p>
					</div>
					
					<div class="card-content b-content">
<!-- 사진 있을경우 -->
						<div class="carousel carousel-slider">
							<a href="../../resource/images/sample.jpg" target="_blank" class="carousel-item"><img src="../../resource/images/sample.jpg"></a>
							<a href="../../resource/images/sample.jpg" target="_blank" class="carousel-item"><img src="../../resource/images/sample.jpg"></a>
							<a href="../../resource/images/sample.jpg" target="_blank" class="carousel-item"><img src="../../resource/images/sample.jpg"></a>
						</div>
						
						<p>글 내용</p>
					</div>
					
					<div class="card-content">
						<div class="right-align">
<!-- 추천 안했을 경우 -->
							<a href="#" class="black-text"><i class="samll material-icons">favorite_border</i></a>
<!-- 추천 했을 경우 -->							
<!-- 							<a href="#" class="black-text"><i class="samll material-icons">favorite</i></a> -->
						</div>
					</div>
					
					<div class="card-action b-comment">
						<div class="b-comment-line">
							<h6><a href="#" class="black-text"><b>comment(1)</b></a></h6>
						</div>
						
						<div class="b-comment-line">
							<p>
								<a href="#" class="black-text">
									<span class="btn-floating btn-small">
										<img src="../../resource/images/basic_profile_img.jpg">
									</span>
									@작성자_닉네임
								</a>
								댓글 내용
							</p>
						</div>
						
						<div class="right-align b-comment-line">
							<a href="#" class="black-text"><i class="material-icons">add</i></a>
						</div>
					</div>
				</div>
				
				<ul class="pagination center-align">
				    <li class="disabled"><a href="#"><i class="material-icons">chevron_left</i></a></li>
				    <li class="active yellow darken-3"><a href="#">1</a></li>
				    <li><a href="#">2</a></li>
				    <li><a href="#">3</a></li>
				    <li><a href="#">4</a></li>
				    <li><a href="#">5</a></li>
				    <li><a href="#"><i class="material-icons">chevron_right</i></a></li>
			 	</ul>
			</div>
			
			<div class="col m2">
			
			</div>
		</div>
	</div>

	<jsp:include page="../include/footer.jsp"/>
</body>
</html>