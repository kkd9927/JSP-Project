<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h5>운영중인 게시판</h5>
<!-- 운영중인 게시판이 없을때			 -->
<!--     	<div class="card"> -->
<!--     <div class="card-content"> -->
<!--         <p> -->
<!--         	아직 운영중인 게시판이 없어요...<br> -->
<!--        		나만의 게시판을 만들어보세요! -->
<!--         </p> -->
<!--     </div> -->
<!--     <div class="card-action"> -->
<!-- 		<a class="btn z-depth-0 yellow darken-3">게시판 생성</a> -->
<!--     </div> -->
<!--    </div> -->

<!-- 운영중인 게시판이 있을때 -->
<div class="card">
    <div class="card-image">
        <img src="/MyProject/resource/images/sample.jpg">
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