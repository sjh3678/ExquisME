<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">
.title{
	font-size: 33px;
	font-weight: 700;
}
</style>

<script>
$('#content').hide();
$('#title').click(function(){
	$('#content').slideDown();
})
</script>

<div class="container">

<h1>notice list</h1>
<hr>

<c:forEach items="${noticeList }" var="i">
<div class="title">${i.NOTICE_TITLE}</div>
<div class="content" style="padding: 1em; width:200px; height:100px; background-color: lightskyblue;">
	<ul>
		<li>${i.NOTICE_CONTENT}</li>
		<li><fmt:formatDate value="${i.NOTICE_DATE}" pattern="YY-MM-dd"/></li>
		<li>${i.STORED_NAME}</li>
	</ul>
</div>
<hr>
</c:forEach>

<span class="pull-left">total : ${paging.totalCount }</span>

<div class="clearfix"></div>
<c:import url="/WEB-INF/views/layout/paging.jsp" />

</div><%-- .container --%>
<c:import url="/WEB-INF/views/layout/footer.jsp" />