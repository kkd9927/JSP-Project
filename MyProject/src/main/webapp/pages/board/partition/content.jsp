<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="/MyProject/pages/board/js/content.js"></script>  

<div class="card b-container">
	<div class="card-content b-title">
<!-- 글 작성 당일 자정 이전 -->
		<p>시간:분</p>
<!-- 글 작성 당일 자정 이후 -->		
<!-- 		<p>n일 전</p> -->
		<span class="card-title b-subject"><b>글 제목</b></span>
		<p class="right-align b-writer">
			<a href="#" class="black-text">
				@작성자_닉네임
				<span class="btn-floating btn-small">
					<img src="/MyProject/resource/images/basic_profile_img.jpg">
				</span>
			</a>
		</p>
	</div>
	
	<div class="card-content b-content">
<!-- 사진 있을경우 -->
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
		
		<p>글 내용</p>
	</div>
	
	<div class="card-content">
		<div class="right-align">
<!-- 추천 안했을 경우 -->
			<a href="#" class="black-text"><i class="samll material-icons">favorite_border</i></a>
<!-- 추천 했을 경우 -->							
<!-- 			<a href="#" class="black-text"><i class="samll material-icons">favorite</i></a> -->
		</div>
	</div>
	
<!-- 	<div class="b-comment-line"> -->
<!-- 		<ul class="collapsible z-depth-0"> -->
<!-- 			<li> -->
<!-- 				<div class="collapsible-header"> -->
<!-- 					<i class="material-icons">keyboard_arrow_down</i> -->
<!-- 					<b>comment(1)</b> -->
<!-- 				</div> -->
<!-- 				<div class="collapsible-body left-align"> -->
<!-- 					<p> -->
<!-- 						<a href="#" class="black-text"> -->
<!-- 							<span class="btn-floating btn-small"> -->
<!-- 								<img src="/MyProject/resource/images/basic_profile_img.jpg"> -->
<!-- 							</span> -->
<!-- 							@작성자_닉네임 -->
<!-- 						</a> -->
<!-- 						댓글 내용 -->
<!-- 					</p> -->
<!-- 				</div> -->
<!-- 			</li> -->
<!-- 		</ul> -->
<!-- 	</div> -->
</div>

