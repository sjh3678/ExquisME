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
.commentBox {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	width: 98%;
	min-width: 510;
	margin: 10px;
	padding: 10px;
}

a:link { color: black; text-decoration: none;}
a:visited { color: black; text-decoration: none;}
a:hover { color: black; text-decoration: underline;}

</style>

<div class="container">
<h1>Extagram view</h1>
<hr>


<div>
<SPAN>사진</SPAN><SPAN>${viewExta.NICK }</SPAN><SPAN>${viewExta.EX_DATE }</SPAN>
</div>

<div id="viewContent" style="margin: 20px; height: 100px; width: 500px;">
${viewExta.EX_CONTENT }
</div>

<div id="flex-container">
	<div class="flex-items">
		<div id="viewPicture">
			<img style="width:auto; height:350px; display: block; margin: auto;"
				 src="/resources/img/perf/${viewExta.PICTURE_S}">
		</div>
	</div>
	<div class="flex-items">
		<div id="viewComment" style="height: 321px; overflow-y: scroll; ">
			<c:forEach items="${viewComm }" var="viewComm">
				<div class="commentBox">
					<div><img style="width:30px; height:30px;"src="/resources/img/perf/${viewComm.STORED_NAME}">&nbsp;&nbsp;&nbsp;</div>
					<div style="padding: 5px;">${viewComm.NICK}&nbsp;&nbsp;&nbsp;</div>
					<div style="padding: 5px;">${viewComm.EX_COMM }</div>
					<div style="padding: 5px;">${viewComm.EX_COMM_DATE}</div>
				</div>
			</c:forEach>
		</div>
		<div>
			<SPAN>하트 ${viewExta.HEART }&nbsp;&nbsp;&nbsp;&nbsp;댓글 ${viewExta.COMM }</SPAN>
		</div>
		<div style="border: 1px solid #ddd; height: 37px;">
			<input type="text" id="comment" name="comment" placeholder="댓글" style="width: 475px; height: 34px; border: none;"/>
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