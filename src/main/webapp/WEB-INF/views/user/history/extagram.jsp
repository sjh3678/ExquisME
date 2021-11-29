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
		<th style="width: 15%; text-align: center;">사진</th>
		<th style="width: 50%; text-align: center;">내용</th>
		<th style="width: 15%; text-align: center;">일시</th>
		<th style="width: 10%; text-align: center;">상세</th>
		<th style="width: 10%; text-align: center;">삭제</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${extaList }" var="exta">
	<tr>
		<td style="text-align: center; vertical-align: middle;"><img class="user_img" style="width:100px; height:100px; display: block; margin: auto;" src="/upload/${exta.UPFILE }"></td>
		<td style="text-align: center; vertical-align: middle; overflow: hidden; white-space: nowrap;">${exta.EX_CONTENT }</td>
		<td style="text-align: center; vertical-align: middle;"><fmt:formatDate value="${exta.EX_DATE }" pattern="YY-MM-dd"/></td>
		<td style="text-align: center; vertical-align: middle;"><a href="/extagram/view?exNo=${exta.EX_NO }"><button class="btn btnDetail">보기</button></a></td>
		<td style="text-align: center; vertical-align: middle;"><a href="/user/mypage/extaDelete?exNo=${exta.EX_NO }&userNo=${exta.POSTOWNER }" onclick="return confirm('게시글을 삭제하시겠습니까? 삭제된 게시글은 원상복구 할 수 없습니다.');"><button class="btn btnDetail">삭제</button></a></td>
	</tr>	
</c:forEach>
</tbody>
</table>
<div class="pagingArea">
	<ul>
		<%-- 첫페이지로 이동 --%>
		<c:if test="${paging.curPage ne 1 }">
			<li><label onclick=getExtaList(1)><a>첫</a></label></li>
		</c:if>
		
		<%-- 이전페이징 리스트로 이동 --%>
		<c:choose>
			<c:when test="${paging.startPage ne 1 }">
				<li><label onclick=getExtaList(${paging.startPage - paging.pageCount })>&lt;</label></li>
			</c:when>
		</c:choose>
		
		<%-- 페이징 리스트 --%>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
			<c:if test="${paging.curPage eq i }">
				<li><label>${i }</label></li>
			</c:if>
			
			<c:if test="${paging.curPage ne i }">
				<li><label onclick=getExtaList(${i })>${i }</label></li>
			</c:if>
		</c:forEach>

		<%-- 다음페이징 리스트로 이동 --%>	
		<c:if test="${paging.endPage ne paging.totalPage }">
			<li><label onclick=getExtaList(${paging.startPage + paging.pageCount })>&gt;</label></li>
		</c:if>
				
		<%-- 끝페이지로 이동 --%>
		<c:if test="${paging.curPage ne paging.totalPage }">
			<li><label onclick=getExtaList(${paging.totalPage })>끝</label></li>
		</c:if>
	</ul>
</div>