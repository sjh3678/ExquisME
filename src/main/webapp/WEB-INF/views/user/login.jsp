<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">


<c:import url="/WEB-INF/views/layout/header.jsp"/>

<script type="text/javascript">

function visible(i){
	if(i == 1){
		$(".login-form").addClass("invisible");
		$(".searchArea").removeClass("invisible");
		$("#pageName1").addClass("invisible");
		$("#pageName2").removeClass("invisible");
	}else{
		$(".login-form").removeClass("invisible");
		$(".searchArea").addClass("invisible");
		$("#pageName1").removeClass("invisible");
		$("#pageName2").addClass("invisible");
	}
}
function f_enterLogin(){
	if(window.event.keyCode == 13){
		$("#loginBtn").click();
	}
}

$(document).ready(function(){
	$("#loginBtn").click(function(){
		var formData = $(".login-form").serialize();
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
		console.log("serchIdPw clicked")
		visible(1);
	})
	
	$("#searchIdBtn").click(function(){
		var searchID = $("#searchId-form").serialize();
		$.ajax({
			type: "post",
			url: "/user/search/id",
			data: searchID,
			dataType: "text",
			success: function(res){
				if(res){
					alert("작성하신 메일을 통해 아이디 정보가 전달되었습니다.")
					$(location).attr("href", "/user/login");
				}else{
					alert("조회결과가 없습니다. 다시 확인해주세요.");
				}
			},
			error: function(e){
				console.log(e);
			}
			
		})
	})
	
	$("#searchPwBtn").click(function(){
		var searchPW = $("#searchPw-form").serialize();
		$.ajax({
			type: "post",
			url: "/user/search/pw",
			data: searchPW,
			dataType: "text",
			success: function(res){
				if(res){
					alert("작성하신 메일을 통해 임시 비밀번호가 전달되었습니다.")
					$(location).attr("href", "/user/login");
				}else{
					alert("조회결과가 없습니다. 다시 확인해주세요.");
				}
			},
			error: function(e){
				console.log(e);
				alert("조회결과가 없습니다. 다시 확인해주세요.");
			}
			
		})
	})
	
	$("#into-login").click(function(){
		console.log("into-login clicked")
		visible(2);
	})
	$("#kakao").click(function(){
		console.log("카카오 로그인")
		kakaoLogin();
		console.log("로그인 이후")
	})
})
</script>
<style type="text/css">
.valid{
	color:green;
}
.error{
	color:red;
}
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
}
.searchIdArea{
	float:left;
	width:48%;
	height: 80%;
	border-radius: 2em;
}
.searchPwArea{
	float:right;
	width:48%;
	height: 80%;
	border-radius: 2em;
}
.inputArea{
	background-color: #ECE6CC;
	width: 100%;
	height: 80%;
}
.button {
	background-color: #036bfc;
	color: white;
	border-radius: 8px;
}
.form-write{
	width:300px;
	margin: 0 auto;
}
.form-label{
	margin-left: 110px;
}
.top{
	margin-top:80px;
}
</style>
<div class="container">
<div class="text-center" id="pageName1">
<h1>로그인 페이지</h1>
<hr>
</div>
<div class="text-center invisible" id="pageName2">
<h1>아이디 / 비밀번호 찾기</h1>
<hr>
</div>
<form action="/user/login" method="post" class="form-horizontal login-form">
<div class="form-group">
    <label for="id" class="col-xs-3 control-label">아이디 </label>
    <div class="col-xs-6">
      <input type="text" class="form-control" onkeyup="f_enterLogin()" id="id" name="id" placeholder="Id">
    </div>
</div>
<div class="form-group">
    <label for="pw" class="col-xs-3 control-label">패스워드 </label>
    <div class="col-xs-6">
      <input type="password" class="form-control" onkeyup="f_enterLogin()" id="pw" name="pw" placeholder="Password">
    </div>
</div>
<div class="text-center">
<label id="serchIdPw">아이디 / 비밀번호 찾기 </label>
</div>
<div class="text-center" id="btnArea"> 
   <button class="button form-control" type="button" id="loginBtn">로그인</button><br><br>
   <button class="btn btn-primary form-control" type="button" id="google"><i class="fab fa-google"></i>&nbsp;&nbsp;구글 로그인</button><br><br>
   <button class="btn btn-warning form-control" type="button" id="kakao">카카오 로그인</button><br><br>
   <button class="btn btn-success form-control" type="button" id="naver">네이버 로그인</button><br><br>
