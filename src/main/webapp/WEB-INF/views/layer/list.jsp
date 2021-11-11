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
		<th>LAYERING_NO</th>
		<th>USER_NO</th>
		<th>PERFUME_NO1</th>
		<th>PERFUME_NO2</th>
		<th>PERFUME1_PER</th>
		<th>LAYERING_CONTENT</th>
		<th>LAYERING_DATE</th>
		<th>NICK</th>
		<th>SCNT</th>
	</tr>
</thead>
<tbody>

<c:forEach items="${list }" var="layer">
	<tr>
		<td>${layer.LAYERING_NO }</td>
		<td>${layer.USER_NO }</td>
		<td>${layer.PERFUME_NO1 }</td>
		<td>${layer.PERFUME_NO2 }</td>
		<td>${layer.PERFUME1_PER }</td>
		<td>${layer.LAYERING_CONTENT }</td>
		<td><fmt:formatDate value="${layer.LAYERING_DATE }" pattern="yy-MM-dd HH:mm:ss"/></td>
		<td>${layer.NICK }</td>
		<td>${layer.SCNT }</td>
	</tr>
</c:forEach>
</tbody>
</table>

<a href="/board/write"><button class="btn btn-primary pull-left">글작성</button></a>
<a href="/layer/list?target=1"><button class="btn btn-primary pull-left">추천순</button></a>
<a href="/layer/list?target=2"><button class="btn btn-primary pull-left">인기순</button></a>
<span class="pull-right">total : ${paging.totalCount }</span>
<div class="clearfix"></div>

<c:import url="/WEB-INF/views/layout/paging.jsp" />

</div><!-- .container -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />