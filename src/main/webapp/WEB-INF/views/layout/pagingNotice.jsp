<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.my.pagination > .active > a, 
.my.pagination > .active > span, 
.my.pagination > .active > a:hover, 
.my.pagination > .active > span:hover, 
.my.pagination > .active > a:focus, 
.my.pagination > .active > span:focus {
	background: #8A7E6B;
	border-color: #8A7E6B;
	color: #ECE6CC;
}
.my.pagination a {
	color: #35312B;
}
</style>

<div class="text-center pageDiv">
<ul class="pagination my">

	<!-- 첫 페이지로 -->
	<c:if test="${paging.curPage ne 1 }">
		<li><a href="<%=request.getContextPath() %>${linkUrl }">첫 페이지로 </a></li>
	</c:if>
	
	<!-- 이전 페이징 리스트로 이동 -->
	<c:if test="${paging.startPage ne 1 }">
		<li><a href="<%=request.getContextPath() %>${linkUrl }?curPage=${paging.startPage - paging.pageCount }"> &lt; </a></li>
	</c:if>
	
	<!-- 이전 페이지로 가기 -->
<%-- 	<c:if test="${paging.curPage > 1 }"> --%>
<%-- 		<li><a href="<%=request.getContextPath() %>${linkUrl }?curPage=${paging.curPage - 1 }">&larr;</a></li> --%>
<%-- 	</c:if> --%>
	
	<!-- 페이징 리스트 -->
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
		<c:if test="${paging.curPage eq i }">
			<li class="active"><a href="<%=request.getContextPath() %>${linkUrl }?curPage=${i }">${i }</a></li>
		</c:if>
		<c:if test="${paging.curPage ne i }">
			<li><a href="<%=request.getContextPath() %>${linkUrl }?curPage=${i }">${i }</a></li>
		</c:if>
	</c:forEach>
	
	<!-- 다음 페이지로 가기 -->
<%-- 	<c:if test="${paging.curPage < paging.totalPage }"> --%>
<%-- 		<li><a href="<%=request.getContextPath() %>${linkUrl }?curPage=${paging.curPage + 1 }">&rarr;</a></li> --%>
<%-- 	</c:if> --%>
	
	<!-- 다음 페이징 리스트로 이동 -->
	<c:if test="${paging.endPage ne paging.totalPage }">
		<li><a href="<%=request.getContextPath() %>${linkUrl }?curPage=${paging.startPage + paging.pageCount }"> &gt; </a></li>
	</c:if>
	
	<!-- 마지막 페이지로 -->
	<c:if test="${paging.curPage ne paging.totalPage }">
		<li><a href="<%=request.getContextPath() %>${linkUrl }?curPage=${paging.totalPage }">끝 페이지로</a></li>
	</c:if>

</ul>
</div>