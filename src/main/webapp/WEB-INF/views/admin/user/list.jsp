<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />


<div class="container">
<h1>회원 리스트</h1>
<hr>
<div style="text-align: center;">
<form action="/admin/user/list" method="get">
<input type="text" name="search"><button>검색</button>
</form>
</div>
<br>
<table class="table table-striped table-hover">
<thead>
	<tr>
		<th style="width: 15%; text-align: center;">프로필사진</th>
		<th style="width: 15%; text-align: center;">아이디</th>
		<th style="width: 15%; text-align: center;">닉네임</th>
		<th style="width: 15%; text-align: center;">이메일</th>
		<th style="width: 15%; text-align: center;">전화번호</th>
		<th style="width: 7%; text-align: center;">성별</th>
		<th style="width: 7%; text-align: center;">등급</th>
		<th style="width: 11%; text-align: center;">관리</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list }" var="user">
	<tr>
		<td style="text-align: center;"><img class="user_img" style="width:50px; height:50px; display: block; margin: auto;"
					src="/upload/${user.STORED_NAME }"></td>
		<td style="text-align: center;">${user.ID }</td>
		<td style="text-align: center;">${user.NICK }</td>
		<td style="text-align: center;">${user.EMAIL }</td>
		<td style="text-align: center;">${user.PHONE }</td>
		<td style="text-align: center;">${user.GENDER }</td>
		<td style="text-align: center;">${user.IS_ADMIN }</td>
		<td style="text-align: center;"><a href="/admin/user/delete?userNo=${user.USER_NO }" onclick="return confirm('회원을 삭제하시겠습니까? 삭제된 회원은 원상복구 할 수 없습니다.');"><button id="btnDelete">회원 삭제</button></a></td>
	</tr>	
</c:forEach>
</tbody>
</table>

<c:import url="/WEB-INF/views/layout/paging.jsp" />
</div><%-- .container --%>
<c:import url="/WEB-INF/views/layout/footer.jsp" />