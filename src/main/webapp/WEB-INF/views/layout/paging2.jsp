<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<style type="text/css">
.pagination>.active>a, 
.pagination>.active>a:focus, 
.pagination>.active>a:hover, 
.pagination>.active>span, 
.pagination>.active>span:focus, 
.pagination>.active>span:hover {
	background-color: #ECE6CC;
	border-color: #ECE6CC;
	color: black;
}
</style>

<div class="text-center">
<ul class="pagination pagination-ss">

<!-- 이전 페이지로 가기 -->
<c:if test="${paging.curPage > 1 }">
	<li><a href="<%=request.getContextPath() %>${linkUrl }?curPage=${paging.curPage - 1 }">◀</a></li>
</c:if>

<!-- 다음 페이지로 가기 -->
<c:if test="${paging.curPage < paging.totalPage }">
	<li><a href="<%=request.getContextPath() %>${linkUrl }?curPage=${paging.curPage + 1 }">▶</a></li>
</c:if>

</ul>
</div>