<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
li:hover{
	background-color:rgba(0, 0, 0, 0.2);/*까만색(0,0,0) 80% 투명도*/
}
.pagingArea{
	width:100%;
}
ul{
	list-style: none;
	text-align:center;
}
li{
	display: inline-block;
}
table{
	table-layout:fixed;
	width:100%;
	border: 1px solid #ccc;
	cellpadding: 0;
	
}
table tr td{
	text-align: center;
}
td{
	overflow:hidden;
}
#aDelete {
	margin: 5px;
}
</style>
<table class="table table-striped table-hover">
<thead>
	<tr>		
		<th style="width: 20%; text-align: center;">향수 1</th>
		<th style="width: 20%; text-align: center;">향수 2</th>
		<th style="width: 20%; text-align: center;">비율</th>
		<th style="width: 20%; text-align: center;">일시</th>
		<th style="width: 20%; text-align: center;">삭제</th>
		
	</tr>
</thead>
<tbody>
<c:forEach items="${layerList }" var="list">
	<tr>
		<td style="text-align: center; vertical-align: middle;">
			<img class="user_img" style="background:white; width:50px; height:50px; display: block; margin: auto;" src="/upload/${list.PERFUME1 }">
		</td>
		<td style="text-align: center; vertical-align: middle;">
			<img class="user_img" style="background:white; width:50px; height:50px; display: block; margin: auto;" src="/upload/${list.PERFUME2 }">
		</td>
		<td style="text-align: center; vertical-align: middle;">${list.PERFUME1_PER } / ${100 - list.PERFUME1_PER }</td>
		<td style="text-align: center; vertical-align: middle;"><fmt:formatDate value="${list.LAYERING_DATE }" pattern="YY-MM-dd"/></td>
		<td style="text-align: center; vertical-align: middle;"><a href="/admin/user/history/layer/delete?layeringNo=${list.LAYERING_NO }&userNo=${list.USER_NO }" onclick="return confirm('레이어링을 삭제하시겠습니까? 삭제된 레이어링은 원상복구 할 수 없습니다.');"><button class="btn btnDetail">삭제</button></a></td>
	</tr>	
</c:forEach>
</tbody>
</table>

<div class="pagingArea">
	<ul>
		<%-- 첫페이지로 이동 --%>
		<c:if test="${paging.curPage ne 1 }">
			<li><label onclick=getLayerList(1)><a>첫</a></label></li>
		</c:if>
		
		<%-- 이전페이징 리스트로 이동 --%>
		<c:choose>
			<c:when test="${paging.startPage ne 1 }">
				<li><label onclick=getLayerList(${paging.startPage - paging.pageCount })>&lt;</label></li>
			</c:when>
		</c:choose>
		
		<%-- 페이징 리스트 --%>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
			<c:if test="${paging.curPage eq i }">
				<li><label>${i }</label></li>
			</c:if>
			
			<c:if test="${paging.curPage ne i }">
				<li><label onclick=getLayerList(${i })>${i }</label></li>
			</c:if>
		</c:forEach>

		<%-- 다음페이징 리스트로 이동 --%>	
		<c:if test="${paging.endPage ne paging.totalPage }">
			<li><label onclick=getLayerList(${paging.startPage + paging.pageCount })>&gt;</label></li>
		</c:if>
				
		<%-- 끝페이지로 이동 --%>
		<c:if test="${paging.curPage ne paging.totalPage }">
			<li><label onclick=getLayerList(${paging.totalPage })>끝</label></li>
		</c:if>
	</ul>
</div>