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
	wdith: 300px;
	height: 300px;
	float: left;
	margin: 5px;
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

<h1>notice list</h1>
<hr>

<c:forEach items="${noticeList }" var="i">
<div class="row">
	<div class="title">
		<div class="titleChild" style="cursor: pointer;"><span class="titleText">${i.NOTICE_TITLE}</span></div>
	</div>
	<div class="content">
		<div class="contentChild" style="display: none;">
			<img class="contentFile" src="/upload/${i.STORED_NAME}"/>
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

<div class="clearfix"></div>
<c:import url="/WEB-INF/views/layout/paging.jsp" />

</div><%-- .container --%>
<c:import url="/WEB-INF/views/layout/footer.jsp" />