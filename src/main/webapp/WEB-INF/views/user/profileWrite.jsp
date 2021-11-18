<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<style>
.profile {
	width:100%;
	height: 100%;
	oject-fit:cover;
}
.infoTable{
	margin: 0 auto;
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
async function checkEmailExist() {
	console.log("이메일 중복 검사");
	
	var email = $("#email");
	
	if (checkEmail() == false) {
		console.log("유효하지 않은 이메일형식");
		return false;
	}
	
	try {
		const result = await ajaxPost('/user/check/email', {email: email.val()});
		
		if (result === false) {
			//중복되는 이메일 없음
			console.log("사용가능한 이메일");
			
			email.removeClass("is-invalid");
			email.addClass("is-valid");
			
			$("#valid-email").css("display", "inline");
			$("#emailChk").css("display", "none");
			$("#emailError").css("display", "none");
			
			//이메일 체크 패스
			return true;
		} else {
			console.log("이미 존재하는 이메일");
			// 중복되는 이메일 있음
			email.removeClass("is-valid");
			email.addClass("is-invalid");
			
			$("#valid-email").css("display", "none");
			$("#emailChk").css("display", "none");
			$("#emailError").css("display", "inline");			
			//이메일 체크 패스못함
			return false;
		}
	} catch (e) {
		console.log("에러")
		console.log(e);
		alert("에러가 발생했습니다.");
	}
}

//닉네임 공백 검사
function checkNick() {
	console.log("닉네임 공백 검사")
	
	var nick = $("#nick");
	var pattern = /\s/g;
	
	if (nick.val() == "") {
		console.log("닉네임 공백")
		
		nick.addClass("is-invalid");
		nick.removeClass("is-valid");
		
		$("#valid-email").css("display", "none");
		$("#nickError").css("display", "none");
		$("#nickChk").css("display", "inline");
		
		return false;
		
	}else if(nick.val().match(pattern)){
		console.log("스페이스바는 문자로 취급되지 않습니다.")
		
		nick.addClass("is-invalid");
		nick.removeClass("is-valid");
		
		$("#valid-email").css("display", "none");
		$("#nickError").css("display", "none");
		$("#nickChk").css("display", "inline");
		
		return false;
		
	}else {
		console.log("유효한 닉네임 형식");
		
		nick.addClass("is-valid");
		nick.removeClass("is-invalid");
		
		$("#valid-email").css("display", "none");
		$("#nickError").css("display", "none");
		$("#nickChk").css("display", "none");
		
		return true;
	}
}

//닉네임 중복 검사
async function checkNickExist() {
	console.log("닉네임 중복검사");
	
	var nick = $("#nick");
	
	if (checkNick() == false) {
		console.log("닉네임 공백이거나 공백문자")
		return;
	}
	
	try {
		const result = await ajaxPost('/user/check/nick', {nick: nick.val()});
		
		if (result === false) {
			console.log("중복 없음")
			//중복되는 닉네임 없음
			nick.removeClass("is-invalid");
			nick.addClass("is-valid");
			
			$("#nickError").css("display", "none");
			$("#nickChk").css("display", "none");
			$("#valid-nick").css("display", "inline");
			
			//닉네임 체크 패스
			return true;
		} else {
			console.log("닉네임 중복")
			// 중복되는 닉네임 있음
			nick.removeClass("is-valid");
			nick.addClass("is-invalid");
			
			$("#nickError").css("display", "inline");
			$("#nickChk").css("display", "none");
			$("#valid-nick").css("display", "none");
			
			//이메일 체크 패스못함
			return false;
		}
	} catch (e) {
		console.log(e);
		alert("에러가 발생했습니다.");
	}
}
function telValidator() {
	console.log("전화번호 검사")
    var phone = $("#phone")
    
    if (/^[0-1]{3}-[0-9]{4}-[0-9]{4}/.test(phone.val())) {
    	console.log("유효한 전화번호 형식")
    	
    	phone.addClass("is-valid");
    	phone.removeClass("is-invalid");
    	
    	$("#phoneChk").css("display", "none");
		$("#valid-phone").css("display", "inline");
		
        return true;
    }
	console.log("유효하지 않은 전화번호 형식")
    $("#phoneChk").css("display", "inline");
	$("#valid-phone").css("display", "none");
	
    return false;
}

//생일 공백 검사
function checkBirth(birth) {
	console.log("생일 공백 검사")

	var pattern = /\s/g;// 스페이스바 거르기
	
	if (birth.val() == "") {
		console.log("생일 공백");
		birth.addClass("is-invalid");
		birth.removeClass("is-valid");
		
		$("#birthChk").css("display", "inline");
		$("#valid-birth").css("display", "none");
		
		return false;
		
	} else if(birth.val().match(pattern)){
		console.log("생일 형식이 공백 문자")
		
		birth.addClass("is-invalid");
		birth.removeClass("is-valid");
		
		$("#valid-birth").css("display", "none");
		$("#birthChk").css("display", "inline");
		
		return false;
		
	} else {
		console.log("유효한 생일 형식")
		birth.addClass("is-valid");
		birth.removeClass("is-invalid");
		
		$("#birthChk").css("display", "none");
		$("#valid-birth").css("display", "inline");		
		
		return true;
	}
}

$(document).ready(function(){
	$.datepicker.setDefaults({
        dateFormat: 'yy-mm-dd',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '년',
        changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
        yearRange: 'c-100:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
        showButtonPanel: true, // 캘린더 하단에 버튼 패널을 표시한다. 
        currentText: '오늘 날짜' , // 오늘 날짜로 이동하는 버튼 패널
        closeText: '닫기'  // 닫기 버튼 패널
    });
	//아이디 중복체크
	$("#id").blur(function() {
		checkIdExist();
	})
	
	//닉네임 중복체크
	$("#nick").blur(function() {
		checkNickExist();
	})
	
	//이메일 중복체크
	$("#mail").blur(function() {
		checkEmailExist();
	})
	$("#birth").focus(function() {
        $("#birth").datepicker();
    });
    
	function birthCheck(obj){
		checkBirth(obj);
	}
	$("#phone").blur(function(){
		telValidator();
	})
})
</script>
<hr>
<form action="/user/profile/update" method="post" enctype="multipart/form-data">
<table class="infoTable">
<tr>
	<td><label for="file">파일을 선택해주세요</label><input type="file"></td>
</tr>
<tr>
	<td class="info">이메일  </td>
	<td class="info"><input name="email" placeholder="ex) asdf1234@gmail.com"><td>
</tr>
<tr>
	<td class="info">닉네임  </td>
	<td class="info"><input type="text" id="nick" name="nick" placeholder="닉네임을 입력해 주세요"><td>
</tr>
<tr>
	<td class="info">전화번호  </td>
	<td class="info"><input type="text" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');" maxlength='13' id="phone" name="phone" placeholder="'-'포함한 13자리 입력"><td>
</tr>
<tr>
	<td class="info">생일  </td>
	<td class="info"><input type="text" id="birth" name="birthDate" placeholder="birth" onchage=birthCheck(this)><td>
</tr>
<tr>
	<td class="info">생성일  </td>
	<td class="info">&nbsp;&nbsp;<fmt:formatDate value="${user.createDate }" pattern="yyyy년 MM월 dd일"/><td>
</tr>
<tr>
	<td class="info">성별</td>
	<td class="info"><input type="radio" name="gender" id="female" value="F"><label for="female">여성</label></td>
	<td class="info"><input type="radio" name="gender" id="male" value="M"><label for="male">남성</label></td>
</tr>
</table>
</form>
<hr>