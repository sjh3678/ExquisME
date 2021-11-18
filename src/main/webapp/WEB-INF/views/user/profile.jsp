<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
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
.infoTable{
	margin: 0 auto;
}
.info{
	font-size:15px;
}
</style>
<hr>
<div class="imgBox">
	<img class="profile" src="/resources/img/profile/${file.originName}">
</div>
<br><br>
<table class="infoTable">
<tr>
	<td class="info">이메일  </td>
	<td class="info">&nbsp;&nbsp;${user.email }<td>
</tr>
<tr>
	<td class="info">닉네임  </td>
	<td class="info">&nbsp;&nbsp;${user.nick }<td>
</tr>
<tr>
	<td class="info">전화번호  </td>
	<td class="info">&nbsp;&nbsp;${user.phone }<td>
</tr>
<tr>
	<td class="info">생일  </td>
	<td class="info">&nbsp;&nbsp;<fmt:formatDate value="${user.birth }" pattern="yyyy년 MM월 dd일"/><td>
</tr>
<tr>
	<td class="info">생성일  </td>
	<td class="info">&nbsp;&nbsp;<fmt:formatDate value="${user.createDate }" pattern="yyyy년 MM월 dd일"/><td>
</tr>
<tr>
	<td class="info">성별</td>
	<c:if test="${user.gender eq 'F' }">
		<td class="info">&nbsp;&nbsp;<i class="fas fa-venus"></i><td>
	</c:if>
	<c:if test="${user.gender eq 'M' }">
		<td class="info">&nbsp;&nbsp;<i class="fas fa-mars"></i><td>
	</c:if>
</tr>
</table>
<hr>