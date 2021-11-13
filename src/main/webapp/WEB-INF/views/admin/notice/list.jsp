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
	min-height: 300px;
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
</style>

<script>
$(document).ready(function(){
	
    $(".titleChild").click(function(){
		$(this).parent().next("div").children().slideToggle();
    });
	
})
</script>

<div class="container">

<h1>admin notice list</h1>
<hr>

<c:forEach items="${noticeList }" var="i">
<div class="row">
	<div class="title">
		<div class="titleChild" style="cursor: pointer;">
		<span class="titleText">${i.NOTICE_TITLE}</span>
		<a href="/admin/notice/delete?noticeNo=${i.NOTICE_NO}"><button id="btnUpdate" class="btn btn-danger" style="float: right;">DELETE</button></a>
		<a href="/admin/notice/update?noticeNo=${i.NOTICE_NO}"><button id="btnUpdate" class="btn btn-primary" style="float: right;">UPDATE</button></a>
<%-- 		<a href="/admin/notice/delete?noticeNo=${i.NOTICE_NO}" style="float: right;">DELETE</a> --%>
<%-- 		<a href="/admin/notice/update?noticeNo=${i.NOTICE_NO}" style="float: right;">UPDATE</a> --%>
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
<a href="/admin/notice/write"><button id="btnWrite" class="btn btn-primary pull-left">WRITE</button></a>

</div><%-- .container --%>
<c:import url="/WEB-INF/views/layout/footer.jsp" />