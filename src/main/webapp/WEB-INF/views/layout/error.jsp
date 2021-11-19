<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	setTimeout(function() {
		alert('확인을 누르시면 로그인 페이지로 이동합니다')
		location.href = "/user/login"
	}, 3100)
	
	var i = 3;
	setInterval(function() {
		$("#time").text(--i);
	}, 1000)
})
</script>

<div class="container">

<h1 style="color:red;">로그인 에러 페이지</h1>
<hr>

현재 접근 시도한 페이지는 로그인 후 이용할 수 있습니다<br>

<span id="time">3</span>초후 로그인화면으로 이동합니다...

</div><!-- .container -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />