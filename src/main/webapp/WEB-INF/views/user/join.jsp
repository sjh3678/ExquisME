<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<c:import url="/WEB-INF/views/layout/header.jsp"/>
<script type="text/javascript">
$(document).ready(function(){
	$("#joinBtn").click(function(){
		console.log("#joinBtn clicked");
		$("form").submit();
	})
})
</script>
<div class="container">
<div class="text-center" id="pageName">
<h1><span id="agree">약관 동의</span> <i class="fas fa-angle-right"></i> <span id="info">정보 입력</span> <i class="fas fa-angle-right"></i> <span id="sms">메일 인증</span></h1>
<hr>
</div>
<form action="/user/join" method="post">
<div class="form-group">
    <label for="id" class="col-xs-3 control-label">아이디 </label>
    <div class="col-xs-6">
      <input type="text" class="form-control" id="id" name="id" placeholder="Id">
    </div>
</div>
<div class="form-group">
    <label for="pw" class="col-xs-3 control-label">비밀번호 </label>
    <div class="col-xs-6">
      <input type="password" class="form-control" id="pw" name="pw" placeholder="Password">
    </div>
</div>
<div class="form-group">
    <label for="pw" class="col-xs-3 control-label">비밀번호 확인 </label>
    <div class="col-xs-6">
      <input type="password" class="form-control" id="pw" name="pw" placeholder="Password">
    </div>
</div>

<div class="form-group">
    <label for="nick" class="col-xs-3 control-label">닉네임 </label>
    <div class="col-xs-6">
      <input type="text" class="form-control" id="nick" name="nick" placeholder="nick">
    </div>
</div>

<div class="form-group">
    <label for="nick" class="col-xs-3 control-label">전화번호 </label>
    <div class="col-xs-6">
      <input type="text" class="form-control" id="phone" name="phone" placeholder="phone">
    </div>
</div>

<div class="text-center" id="btnArea"> 
   <button class="btn btn-primary form-control" type="button" id="loginBtn">가입</button><br>
    <button class="btn btn-primary form-control" type="button" id="cancleBtn">취소</button><br><br>
</div>

</form>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>