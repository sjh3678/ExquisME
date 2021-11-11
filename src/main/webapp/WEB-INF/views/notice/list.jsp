<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/header.jsp" />
<div class="container">

<style type="text/css">
table{
	table-layout: fixed;
}
table, th{
	text-align: center;
}
td:nth-child(2){/*제목은 왼쪽 정렬*/
	text-align: left;
}
</style>

<h1>notice list</h1>
<hr>

<div class="container">

<table class="table table-striped talbe-hover">
<tr>
	<th style="width: 10%;">게시글번호</th>
	<th style="width: 45%;">제목</th>
	<th style="width: 20%;">작성자</th>
	<th style="width: 10%;">내용</th>
	<th style="width: 15%;">작성일</th>
</tr>
<c:forEach items="${noticeList }" var="i">
<tr>
	<td>${i.noticeNo}</td>
	<td><a href="/notice/view?noticeNo=${i.noticeNo}">${i.noticeTitle}</a></td>
	<td>${i.userNo}</td>
	<td>${i.noticeContent}</td>
	<td><fmt:formatDate value="${i.noticeDate}" pattern="YY-MM-dd"/></td>
</tr>
</c:forEach>
</table>

<span class="pull-left">total : ${paging.totalCount }</span>
<div class="clearfix"></div>

<c:import url="/WEB-INF/views/layout/paging.jsp" />
<hr>
<a href="admin/notice/write"><button id="btnWrite" class="btn btn-primary pull-left">WRITE</button></a>

</div><%-- .container --%>
<c:import url="/WEB-INF/views/layout/footer.jsp" />