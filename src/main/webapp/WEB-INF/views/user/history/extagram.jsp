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
table tr td{
	text-align: center;
}
</style>
<table>
<tr>
	<td>번호</td>
	<td>작성자</td>
	<td>내용</td>
	<td>작성일</td>
</tr>
<c:forEach items="${extaList}" var="list">
<tr>
	<td style="width:10%" onclick="location.href='/extagram/view?exNo=${list.EX_NO}';">${list.EX_NO}</td>
	<td style="width:20%">${list.NICK }</td>
	<td style="width:50%">${list.EX_CONTENT }</td>
	<td style="width:20%"><fmt:formatDate value="${list.EX_DATE }" pattern="yyyy.MM.dd HH:mm"/></td>
</tr>
</c:forEach>
</table>

<div class="pagingArea">
	<ul>
		<%-- 첫페이지로 이동 --%>
		<c:if test="${paging.curPage ne 1 }">
			<li><label for="firstPage">처음</label><input type="hidden" name="curPage" id="firstPage" value="1"></li>
		</c:if>
		
		<%-- 이전페이징 리스트로 이동 --%>
		<c:choose>
			<c:when test="${paging.startPage ne 1 }">
				<li><label for="prePageList">이전</label><input type="hidden" name="curPage" id="prePageList" value="${paging.startPage - paging.pageCount }"></li>
			</c:when>
		</c:choose>
		
		<%-- 이전 페이지로 가기 --%>
		<c:if test="${paging.curPage > 1 }">
			<li><label>&lt;</label><input type="hidden" name="curPage" id="prePage" value="${paging.curPage - 1 }"></li>
		</c:if>
		
		<%-- 페이징 리스트 --%>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
			<c:if test="${paging.curPage eq i }">
				<li><label>${i }</label></li>
			</c:if>
			
			<c:if test="${paging.curPage ne i }">
				<li><label for="pageList${i }">${i }</label><input type="hidden" name="curPage" id="PageList${i }" value="${i }"></li>
			</c:if>
		</c:forEach>
		
		<%-- 다음 페이지로 가기 --%>
		<c:choose>
			<c:when test="${paging.endPage ne paging.totalPage }">
				<li><label for="nextPage">다음</label><input type="hidden" name="curPage" id="nextPage" value="${paging.curPage + 1 }"></li>
			</c:when>
			<c:when test="${paging.endPage eq paging.totalPage }">
					<li><a>다음</a></li>
			</c:when>
		</c:choose>
		
		<%-- 다음페이징 리스트로 이동 --%>
		<c:choose>
			<c:when test="${paging.endPage ne paging.totalPage }">
				<li><label for="nextPageList">&raquo;</label><input type="hidden" name="curPage" id="nextPageList" value="${paging.startPage + paging.pageCount }"></li>
			</c:when>
				
			<c:when test="${paging.endPage eq paging.totalPage }">
				<li><label>&raquo;</label></li>
			</c:when>
		</c:choose>
		
		<%-- 끝페이지로 이동 --%>
		<c:if test="${paging.curPage ne paging.totalPage }">
			<li><label for="endPage">끝</label><input type="hidden" name="curPage" id="endPage" value="${paging.totalPage }"></li>
		</c:if>
	</ul>
</div>