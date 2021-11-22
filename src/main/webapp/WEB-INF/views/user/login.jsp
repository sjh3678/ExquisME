<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<c:import url="/WEB-INF/views/layout/header.jsp"/>
<script type="text/javascript">
$(document).ready(function(){
	$("#loginBtn").click(function(){
		var formData = $("form").serialize();
		console.log("#loginBtn clicked");
		$.ajax({
			type: 'post',
			url: '/user/login',
			dataType: 'text',
			data: formData,
			success: function(result) {
				console.log(result);
				// 회원가입 성공
				if (result == "true") {
					console.log("로그인 성공")
					alert("로그인 성공", result);
					$(location).attr("href", "/user/main");
					return true;
				} else {
					alert("로그인 실패");
					console.log("로그인 실패")
					return false;
				}
			},
			error: function(xhr, status, error) {
				console.log(xhr, status, error);
			}
		})
	})
	$("#serchIdPw").click(function(){
		$(".login-form").addClass("invisible");
		$(".searchArea").removeClass("invisible");
	})
	$("#into-login").click(function(){
		$(".login-form").removeClass("invisible");
		$(".searchArea").addClass("invisible");
	})
})
</script>
<style type="text/css">
label {
	font-size:1.5em;
}
#btnArea{
	margin: 0 auto;
    width: 50%;
}
.invisible{
	display: none;
}

.searchArea{
	width:100%;
	
	.
}
.searchIdArea{
	float:left;
	width:48%;
	height: 80%;
	background: yellow;
}
.searchPwArea{
	float:right;
	width:48%;
	height: 80%;
	background: red;
}
</style>
<div class="container">
<div class="text-center" id="pageName">
<h1>로그인 페이지</h1>
<hr>
</div>
<form action="/user/login" method="post" class="form-horizontal login-form">
<div class="form-group">
    <label for="id" class="col-xs-3 control-label">아이디 </label>
    <div class="col-xs-6">
      <input type="text" class="form-control" id="id" name="id" placeholder="Id">
    </div>
</div>
<div class="form-group">
    <label for="pw" class="col-xs-3 control-label">패스워드 </label>
    <div class="col-xs-6">
      <input type="password" class="form-control" id="pw" name="pw" placeholder="Password">
    </div>
</div>
<div class="text-center">
<label id="serchIdPw">아이디 / 비밀번호 찾기 </label>
</div>
<div class="text-center" id="btnArea"> 
   <button class="btn btn-primary form-control" type="button" id="loginBtn">로그인</button><br><br>
   <button class="btn btn-primary form-control" type="button" id="google"><i class="fab fa-google"></i>&nbsp;&nbsp;구글 로그인</button><br><br>
   <button class="btn btn-warning form-control" type="button" id="kakao">카카오 로그인</button><br><br>
   <button class="btn btn-success form-control" type="button" id="naver">네이버 로그인</button><br><br>
</div>
</form>

<div class="searchArea invisible text-center">
왼쪽
<div class="searhIdArea">
</div>

<div class="searchPwArea">
오른쪽
</div>

<button id="into-login">로그인으로</button>
</div>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>