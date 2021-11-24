<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/header.jsp" />



<style type="text/css">
table {
	table-layout: fixed;
}

table, th {
	text-align: center;
}
</style>

<div class="container">

<h1><Strong>Admin Report</Strong></h1><br>

<table class="table table-hover">
<thead>
	<tr>
		<th style="width: 5%;">No</th>
		<th style="width: 15%;">신고 사유</th>
		<th style="width: 10%;">신고인</th>
		<th style="width: 10%;">피 신고인</th>
		<th style="width: 10%;">신고일</th>
		<th style="width: 10%;">제재 형태</th>
		<th style="width: 10%;">제재 사유</th>
		<th style="width: 10%;">제재 시작일</th>
		<th style="width: 10%;">제재 종료일</th>
		<th style="width: 10%;">처리 여부</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${reportList }" var="reportList">
	<tr>
		<td>${reportList.REPORT_NO }</td>
		<td><a href="/extagram/view?exNo=${reportList.EX_POST_NO }">${reportList.REPORT_CONTENT}</a></td>
		<td>${reportList.REPORTER }</td>
		<td>${reportList.DEFENDANT }</td>
		<td><fmt:formatDate value="${reportList.REPORT_DATE }" pattern="yyMMdd HH:mm"/></td>
		<td>${reportList.BAN_TYPE }</td>
		<td>${reportList.REASON}</td>
		<td><fmt:formatDate value="${reportList.BAN_DATE }" pattern="yyMMdd HH:mm"/></td>
		<td><fmt:formatDate value="${reportList.EXPIRE_DATE }" pattern="yyMMdd HH:mm"/></td>
		<td>${reportList.IS_EXECUTE}</td>
		
	</tr>
</c:forEach>
</tbody>
</table>

<div class="clearfix"></div>

<c:import url="/WEB-INF/views/layout/paging.jsp" />

</div><!-- .container -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />







