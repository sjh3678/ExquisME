<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<c:import url="/WEB-INF/views/layout/header.jsp"/>
<script type="text/javascript">
$(document).ready(function(){
	$("#profile").click(function(){
		$.ajax({
			type:"post"
			, data: {}
			, dataType: "html"
		});
	})
})
</script>
<style type="text/css">
#leftArea {
	float: left;
	width: 30%;
	height: 100%;
}
#rightArea {
	float: right;
	width: 68%;
	height: 100%;
}

</style>
<div class="container">
<div class="text-center">
<h1>마이페이지</h1>
<hr>
<div id="leftArea">
<table class="table">
<tr>
	<td id="profile">프로필 수정</td>
</tr>
<tr>
	<td>개인 기록</td>
</tr>
<tr>
	<td>비밀번호 변경</td>
</tr>
<tr>
	<td>회원탈퇴</td>
</tr>
</table>

</div>

<div id="rightArea">

</div>

</div>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>