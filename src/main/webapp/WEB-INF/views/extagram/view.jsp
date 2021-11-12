<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">
#flex-container {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	width: 90%;
	min-width: 1080px;
}
.flex-items {
	min-width: 260px;
	width: 540px;
	height: 375px;
	border-radius: 3px; 
	margin: 0px;
}


</style>
<h1>Extagram view</h1>
<hr>

<div class="container">

<div>
<SPAN>사진</SPAN><SPAN>${viewExta.NICK }</SPAN><SPAN>${viewExta.EX_DATE }</SPAN>
</div>

<div id="viewContent">
${viewExta.EX_CONTENT }
</div>

<div id="flex-container">
	<div class="flex-items">
		<div id="viewPicture">
			<img style="width:530px; height:375px; display: block; margin: auto;"
				 src="/resources/img/perf/${viewExta.PICTURE_S}">
		</div>
	</div>
	<div class="flex-items">
		<div id="viewComment" style="height: 323px; background-color: #ccc;">
			${viewExta.EX_COMM }
		</div>
		<div style="background: #ccc;">
			<SPAN>♡${viewExta.HEART }</SPAN><SPAN>댓글${viewExta.COMM }</SPAN>
		</div>
		<div style="background: #ccc; height: 34px;">
			<input type="text" id="comment" name="comment" style="width: 471px; height: 30px; border: none; background: #ccc;"/>
			<button class="btn pull-right">POST</button>
		</div>
	</div>
</div><br>

<div class="text-center">
	<a href="/extagram/report?exNo=${viewExta.EX_NO }"><button class="btn">신고</button></a>
	<a href="/extagram/list"><button class="btn">목록</button></a>
<%-- 	<c:if test="${세션ID eq view.writerId }"> --%>
		<a href="/extagram/update?exNo=${viewExta.EX_NO }"><button class="btn">수정</button></a>
		<a href="/extagram/delete?exNo=${viewExta.EX_NO }"><button class="btn">삭제</button></a>
<%-- 	</c:if> --%>
	
</div>

<div class="text-center">
작성한 글
</div>


</div><!-- .container -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />