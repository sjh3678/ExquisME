<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">
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
/* 	overflow-y: scroll; */
}
.title button{
	color: pink;
}
.title a:link{
	vertical-align: middle;
	color: #ECE6CC;
}
.titleChild:hover{
	background-color: #35312B;
	color: #ECE6CC;
	border-radius: 10px;
}
.titleChild{
	padding-right: 15px;
	padding-left: 15px;
}
.contentFile{
	text-align: center;
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

<h1>notice</h1>
<hr>

<c:forEach items="${noticeList }" var="i">
<div class="row">
	<div class="title">
		<div class="titleChild" style="cursor: pointer;"><span class="titleText">${i.NOTICE_TITLE}</span></div>
	</div>
	<div class="content">
		<div class="contentChild" style="display: none;">
			<div class="contentFile"><img src="/upload/${i.STORED_NAME}"/></div>
			<div class="contentText">${i.NOTICE_CONTENT}</div>
			<div class="contentDate">
				<br><br><br><fmt:formatDate value="${i.NOTICE_DATE}" pattern="YY년 MM월 dd일"/>
				<br><br>${i.NICK } 올림
			</div>
		</div>
	</div>
</div>
</c:forEach>

<div class="clearfix"></div>
<c:import url="/WEB-INF/views/layout/paging.jsp" />

</div><%-- .container --%>
<c:import url="/WEB-INF/views/layout/footer.jsp" />