</div>
</form>

<div class="searchArea invisible text-center">

<div class="searchIdArea">
<div class="text-center">
<label >아이디 찾기</label>
</div>
<div class="inputArea text-left">
<form action="user/serach/id" method="post" id="searchId-form">
<label for="email" class="form-label top">이메일</label>
<input type="text" name="email" id= "email" class="form-control form-write"/>
<br>
<label for="questionNo1" class="form-label">자주 찾는 질문</label>

<select id="questionNo1" name="questionNo" class="form-control form-write">
      <option value="1">내가 좋아하는 캐릭터(인물)는?</option>
      <option value="2">다시 태어나면 되고 싶은 것은?</option>
      <option value="3">가장 감명깊게 본 영화는?</option>
      <option value="4">자신의 보물 1호는?</option>
      <option value="5">받았던 선물중에 가장 기억에 남는 선물은?</option>
      <option value="6">읽은 책 중에서 가장 좋아하는 구절은?</option>
</select>
<input type="text" class="form-control form-write" id="questionAnwser1" name="questionAnwser" placeholder="질문에 답을 입력해주세요"> 
<br>
<button type="button" id="searchIdBtn" class="form-label button">아이디 찾기</button>
</form>
</div>
</div>

<div class="searchPwArea">
<div class="text-center">
<label class="form-label">비밀번호 찾기</label>
</div>

<div class="inputArea text-left">
<form action="/user/serach/pw" method="post" id="searchPw-form">
<label for="searchId" class="form-label top">아이디</label>
<input type="text" name="id" id="searchId" class="form-control form-write"/>
<span id="idChk" class="error invisible">아이디는 영문 대소문자와 숫자 4~12자리로 입력해야합니다.<br></span>
<span id="idError" class="error invisible">이미 존재하는 아이디입니다.<br></span>
<span id="valid-id" class="valid invisible">사용가능한 아이디입니다.<br></span>
<br>
<label for="email" class="form-label">이메일</label>
<input type="text" name="email" id="send-email" class="form-control form-write"/>
<br>
<label for="questionNo2" class="form-label">자주 찾는 질문</label>
<select id="questionNo2" name="questionNo" class="form-control form-write">
      <option value="1">내가 좋아하는 캐릭터(인물)는?</option>
      <option value="2">다시 태어나면 되고 싶은 것은?</option>
      <option value="3">가장 감명깊게 본 영화는?</option>
      <option value="4">자신의 보물 1호는?</option>
      <option value="5">받았던 선물중에 가장 기억에 남는 선물은?</option>
      <option value="6">읽은 책 중에서 가장 좋아하는 구절은?</option>
</select>
<input type="text" class="form-control form-write" id="questionAnwser2" name="questionAnwser" placeholder="질문에 답을 입력해주세요"> 
<br>
<button type="button" id="searchPwBtn" class="form-label button">비밀번호 찾기</button>
</form>

<!-- 소셜 로그인 / 가입 폼 반환 -->
<form action="/user/social/join" method="post" id="kakaoLogin">
<input type="hidden" name="email" id="kakao-email">
<input type="hidden" name="nick" id="kakao-nick">
</form>
</div>
</div>

<button id="into-login" >로그인으로</button>
</div>
</div>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script type="text/javascript">

Kakao.init('00f8f4b7d54645c5187733d7b8196c4f'); //발급받은 키 중 javascript키를 사용해준다.

//카카오로그인
function kakaoLogin() {
	console.log("카카오 로그인 시작");
	
	Kakao.Auth.login({
		scope:'profile_nickname, account_email',
		success: function(authObj){
			console.log("접속 성공");
			console.log(authObj);
			Kakao.API.request({
				url:'/v2/user/me',
				success: res=>{
					console.log("파라미터 확인");
					const email = res.kakao_account.email;
					const name = res.properties.nickname;
					
					console.log(email);
					console.log(name);
					
					$("#kakao-email").val(email);
					$("#kakao-nick").val(name);
					$("#kakaoLogin").submit();
				}, fail: error=>{
					console.log(error)
				}
			});	
		}, fail: function(error){
			console.log(error);
		}
  		
	});
console.log("카카오 로그인 종료");
}
</script>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>