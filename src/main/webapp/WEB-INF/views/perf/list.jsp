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
		<th style="width: 10%;">성별</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list }" var="perf">
	<tr>
		<td>${perf.perfumeNo }</td>
		<td>${board.brandNo }</td>
		<td>${board.fileNo }</td>
		<td>${board.perfumeName }</td>
		<td>${board.perfumeVitality }</td>
		<td>${board.perfumeGender }</td>
	</tr>
</c:forEach>
</tbody>
</table>


<button id="btnWrite" class="btn btn-primary pull-left">글쓰기</button>
<span class="pull-right">total : ${paging.totalCount }</span>
<div class="clearfix"></div>

<c:import url="/WEB-INF/views/layout/paging.jsp" />

</div><!-- .container -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />











