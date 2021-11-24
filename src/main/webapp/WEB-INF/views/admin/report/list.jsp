<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

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

<form action="/admin/report/list" method="post">
<table class="table table-hover">
<thead>
	<tr>
		<th style="width: 5%;">No</th>
		<th style="width: 15%;">신고 사유</th>
		<th style="width: 10%;">신고인</th>
		<th style="width: 10%;">피 신고인</th>
		<th style="width: 10%;">신고일</th>
		<th style="width: 10%;">제재 사유</th>
		<th style="width: 10%;">제재 형태</th>
		<th style="width: 10%;">제재 시작일</th>
		<th style="width: 10%;">제재 종료일</th>
		<th style="width: 5%;">처리</th>
		<th style="width: 5%;">확인</th>
		
	</tr>
</thead>
<tbody>
<c:forEach items="${reportList }" var="reportList">
	<tr>
		<td>${reportList.REPORT_NO }</td>
		<td><div><a href="/extagram/view?exNo=${reportList.EX_POST_NO }">${reportList.REPORT_CONTENT}</a></div></td>
		<td>${reportList.REPORTERNICK }</td>
		<td>${reportList.DEFENDANTNICK }</td>
		<td><fmt:formatDate value="${reportList.REPORT_DATE }" pattern="yyMMdd HH:mm"/></td>
		<td>${reportList.REASON}
			<select id="reason" name="reason" style="text-align: center;">
				<option value="">${reportList.REASON }</option>
				<option value="도배">도배</option>
				<option value="광고">광고</option>
				<option value="비방">비방</option>
				<option value="욕설">욕설</option>
			</select>
		</td>
		<td>
			<select id="banType" name="banType" style="text-align: center;">
				<option value="">${reportList.BAN_TYPE }</option>
				<option value="1일 정지">1일 정지</option>
				<option value="3일 정지">3일 정지</option>
				<option value="5일 정지">5일 정지</option>
				<option value="7일 정지">7일 정지</option>
			</select>
		</td>
		<td><fmt:formatDate value="${reportList.BAN_DATE }" pattern="yyMMdd HH:mm"/></td>
		<td><fmt:formatDate value="${reportList.EXPIRE_DATE }" pattern="yyMMdd HH:mm"/></td>
		<td>${reportList.IS_EXECUTE}</td>
		<td><button onclick="/admin/report/list?curPage=1" class="btn btn-xs">!</button></td>
	</tr>
</c:forEach>
</tbody>
</table>
</form>

<div class="clearfix"></div>

<c:import url="/WEB-INF/views/layout/paging.jsp" />

</div><!-- .container -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />







