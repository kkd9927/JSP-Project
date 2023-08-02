<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<style>
	.fixed-action-btn {
		position: relative;
		right: 7px;
 		top: -2px;
 		padding: 0px;
	}
</style>
<body>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
	
	<script type="text/javascript">
		document.addEventListener('DOMContentLoaded', function() {
			var elems = document.querySelectorAll('.fixed-action-btn');
			var instances = M.FloatingActionButton.init(elems, {
				direction: 'bottom',
				hoverEnabled: false
			});
		});
		
		document.addEventListener('DOMContentLoaded', function() {
			var elems = document.querySelectorAll('.tooltipped');
			var instances = M.Tooltip.init(elems, {
				position: 'left'
			});
		});
	</script>

	<nav class="row yellow darken-2">
		<div class="col m4">
			<a href="#"><img src="../../resource/images/logo.png" width="50" height="50" style="margin-top: 7px"></a>
		</div>
		
    	<div class="nav-wrapper col m4">
			<form action="test.jsp" method="post">
		        <div class="input-field">
		        	<input name="search" type="search" required>
		        	<label class="label-icon" for="search"><i class="material-icons">search</i></label>
					<i class="material-icons">close</i>
		        </div>
      		</form>
   		</div>
   		
   		<div class="col m4">
   			<div class="right">
<!--    		로그인 전 -->
<!-- 			<a href="#" class="btn z-depth-0">로그인</a> -->
<!-- 			<a href="#" class="btn z-depth-0">회원가입</a> -->

<!--    		로그인 후 -->
				<div class="fixed-action-btn">
					<a class="btn-floating click-to-toggle btn-large red z-depth-0">
						<img src="../../resource/images/basic_profile_img.jpg" class="circle responsive-img" style="width: 100%; height: 100%">
					</a>
					<ul>
						<li><a href="#" class="btn-floating tooltipped red" data-position="left" data-tooltip="로그아웃"><i class="material-icons">exit_to_app</i></a></li>
						<li><a href="#" class="btn-floating tooltipped yellow darken-1" data-position="left" data-tooltip="게시판 생성"><i class="material-icons">edit</i></a></li>
						<li><a href="#" class="btn-floating tooltipped green" data-position="left" data-tooltip="게시판 목록"><i class="material-icons">view_list</i></a></li>
						<li><a href="#" class="btn-floating tooltipped blue" data-position="left" data-tooltip="내 정보"><i class="material-icons">person</i></a></li>
					</ul>
				</div>
   			</div>
		</div>
	</nav>
</body>
</html>