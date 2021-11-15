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
	background: #ECE6CC;
	margin-bottom: 5px;
/* 	overflow-y: scroll; */
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

<h1>admin faq list&nbsp;&nbsp;&nbsp;<a href="/admin/faq/write"><button id="btnWrite" class="btn btn-primary">WRITE</button></a></h1>
총 게시글 수 : [${faqTotal }] (>= 10이면 글쓰기 버튼 비활성화 또는 알럹)
<hr>

<c:forEach items="${faqList }" var="i">
<div class="row">
	<div class="title">
		<div class="titleChild" style="cursor: pointer;">
		<span class="titleText">${i.faqTitle}</span>
		<span style="float: right; font-size: 18px; font-weight: 400;"><a href="/admin/faq/delete?faqNo=${i.faqNo}">삭제</a>&nbsp;&nbsp;&nbsp;</span>
		<span style="float: right; font-size: 18px; font-weight: 400;"><a href="/admin/faq/update?faqNo=${i.faqNo}">수정</a>&nbsp;&nbsp;&nbsp;</span>
		</div>
	</div>
	<div class="content">
		<div class="contentChild" style="display: none;">
			<div class="contentText">
			${i.faqContent}
			</div>
		</div>
	</div>
</div>
</c:forEach>


</div><%-- .container --%>
<c:import url="/WEB-INF/views/layout/footer.jsp" />