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

<h1>faq list</h1>
<hr>

<c:forEach items="${faqList }" var="i">
<div class="row">
	<div class="title">
		<div class="titleChild" style="cursor: pointer;">
			<span class="titleText">${i.faqTitle}</span>
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