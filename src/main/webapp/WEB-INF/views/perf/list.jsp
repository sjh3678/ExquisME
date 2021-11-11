<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

td:nth-child(2) {
	text-align: left;
}
</style>

<div class="container">

<h1>게시판 리스트</h1>
<hr>

<table class="table table-striped table-hover">
<thead>
	<tr>
		<th style="width: 10%;">향수 번호</th>
		<th style="width: 10%;">브랜드 번호</th>
		<th style="width: 10%;">파일 번호</th>
		<th style="width: 30%;">향수 이름</th>
		<th style="width: 20%;">지속력</th>
		<th style="width: 10%;">사진</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list }" var="perf">
	<tr>
		<td>${perf.PERFUME_NO }</td>
		<td>${perf.BRAND_NO }</td>
		<td>${perf.FILE_NO }</td>
		<td>${perf.PERFUME_NAME }</td>
		<td>${perf.PERFUME_VITALITY }</td>
		<td><img style="width:30px;height:30px;object-fit:cover;margin-right:2px;"
					src="/resources/img/perf/${perf.STORED_NAME }"></td>
	</tr>
</c:forEach>
</tbody>
</table>




<c:import url="/WEB-INF/views/layout/paging.jsp" />

</div><!-- .container -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />











