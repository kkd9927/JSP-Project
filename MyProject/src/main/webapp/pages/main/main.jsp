<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<style>
	.btn {
		margin-bottom: 5px;
	}
</style>
<body>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
	
	<jsp:include page="../include/navbar.jsp"/>
	
	<div class="container">
		<div class="row">
			<div class="col m3">
		      	<h5>운영중인 게시판</h5>
<!-- 			운영중인 게시판이 없을때 -->			
<!-- 	      	<div class="card"> -->
<!-- 			    <div class="card-content"> -->
<!-- 			        <p> -->
<!-- 			        	아직 운영중인 게시판이 없어요...<br> -->
<!-- 		        		나만의 게시판을 만들어보세요! -->
<!-- 			        </p> -->
<!-- 			    </div> -->
<!-- 			    <div class="card-action"> -->
<!-- 					<a class="btn z-depth-0 yellow darken-3">게시판 생성</a> -->
<!-- 			    </div> -->
<!-- 		    </div> -->
			
<!-- 			운영중인 게시판이 있을때 -->
				<div class="card">
				    <div class="card-image">
				        <img src="../../resource/images/sample.jpg">
				        <span class="card-title">Card Title</span>
				    </div>
				    <div class="card-content">
				        <p>
				        	제목: 제목<br>
				        	카테고리: 카테고리1
				        </p>
				    </div>
				    <div class="card-action">
						<a class="btn z-depth-0 yellow darken-3">들어가기</a>
						<a class="btn z-depth-0 blue-grey darken-1">관리</a>
				    </div>
			    </div>
				
				<h5>즐겨찾는 게시판</h5>
				<div>
					<table class="highlight">
				        <thead>
					        <tr>
								<th>게시판</th>
								<th>카테고리</th>
								<th></th>
					        </tr>
				        </thead>
				        <tbody>
					        <tr>
					            <td>게시판 이름</td>
					            <td>카테고리</td>
					            <td class="right-align">
					            	<a class="btn-small btn-floating z-depth-0 yellow lighten-1"><i class="material-icons">arrow_forward</i></a>
					            </td>
					        </tr>
				        </tbody>
			    	</table>
				</div>
			</div>
			
			<div class="col m9">
<!-- 			카테고리 -->
				<div class="content">
					<a class="btn z-depth-0 yellow darken-3">전체</a>
					<a class="btn z-depth-0 yellow darken-3">카테고리</a>
					<a class="btn z-depth-0 yellow darken-3">카테고리</a>
					<a class="btn z-depth-0 yellow darken-3">카테고리</a>
					<a class="btn z-depth-0 yellow darken-3">카테고리</a>
					<a class="btn z-depth-0 yellow darken-3">카테고리</a>
					<a class="btn z-depth-0 yellow darken-3">카테고리</a>
					<a class="btn z-depth-0 yellow darken-3">카테고리</a>
					<a class="btn z-depth-0 yellow darken-3">카테고리</a>
					<a class="btn z-depth-0 yellow darken-3">카테고리</a>
					<a class="btn z-depth-0 yellow darken-3">카테고리</a>
				</div>
				
<!-- 			게시판 표시 -->
				<div class="content row">
					<div class="col m6 l4">
						<div class="card">
						    <div class="card-image waves-effect waves-block waves-light">
						    	<img class="activator" src="../../resource/images/sample.jpg">
						    </div>
						    <div class="card-content">
						    	<span class="card-title activator grey-text text-darken-4">Card Title<i class="material-icons right">add</i></span>
						    	<p><a href="#">This is a link</a></p>
						    </div>
						    <div class="card-reveal">
						    	<span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
						    	<p>Here is some more information about this product that is only revealed once clicked on.</p>
						    </div>
				    	</div>
					</div>
					
					<div class="col m6 l4">
						<div class="card">
						    <div class="card-image waves-effect waves-block waves-light">
						    	<img class="activator" src="../../resource/images/sample.jpg">
						    </div>
						    <div class="card-content">
						    	<span class="card-title activator grey-text text-darken-4">Card Title<i class="material-icons right">add</i></span>
						    	<p><a href="#">This is a link</a></p>
						    </div>
						    <div class="card-reveal">
						    	<span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
						    	<p>Here is some more information about this product that is only revealed once clicked on.</p>
						    </div>
				    	</div>
					</div>
					
					<div class="col m6 l4">
						<div class="card">
						    <div class="card-image waves-effect waves-block waves-light">
						    	<img class="activator" src="../../resource/images/sample.jpg">
						    </div>
						    <div class="card-content">
						    	<span class="card-title activator grey-text text-darken-4">Card Title<i class="material-icons right">add</i></span>
						    	<p><a href="#">This is a link</a></p>
						    </div>
						    <div class="card-reveal">
						    	<span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
						    	<p>Here is some more information about this product that is only revealed once clicked on.</p>
						    </div>
				    	</div>
					</div>
					
					<div class="col m6 l4">
						<div class="card">
						    <div class="card-image waves-effect waves-block waves-light">
						    	<img class="activator" src="../../resource/images/sample.jpg">
						    </div>
						    <div class="card-content">
						    	<span class="card-title activator grey-text text-darken-4">Card Title<i class="material-icons right">add</i></span>
						    	<p><a href="#">This is a link</a></p>
						    </div>
						    <div class="card-reveal">
						    	<span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
						    	<p>Here is some more information about this product that is only revealed once clicked on.</p>
						    </div>
				    	</div>
					</div>
					
					<div class="col m6 l4">
						<div class="card">
						    <div class="card-image waves-effect waves-block waves-light">
						    	<img class="activator" src="../../resource/images/sample.jpg">
						    </div>
						    <div class="card-content">
						    	<span class="card-title activator grey-text text-darken-4">Card Title<i class="material-icons right">add</i></span>
						    	<p><a href="#">This is a link</a></p>
						    </div>
						    <div class="card-reveal">
						    	<span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
						    	<p>Here is some more information about this product that is only revealed once clicked on.</p>
						    </div>
				    	</div>
					</div>
					
					<div class="col m6 l4">
						<div class="card">
						    <div class="card-image waves-effect waves-block waves-light">
						    	<img class="activator" src="../../resource/images/sample.jpg">
						    </div>
						    <div class="card-content">
						    	<span class="card-title activator grey-text text-darken-4">Card Title<i class="material-icons right">add</i></span>
						    	<p><a href="#">This is a link</a></p>
						    </div>
						    <div class="card-reveal">
						    	<span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
						    	<p>Here is some more information about this product that is only revealed once clicked on.</p>
						    </div>
				    	</div>
					</div>
				</div>
				
<!-- 			페이징 -->
				<div class="content">
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
			</div>
		</div>
	</div>
	
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>