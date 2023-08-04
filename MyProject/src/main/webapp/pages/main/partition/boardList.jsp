<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="content row">
	<%
		for(int i=0; i<8; i++) {
	%>
	<div class="col s3">
		<div class="card">
		    <div class="card-image">
		    	<img class="activator" src="/MyProject/resource/images/sample.jpg">
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
	<%
		}
	%>
</div>