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
<body>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

	<nav class="row">
		<div class="col m4">
			<img src="#" width="50" height="50" style="margin-top: 7px">
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
				<a class="btn z-depth-0">로그인</a>
				<a class="btn z-depth-0">회원가입</a>
   			</div>
		</div>
	</nav>
<!--     		<a href="#" class="left brand-logo"><i class="material-icons">cloud</i>Logo</a> -->
    		
<!-- 	    	<form action="#" method="post"> -->
<!-- 		        <div class="input-field"> -->
<!-- 		        	<input id="search" type="search" required> -->
<!-- 		        	<label class="label-icon" for="search"><i class="material-icons">search</i></label> -->
<!-- 		        	<i class="material-icons">close</i> -->
<!-- 		        </div> -->
<!-- 	      	</form> -->
      		
<!--     		<a href="#" class="right">asd</a> -->

</body>
</html>