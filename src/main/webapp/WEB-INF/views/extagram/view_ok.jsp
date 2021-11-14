<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div style="border: 1px solid #ddd; height: 37px;">

	<c:if test="${not login }">
		<input type="text" placeholder="로그인이 필요합니다." readonly="readonly" style="width: 470px; height: 34px; border: none;"/>
		<button onclick='location.href="/user/login";' class="btn pull-right">LOGIN</button>
	</c:if>
	
	<c:if test="${login }">
	<div class="form-inline text-center">
	<form action="/extagram/view?exNo=${viewExta.EX_NO }" method="post">
		<input type="text" id="commentContent" name="exComm" placeholder="댓글" style="width: 475px; height: 34px; border: none;"/>
		<input type="hidden" name="exPostNo" value="${viewExta.EX_NO }" />
		<button id="btnComInsert" class="btn pull-right">POST</button>
	</form>
	</div>
	</c:if>
</div>



