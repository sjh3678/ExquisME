<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">
#extagram {
	border : 1px solid #ccc;
}
</style>

<h1>Extagram</h1>
<hr>

<div class="container">

<div id="extagram" class="table table-striped table-hover">
<table>
	<tr>
		<td>사진</td><td>닉네임</td>
	</tr>
	<tr>
		<td>내용</td>
	</tr>
	<tr>
		<td>사진</td>
	</tr>
	<tr>
		<td>좋아요 댓글</td>
	</tr>
	<tr>
		<td>시간</td>
	</tr>
</table>
</div>


<c:import url="/WEB-INF/views/layout/paging.jsp" />

</div><!-- .container -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />