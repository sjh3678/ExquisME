<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<c:import url="/WEB-INF/views/layout/header.jsp"/>

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
//아이디 유효성 검사
function checkId(){
	console.log("아이디 유효성 검사");
	var id = $("#id");
	
	const idFormCheck = RegExp(/^[a-zA-Z0-9-_]{4,30}$/);
	var idWithoutNumber = id.val().replace(/\D/g, '');
	var idWithoutString = id.val().replace(/[0-9]/g, '');
	var emailCheck = RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*[.][a-zA-Z]{2,3}$/);
	console.log(emailCheck.test(id.val()));
	if(!emailCheck.test(id.val())){
		//에러
		if(!idFormCheck.test(id.val()) || idWithoutNumber === "" || idWithoutString === ""){
			console.log("유효하지 않은 아이디 형식");
			
			id.addClass("is-invalid"); // 오류
			id.removeClass("is-valid"); // 정상
		
			$("#idChk").css("display", "inline");
			$("#idError").css("display", "none");
			$("#valid-id").css("display", "none");
		
			return false;
		}else {//정상
			console.log("유효한 아이디 형식");
	
			id.addClass("is-valid");
			id.removeClass("is-invalid");
		
			$("#idChk").css("display", "none");
			$("#idError").css("display", "none");
			
			return true;
		}
	}else{
		console.log("이메일 형식 아이디");
		
		id.addClass("is-valid");
		id.removeClass("is-invalid");
		
		$("#idChk").css("display", "none");
		$("#idError").css("display", "none");
		
		return true;
	}
}

//아이디 중복 검사
async function checkIdExist(){
	console.log("아이디 중복 검사")
	var id= $("#id");
	if(checkId() == false){
		return;
	}
	try{
		const result = await ajaxPost("/user/check/id", {id:id.val()});
		
		if(result === false){
			
			console.log("사용가능한 아이디");
			
			id.removeClass("is-invalid");
			id.addClass("is-invalid");
			
			$("#idChk").css("display", "none");
			$("#idError").css("display", "none");
			$("#valid-id").css("display", "inline");
			
			return true;
		}else{
			console.log("이미 존재하는 아이디")
			
			id.removeClass("is-valid");
			id.addClass("is-invalid");

			$("#idChk").css("display", "none");
			$("#idError").css("display", "inline");
			$("#valid-id").css("display", "none");
			
			return false;
		}
	}catch(e){
		console.log("ajax통신 실패");
		console.log(e);
		alert("에러 발생 이것이 보인다면 개발자는 또다시 갈립니다.");
	}
}

//이메일 유효성 검사
function checkEmail(){
	console.log("이메일 유효성 검사");
	
	var email = $("#email");
	var emailCheck = RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*[.][a-zA-Z]{2,3}$/);
	console.log(emailCheck.test(email.val()));
	if(emailCheck.test(email.val()) == false){
		console.log("유효하지 않은 이메일형식");
		
		email.addClass("is-invalid");
		email.removeClass("is-valid");
		
		$("#emailChk").css("display", "inline");
		$("#emailError").css("display", "none")
		
		return false;
	}else{
		console.log("유효한 이메일 형식");
		
		email.addClass("is-valid");
		email.remove("is-invalid");
		
		$("#emailChk").css("display", "none");
		$("#emailError").css("display","none");
		
		return true;
	}
}

async function checkEmailExist() {
	console.log("이메일 중복 검사");
	
	var email = $("#email");
	var regExp = /[<>\\]/gi; 
	if (checkEmail() == false) {
		console.log("유효하지 않은 이메일형식");
		return false;
	}
	if( regExp.test(email.val()) ){
		console.log("유효하지 않은 닉네임형식");
		
		$("#valid-email").css("display", "none");
		$("#nickError").css("display", "none");
		$("#nickChk").css("display", "inline");
		
		return;
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
	var regExp = /[<>\\]/gi; 
	if (nick.val() == "") {
		console.log("닉네임 공백")
		
		nick.addClass("is-invalid");
		nick.removeClass("is-valid");
		
		$("#valid-nick").css("display", "none");
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
			$("#sendMail").css("display", "inline");
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
			
			//닉네임 체크 패스못함
			return false;
		}
	} catch (e) {
		console.log(e);
		alert("에러가 발생했습니다.");
	}
}

//비밀번호 유효성 / 공백 검사
function checkPw() {
	console.log("비밀번호 유효성 검사")
	
	var pw = $("#pw");

	const pwFormCheck = RegExp(/^[a-zA-Z0-9-_]{8,30}$/); // 대소문자 + 숫자 4~12자
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
	var pw = $("#pw");
	var pwCheck = $("#pwCheck");
	
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
function checkBirth() {
	console.log("생일 공백 검사")

	var pattern = /\s/g;// 스페이스바 거르기
	var birth = $("#birth");
	
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

//질문 답 공백 검사
function checkAnswer() {
	console.log("질문 답 공백 검사")
	var regExp = /[<>\\]/gi; 
	var	answer = $("#questionAnwser");
	var pattern = /\s/g;// 스페이스바 거르기
	if( regExp.test(answer.val()) ){
		console.log("유효하지 않은 문답형식");
		
		$("#answerChk").css("display", "inline");
		$("#valid-answer").css("display", "none");
		
		return false;
	}else if (answer.val() == "") {
		console.log("답 공백");
		answer.addClass("is-invalid");
		answer.removeClass("is-valid");
		
		$("#answerChk").css("display", "inline");
		$("#valid-answer").css("display", "none");
		
		return false;
		
	} else if(answer.val().match(pattern)){
		console.log("공백문자");
		answer.addClass("is-invalid");
		answer.removeClass("is-valid");
		
		$("#valid-answer").css("display", "none");
		$("#answerChk").css("display", "inline");
		
		return false;
		
	}else{
		console.log("유효한 질문 답");
		$("#valid-answer").css("display", "inline");
		$("#answerChk").css("display", "none");
		
		return true;
	}
}

//가입 버튼 눌렀을 때
async function checked() {
	console.log("가입버튼 눌림");
	var isvalid = true;
	
	if (checkEmail() == false) isvalid = false;
	else if (await checkEmailExist() == false) isvalid = false;
 	else $("#valid-email").css("display", "inline");
	console.log(isvalid);
 	
	if (checkPw() == false) isvalid = false;
 	console.log(isvalid);
	
 	if (checkPw2() == false) isvalid = false;
	console.log(isvalid);
	
	if (checkNick() == false) isvalid = false;
	else if (await checkNickExist() == false) isvalid = false;
	else $("#valid-nick").css("display", "inline");
	console.log(isvalid);
	
	if (checkId() == false) isvalid = false;
 	else if (await checkIdExist() == false) isvalid = false;
	else $("#valid-id").css("display", "inline");
	console.log(isvalid);
	
	if (checkBirth() == false) isvalid = false;
	console.log(isvalid);
	
	if (checkAnswer() == false) isvalid = false;
	console.log(isvalid);
		
	return isvalid;
}

async function submit() {
	if (await checked() == true) {
		var formData = $("#join-form").serialize();
		$.ajax({
			type: 'post',
			url: '/user/join',
			dataType: 'text',
			data: formData,
			success: function(result) {
				// 회원가입 성공
				if (result == "true") {
					console.log("회원가입 성공")
					$(location).attr("href", "/user/login");
					return true;
				} else {
					console.log("회원가입 실패")
					return false;
				}
			},
			error: function(xhr, status, error) {
				console.log(xhr, status, error);
			}
		})
	}
}
</script>

<script type="text/javascript">
$(document).ready(function(){
	
	//날짜 선택기
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
        maxDate: 0, // 오늘 이후 날짜 선택 불가
        changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
        yearRange: 'c-100:c+0', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
        showButtonPanel: true, // 캘린더 하단에 버튼 패널을 표시한다. 
        currentText: '오늘 날짜' , // 오늘 날짜로 이동하는 버튼 패널
        closeText: '닫기'  // 닫기 버튼 패널
    });

    $("#phone").blur(function(){
		telValidator();
	})
	$("#id").blur(function(){
    	checkIdExist();
    })

    $("#nick").blur(function(){
    	checkNickExist();
    })
    
    $("#email").blur(function(){
    	checkEmailExist();
    }) 
    $("#pw").blur(function(){
    	checkPw();
    })
    
    $("#pwCheck").blur(function(){
    	checkPw2();
    })
    
    $("#questionAnwser").blur(function(){
    	checkAnswer();
    })
    $("#nextBtn").click(function(){
    	submit(); 	
    })
    $("#cancleBtn").click(function(){
    	$(location).attr("href", "/user/login");
    })
})
</script>

