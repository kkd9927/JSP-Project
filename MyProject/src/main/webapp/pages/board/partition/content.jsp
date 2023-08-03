<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="card b-container">
	<div class="card-content b-title">
		<span class="card-title b-subject"><b>글 제목</b></span>
		<p class="right-align b-writer">
			<a href="#" class="black-text">
				@작성자_닉네임
				<span class="btn-floating btn-small">
					<img src="/JSP_Project/resource/images/basic_profile_img.jpg">
				</span>
			</a>
		</p>
	</div>
	
	<div class="card-content b-content">
<!-- 사진 있을경우 -->
		<div class="carousel carousel-slider">
			<a href="/JSP_Project/resource/images/sample.jpg" target="_blank" class="carousel-item"><img src="/JSP_Project/resource/images/sample.jpg"></a>
			<a href="/JSP_Project/resource/images/sample.jpg" target="_blank" class="carousel-item"><img src="/JSP_Project/resource/images/sample.jpg"></a>
			<a href="/JSP_Project/resource/images/sample.jpg" target="_blank" class="carousel-item"><img src="/JSP_Project/resource/images/sample.jpg"></a>
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
	
	<div class="card-action b-comment">
		<div class="b-comment-line">
			<h6><a href="#" class="black-text"><b>comment(1)</b></a></h6>
		</div>
		
		<div class="b-comment-line">
			<p>
				<a href="#" class="black-text">
					<span class="btn-floating btn-small">
						<img src="/JSP_Project/resource/images/basic_profile_img.jpg">
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