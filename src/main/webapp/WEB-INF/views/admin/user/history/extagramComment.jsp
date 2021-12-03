<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />


<div class="container">

<img class="user_img" style="clip-path: circle(50% at 50% 50%); width:150px; height:150px; display: block; margin: auto;"
					src="/upload/${file.storedName }">
					<br>


<h1 style="text-align: center;"> ${user.nick } 님의 Extagram 댓글</h1>
<hr>
<div style="text-align: center;">
<a href="/admin/user/list"><button class="btn">user list</button></a>
<a href="/admin/user/history/extagram?userNo=${user.userNo }"><button class="btn">extagram</button></a>
<a href="/admin/user/history/extagramComment?userNo=${user.userNo }"><button class="btn">extagram comment</button></a>
<a href="/admin/user/history/layer?userNo=${user.userNo }"><button class="btn">layering</button></a>
</div>
<br>
<table class="table table-striped table-hover">
<thead>
	<tr>		
		<th style="width: 10%; text-align: center;">Exta번호</th>
		<th style="width: 10%; text-align: center;">Exta작성자</th>
		<th style="width: 50%; text-align: center;">댓글 내용</th>
		<th style="width: 10%; text-align: center;">작성일</th>
		<th style="width: 10%; text-align: center;">상세보기</th>
		<th style="width: 10%; text-align: center;">삭제</th>
		
	</tr>
</thead>
<tbody>
<c:forEach items="${extaCommList }" var="list">
	<tr>
		<td style="text-align: center;">${list.EX_POST_NO }</td>
		<td style="text-align: center;">${list.POSTOWNER }</td>
		<td style="text-align: center;"><c:out value="${list.EX_COMM }"/></td>
		<td style="text-align: center;">${list.EX_COMM_DATE }</td>
		<td style="text-align: center;"><a href="/extagram/view?exNo=${list.EX_POST_NO }"><button class="btn">상세보기</button></a></td>
		<td style="text-align: center;"><a href="/admin/user/history/extagramComment/delete?exCommNo=${list.EX_COMM_NO }&userNo=${list.USER_NO }" onclick="return confirm('댓글을 삭제하시겠습니까? 삭제된 댓글은 원상복구 할 수 없습니다.');"><button class="btn">댓글 삭제</button></a></td>
	</tr>	
</c:forEach>
</tbody>
</table>

<c:import url="/WEB-INF/views/layout/paging3.jsp" />
</div><%-- .container --%>
<c:import url="/WEB-INF/views/layout/footer.jsp" />