<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">
.row{
	width: 1100px;
}
.title{
	background: #8A7E6B;
	color: #ECE6CC;
	font-size: 21px;
	font-weight: 700;
 	margin-bottom: 5px;
}
.titleText{
	margin: 20px;
}
.contentChild{
/* 	min-height: 300px; */
	background: #ECE6CC;
	margin-bottom: 5px;
/* 	overflow-y: scroll; */
}
.contentFile{
	height: 300px;
 	float: left;
}
.contentDate{
	text-align: right;
}
.title a:link{
	color: #ECE6CC;
}
.title a:hover{
	color: #35312B;
}
</style>

<script>
$(document).ready(function(){
	
    $(".titleChild").click(function(){
		$(this).parent().next("div").children().slideToggle();
    });
	
})
</script>

<div class="container">

<h1>admin notice list&nbsp;&nbsp;&nbsp;<a href="/admin/notice/write"><button id="btnWrite" class="btn">WRITE</button></a></h1>
<h1>admin notice list&nbsp;&nbsp;&nbsp;<span style="font-size: 18px; font-weight: 400;"><a href="/admin/notice/write">작성</a>&nbsp;&nbsp;&nbsp;</span></h1>
<hr>

<c:forEach items="${noticeList }" var="i">
<div class="row">
	<div class="title">
		<div class="titleChild" style="cursor: pointer;">
		<span class="titleText">${i.NOTICE_TITLE}</span>
		<span style="float: right; font-size: 18px; font-weight: 400;"><a href="/admin/notice/delete?noticeNo=${i.NOTICE_NO}">삭제</a>&nbsp;&nbsp;&nbsp;</span>
		<span style="float: right; font-size: 18px; font-weight: 400;"><a href="/admin/notice/update?noticeNo=${i.NOTICE_NO}">수정</a>&nbsp;&nbsp;&nbsp;</span>
		</div>
	</div>
	<div class="content">
		<div class="contentChild" style="display: none;">
			<div><img class="contentFile" src="/upload/${i.STORED_NAME}"/></div>
			<div class="contentText">${i.NOTICE_CONTENT}</div>
			<div class="contentDate">
				<br>
				<br>
				<br>
				<fmt:formatDate value="${i.NOTICE_DATE}" pattern="YY년 MM월 dd일"/>
				<br>
				<br>
				${i.NICK } 올림
			</div>
		</div>
	</div>
</div>
</c:forEach>

<span class="pull-left">total : ${paging.totalCount }</span>
<div class="clearfix"></div>

<c:import url="/WEB-INF/views/layout/paging.jsp" />
<hr>

</div><%-- .container --%>
<c:import url="/WEB-INF/views/layout/footer.jsp" />