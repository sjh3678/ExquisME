<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.imgBox {
	width:150px;
	height:150px;
	border-radius:70%;
	overflow:hidden;
	margin: 0 auto;
	margin: 0 auto;
}
.profile {
	width:100%;
	height: 100%;
	oject-fit:cover;
}
.info{
	margin: 0 auto;
}
</style>
<hr>
<div class="imgBox">
	<img class="profile" src="/resources/img/profile/${file.originName}">
</div>
<br><br>
<table class="info">
<tr>
	<td>이메일  </td>
	<td>&nbsp;&nbsp;${user.email }<td>
</tr>
<tr>
	<td>닉네임  </td>
	<td>&nbsp;&nbsp;${user.nick }<td>
</tr>
<tr>
	<td>전화번호  </td>
	<td>&nbsp;&nbsp;${user.phone }<td>
</tr>
<tr>
	<td>생일  </td>
	<td>&nbsp;&nbsp;<fmt:formatDate value="${user.birth }" pattern="yyyy년 MM월 dd일"/><td>
</tr>
<tr>
	<td>생성일  </td>
	<td>&nbsp;&nbsp;<fmt:formatDate value="${user.createDate }" pattern="yyyy년 MM월 dd일"/><td>
</tr>
<tr>
	<td>성별</td>
	<c:if test="${user.gender eq 'F' }">
		<td>&nbsp;&nbsp;여성<td>
	</c:if>
	<c:if test="${user.gender eq 'M' }">
		<td>&nbsp;&nbsp;남성<td>
	</c:if>
</tr>
</table>
<hr>