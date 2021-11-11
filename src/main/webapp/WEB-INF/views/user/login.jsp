<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<c:import url="/WEB-INF/views/layout/header.jsp"/>
<script type="text/javascript">
$(document).ready(function(){
	$("#loginBtn").click(function(){
		console.log("#loginBtn clicked");
		$("form").submit();
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
</style>
<div class="container">
<div class="text-center" id="pageName">
<h1>로그인 페이지</h1>
<hr>
</div>
<form action="/user/login" method="post" class="form-horizontal">
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
<div class="text-center" id="btnArea"> 
   <button class="btn btn-primary form-control" type="button" id="loginBtn">로그인</button><br><br>
   <button class="btn btn-primary form-control" type="button" id="google"><i class="fab fa-google"></i>&nbsp;&nbsp;구글 로그인</button><br><br>
   <button class="btn btn-warning form-control" type="button" id="kakao">카카오 로그인</button><br><br>
   <button class="btn btn-success form-control" type="button" id="naver">네이버 로그인</button><br><br>
</div>
</form>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>