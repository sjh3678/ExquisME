<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">
.flex-container {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	width: 90%;
	min-width: 1080px;
	border:1px dotted #FF00FF;
}

#flex-items {
	min-width: 260px;
	width: 260px;
	height: 300px;
	background:#999;
	border-radius: 3px; 
	margin:4px;
}

}
</style>

<h1>Extagram</h1>
<hr>

<div class="container">

<div class="flex-container">
<c:forEach items="${list}" var="list">
    <div id="flex-items" style="background: #2E9AFE;">
	<table>
		<tr>
			<td>프로필사진</td><td>${list.exNo }</td>
		</tr>
		<tr>
			<td>${list.exContent }</td><td></td>
		</tr>
		<tr>
			<td>사진</td>
		</tr>
		<tr>
			<td>♡ 0 </td>
		</tr>
		<tr>
			<td>${list.exDate }</td>
		</tr>
	</table>
    </div>
</c:forEach>
</div>
<c:import url="/WEB-INF/views/layout/paging.jsp" />

</div><!-- .container -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />