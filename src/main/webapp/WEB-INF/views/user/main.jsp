<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp"/>
<script type="text/javascript">
$(document).ready(function(){
	$("#login").click(function(){
		console.log("#login clicked")
		$(location).attr("href", "/user/login")
	})
	$("#logout").click(function(){
		console.log("#logout clicked")
		alert('로그아웃 되셨습니다.');
		$(location).attr("href", "/user/logout")
	})
	$("#join").click(function(){
		console.log("#join clicked")
		$(location).attr("href", "/user/join")
	})
	$("#boardList").click(function(){
		console.log("#login clicked")
		$(location).attr("href", "/board/list")
	})
})

</script>
<div class="container text-center">
<h3>메인 페이지</h3>
<hr>
<c:if test="${empty login }">
<button id="login">로그인</button><br>
<button id="join">회원가입</button><br>
</c:if>

<c:if test="${not empty login }">
<label>${nick }님 환영합니다.</label><br>
<!-- <button id="mypage">마이페이지</button><br> -->
<button id="logout">로그아웃</button><br>
</c:if>

<button id="boardList">게시글 목록</button><br>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>