<script>
//특수문자(<, >, \) 입력 방지 네이버SE2에는 적용 안 되므로 글 내용 작성에는 영향 없음
function characterCheck(obj){
 	var regExp = /[<>\\]/gi; 
	if( regExp.test(obj.value) ){
		alert("일부 특수문자는 입력하실수 없습니다.");
		obj.value = obj.value.substring( 0 , obj.value.length - 1 );
	}
}
function f_datepicker(obj) {
	 $( obj ).datepicker().datepicker("show");
}
</script>
<style type="text/css">
.error{
	color:red;
}
.valid{
	color:green;
}
.feedback{
	display:none;
}
#ltitle{
	background: #ccc;
	color: #877b9e;
}
#questionNo {
    width: 200px;
    height: 30px;
}

#agree {
	color: black;
}

.form-control {
	width:500px;
}
</style>
<div class="container text-center">
<div class="text-center">
<h1>추가 정보 입력</h1>
<hr>
</div>

<form action="/user/join" method="post" id="join-form" class="form-horizontal">
<input type="hidden" name="isSocial" value="Y">
<label for="id" class="col-xs-3 control-label">아이디 </label>
<input type="text" class="form-control" id="id" name="id" value="${user.email }" placeholder="4~12자의 영문 대소문자와 숫자로만 입력">
<span id="idChk" class="error col-xs-offset-3 feedback">아이디는 영문 대소문자와 숫자 4~12자리로 입력해야합니다.</span>
<span id="idError" class="error col-xs-offset-3 feedback">이미 존재하는 아이디입니다.</span>
<span id="valid-id" class="valid col-xs-offset-3 feedback">사용가능한 아이디입니다.</span>
<br><br>

<label for="pw" class="col-xs-3 control-label ">비밀번호 </label>
<input type="password" class="form-control" id="pw" name="pw" placeholder="8~12자의 영문 대소문자와 숫자로만 입력">
<span id="pw1Chk" class="error col-xs-offset-3 feedback">비밀번호는 영문 대소문자와 숫자 8~12자리로 입력해야합니다.</span>
<span id="pw1Error" class="error col-xs-offset-3 feedback">비밀번호가 일치하지 않습니다.</span>
<span id="valid-pw1" class="valid col-xs-offset-3 feedback">사용가능한 비밀번호입니다.</span>
<br><br>

<label for="pwCheck" class="col-xs-3 control-label">비밀번호 확인 </label>
<input type="password" class="form-control" id="pwCheck" name="pwCheck" placeholder="8~12자의 영문 대소문자와 숫자로만 입력">
<span id="pw2Chk" class="error col-xs-offset-3 feedback">비밀번호는 영문 대소문자와 숫자 8~12자리로 입력해야합니다.</span>
<span id="pw2Error" class="error col-xs-offset-3 feedback">비밀번호가 일치하지 않습니다.</span>
<span id="valid-pw2" class="valid col-xs-offset-3 feedback">비밀번호가 일치합니다.</span>
<br><br>

