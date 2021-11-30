<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">
.container{
	margin-bottom: 50px;
}
.row{
	width: 900px;
	margin: 0 auto;
}
.title{
	background: #8A7E6B;
	color: #35312B;
	font-size: 21px;
	font-weight: 700;
 	margin-bottom: 5px;
 	border-radius: 10px;
}
.titleText{
	margin: 20px;
}
.contentChild{
	background: #ECE6CC;
	margin-bottom: 5px;
	padding: 30px;
 	border-radius: 10px;
    overflow: hidden;
    word-break: break-all;
/* 	overflow-y: scroll; */
}
.title button{
	color: pink;
}
.title a:link{
	vertical-align: middle;
	color: #ECE6CC;
}
.title a:hover{
	color: #8A7E6B;
	text-decoration: none;
}
.title:hover{
	background-color: #35312B;
	color: #ECE6CC;
	border-radius: 10px;
	transform: scale(1.01);
}
.titleChild{
	padding-right: 15px;
	padding-left: 15px;
	width: 700px;
	white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
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

<h1>faq</h1>
<hr>

<c:forEach items="${faqList }" var="i">
<div class="row">
	<div class="title">
		<div class="titleChild" style="cursor: pointer;">
			<span class="titleText"><c:out value="${i.faqTitle}"/></span>
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