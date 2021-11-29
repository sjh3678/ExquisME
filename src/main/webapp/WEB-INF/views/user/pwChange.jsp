<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
.pw{
	margin:0 auto;
}
input{
	width:300px;
}
.error{
	color:red;
}
.valid{
	color:green;
}
.feedback{
	display:none;
}
</style>
<script type="text/javascript">

async function ajaxPost(url, data) {
	return new Promise((resolve, reject) => {
		$.ajax({
			type: 'post',
			url: url,
			dataType: 'json',
			data: data,
			success: (result) => {
				resolve(result);
			},
			error: (request,status,error) => {
				reject("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		})
	})
}

//비밀번호 유효성 / 공백 검사
function checkPw() {
	console.log("비밀번호 유효성 검사")
	
	var pw = $("#changePw1");

	const pwFormCheck = RegExp(/^[a-zA-Z0-9-_]{8,12}$/); // 대소문자 + 숫자 4~12자
	var pwWithoutNumber = pw.val().replace(/\D/g, ''); // 숫자만
	var pwWithoutString = pw.val().replace(/[0-9]/g, ''); // 문자열만
	
	if(!pwFormCheck.test(pw.val()) || pwWithoutNumber === "" || pwWithoutString === ""){
		console.log("유효하지않은 비밀번호 형식");
		
		pw.addClass("is-invalid"); // 오류
		pw.removeClass("is-valid"); // 정상
	
		$("#pw1Chk").css("display", "inline");
		$("#pw1Error").css("display", "none");
		$("#valid-pw1").css("display", "none");
		
		return false;
	}else if (pw.val() == "") {
		console.log(" 비밀번호 공백 ");
		
		pw.addClass("is-invalid");
		pw.removeClass("is-valid");
		
		$("#pw1Error").css("display", "none");
		$("#pw1Chk").css("display", "inline");
		$("#valid-pw1").css("display", "none");
		
		return false;
	} else {
		console.log(" 유효한 비밀번호 ");
		pw.addClass("is-valid");
		pw.removeClass("is-invalid");
		
		$("#pw1Error").css("display", "none");
		$("#pw1Chk").css("display", "none");
		$("#valid-pw1").css("display", "inline");
		
		return true;
	}
}

//비밀번호 확인 검사
function checkPw2() {
	console.log("비밀번호 확인 검사")
	var pw = $("#changePw1");
	var pwCheck = $("#changePw2");
	
	console.log("pw : ",pw);
	console.log("pwCheck : ", pwCheck);
	if (pw.val() != pwCheck.val()) {
		console.log("비밀번호 불일치")
		pwCheck.addClass("is-invalid");
		pwCheck.removeClass("is-valid");
		
		$("#pw2Error").css("display", "inline");
		$("#pw2Chk").css("display", "none");
		$("#valid-pw2").css("display", "none");
		
		return false;
		
	} else {
		if (pwCheck.val() == "") {
			console.log("비밀번호 확인 공백");
			
			pwCheck.removeClass("is-valid");
			pwCheck.removeClass("is-invalid");
				
			return false;
		} else {
			console.log("비밀번호 일치")
			pwCheck.removeClass("is-invalid");
			pwCheck.addClass("is-valid");
			
			$("#pw2Error").css("display", "none");
			$("#pw2Chk").css("display", "none");
			$("#valid-pw2").css("display", "inline");
			
			return true;
		}
	}
}
async function checkPwExist(){
	console.log("비밀번호 중복검사");
	var pw = $("#pw");
	if (checkPw() == false){
		console.log("유효하지 않은 형식")
		return false;
	}
	
	try {
		const result = await ajaxPost('/user/pw/check', {pw: pw.val()});
		console.log("중복 체크 결과 :",result);
		if (result === false) {
			//중복되는 비밀번호 없음
			console.log("사용가능한 비밀번호");
			
			email.removeClass("is-invalid");
			email.addClass("is-valid");
			
			$("#valid-pw1").css("display", "inline");
			$("#pw1Chk").css("display", "none");
			$("#pw1Error").css("display", "none");
			
			//비밀번호 체크 패스
			return true;
		} else {
			console.log("이미 존재하는 비밀번호");
			// 기존값과 일치
			pw.removeClass("is-valid");
			pw.addClass("is-invalid");
			
			$("#valid-pw1").css("display", "none");
			$("#pw1Chk").css("display", "none");
			$("#pw1Error").css("display", "inline");			
			//비밀번호 체크 패스못함
			return false;
		}
	} catch (e) {
		console.log("에러")
		console.log(e);
		alert("에러가 발생했습니다.");
	}
}
async function check(){
	var isCheck = true;
	if (await checkPwExist() == false){
		console.log("유효하지 않은 형식")
		isCheck = false;
	}
	
	if (checkPw2() == false){
		console.log("유효하지 않은 형식")
		isCheck = false;
	}
	return isCheck;
}
async function submit(){
	
	if(await check() == ture){
		var pw = $("#changePw1");
		var pwChk = $("#changePw2");
		$.ajax({
			type: "post",
			url: "/user/pw/update",
			data: {pw:pw.val(), pwChk:pwChk.val()},
			dataType: "json",
			success: function(res){
				console.log("결과값 : ", res);
				if(res == false){
					alert("비밀번호가 변경 실패했습니다.")
				}else{
					alert("비밀번호가 변경되었습니다.");
					$(location).attr('href', '/user/mypage');						
				}
			}, error: function(e){
				console.log(e);
			}
	
		})

	}else{
		alert("비밀번호 형식을 다시 확인해 주세요")
	}
}
$(document).ready(function(){
	$("#changePw1").blur(function(){
		checkPwExist();
	})
	$("#changePw2").blur(function(){
		checkPw2();
	})
	$("#sendBtn").click(function(){
		var isCheck = true;
		submit();
		
	})
})

</script>
<style>
label{
	font-weight: 300;
}
span{
	font-size: 12px;
}
.btnProfile{
	background: #8A7E6B;
	color: #ECE6CC;
	vertical-align: middle;
}
.btnProfile:hover{
	background: #35312B;
}
</style>
<div class="changeArea">
<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<table class="pw">
<tr>
	<td><label for="changePw1">변경할 비밀번호</label></td>
	<td><input style="margin:5px;" class="form-control" type="password" id="changePw1" name="changePw1" placeholder="8~12자리의 대/소문자+숫자 조합"></td>
</tr>
<tr>
	<td> </td>
	<td id="pw1Chk" class="error feedback"><span>비밀번호는 영문 대소문자와 숫자 8~12자리로 입력해야합니다.</span></td>
	<td id="pw1Error" class="error feedback"><span>비밀번호가 기존값과 일치합니다.</span></td>
	<td id="valid-pw1" class="valid feedback"><span>사용가능한 비밀번호입니다.</span></td>
</tr>
<tr>
	<td><label for="changePw2">비밀번호 확인</label></td>
	<td><input style="margin:5px;" class="form-control" type="password" id="changePw2" name="changePw2" placeholder="8~12자리의 대/소문자+숫자 조합"></td>
	<td><button style="margin:5px;" class="btn btnProfile" id="sendBtn" style="width:100%;">변경</button></td>
</tr>
<tr>
	<td> </td>
	<td id="pw2Chk" class="error feedback"><span>비밀번호는 영문 대소문자와 숫자 8~12자리로 입력해야합니다.</span></td>
	<td id="pw2Error" class="error feedback"><span>비밀번호가 일치하지 않습니다.</span></td>
	<td id="valid-pw2" class="valid feedback"><span>사용가능한 비밀번호입니다.</span></td>
</tr>
</table>

</div>