<label for="nick" class="col-xs-3 control-label">닉네임 </label>
<input type="text" class="form-control" id="nick" onKeyup="characterCheck(this)" maxlength="8" name="nick" value="${user.nick }" placeholder="닉네임을 입력해 주세요">
<span id="nickChk" class="error col-xs-offset-3 feedback">닉네임을 입력해주세요</span>
<span id="nickError" class="error col-xs-offset-3 feedback">이미 존재하는 닉네임입니다.</span>
<span id="valid-nick" class="valid col-xs-offset-3 feedback">사용가능한 닉네임입니다.</span>
<br><br>

<label for="phone" class="col-xs-3 control-label">전화번호 </label>
<input type="text" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');" maxlength='13' class="form-control" id="phone" name="phone" placeholder="'-'포함한 13자리 입력">
<span id="phoneChk" class="error col-xs-offset-3 feedback">'-'를 포함한 13자리의 전화번호를 입력해주세요</span>
<span id="valid-phone" class="valid col-xs-offset-3 feedback">유효한 전화번호 입니다.</span>
<br><br>

<label for="email" class="col-xs-3 control-label">이메일 </label>
<input type="email" class="form-control" id="email" onKeyup="characterCheck(this)" name="email" value="${user.email }" placeholder="ex) asdf1234@gmail.com">
<span id="emailChk" class="error col-xs-offset-3 feedback">asd123@gmail.com의 형식이여야 합니다.</span>
<span id="emailError" class="error col-xs-offset-3 feedback">이미 존재하는 이메일입니다.</span>
<span id="valid-email" class="valid col-xs-offset-3 feedback">사용가능한 이메일입니다.</span>
<br><br>

<label for="gender" class="col-xs-3 control-label">성별 </label>
<div style="position: relative; left: -350px;">
<input type="radio" name="gender" value="F" id="female" checked="checked"/> <label id="woman">여성</label>
<input type="radio" name="gender" value="M" id="male"/> <label id="male">남성</label><br>
</div>
<br><br>

<label for="birth" class="col-xs-3 control-label">생일 </label>
<input type="text" class="form-control" id="birth" name="birth" readonly onclick="javascript:f_datepicker(this);">
<span id="birthChk" class="error col-xs-offset-3 feedback">생일을 선택해주세요</span>
<span id="valid-birth" class="valid col-xs-offset-3 feedback">선택 되었습니다.</span>
<br><br>

<label for="questionAnwser" class="col-xs-3 control-label">본인 확인 질문 </label>
<select id="questionNo" name="questionNo" style="width:500px;border: 1px solid #ccc;border-radius: 5px;margin-bottom:5px; position: relative;
    left: -150px">
      <option value="1">내가 좋아하는 캐릭터(인물)는?</option>
      <option value="2">다시 태어나면 되고 싶은 것은?</option>
      <option value="3">가장 감명깊게 본 영화는?</option>
      <option value="4">자신의 보물 1호는?</option>
      <option value="5">받았던 선물중에 가장 기억에 남는 선물은?</option>
      <option value="6">읽은 책 중에서 가장 좋아하는 구절은?</option>
</select>
<input type="text" class="col-xs-offset-3 form-control"  onKeyup="characterCheck(this)" id="questionAnwser" onKeyup="characterCheck(this)" name="questionAnwser" placeholder="질문에 답을 입력해주세요"> 
<span id="answerChk" class="error col-xs-offset-3 feedback">답을 입력해주세요</span>
<span id="valid-answer" class="valid col-xs-offset-3 feedback">입력 되었습니다.</span>
<br>
</form>
<div class="text-center" id="pageBtn"> 
   	<button class="btn btn-primary" type="button" id="nextBtn">작성</button>
    <button class="btn btn-danger" type="button" id="cancleBtn">취소</button>
</div>
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp"/>