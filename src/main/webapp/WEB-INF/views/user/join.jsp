<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<c:import url="/WEB-INF/views/layout/header.jsp"/>

<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

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
	
	const idFormCheck = RegExp(/^[a-zA-Z0-9-_]{4,12}$/);
	var idWithoutNumber = id.val().replace(/\D/g, '');
	var idWithoutString = id.val().replace(/[0-9]/g, '');
	
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
	
	if (checkEmail() == false) {
		console.log("유효하지 않은 이메일형식");
		return false;
	}
	
	try {
		const result = await ajaxPost('/user/check/email', {email: email.val()});
		console.log("이메일 체크 결과 : ",result);
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
	
	var	answer = $("#questionAnwser");
	var pattern = /\s/g;// 스페이스바 거르기
	
	if (answer.val() == "") {
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
 	console.log(isvalid);
 	
	if (checkPw() == false) isvalid = false;
 	console.log(isvalid);
	
 	if (checkPw2() == false) isvalid = false;
	console.log(isvalid);
	
	if (checkNick() == false) isvalid = false;
	else if (await checkNickExist() == false) isvalid = false;
	console.log(isvalid);
	
	if (checkId() == false) isvalid = false;
 	else if (await checkIdExist() == false) isvalid = false;
	
	console.log(isvalid);
	
	if (checkBirth() == false) isvalid = false;
	console.log(isvalid);
	
	if (checkAnswer() == false) isvalid = false;
	console.log(isvalid);
	
	if(await authKeyCheck() == false) isvalid = false;
	
	return isvalid;
}

async function sendMail(){
	console.log("인증 메일 전송");
	var mail = $("#email"); //사용자의 이메일 입력값.
	try {
		$("#sendMail").css("display", "none");
		$("#emailCheckLabel").css("display", "inline");
		$("#emailCheck").css("display", "inline");
		$("#isVailEmail").css("display", "inline");
	
		if (checkEmailExist() == true) {
			console.log("유효하지 않은 형식이거나 이미 존재하는 메일")
			return false;
		} else {
			console.log("email : ", mail.val());
			const result = await ajaxPost('send/mail', {mail: mail.val()});
		
			console.log(result);
			return true;
		}
	}catch (e){
		console.log(e);

	}
}

async function authKeyCheck(){
	var authKey = $("#emailCheck")
	console.log(authKey);
	if(authKey == ""){
		console.log("인증키 값 없음");
		return false;
	}
	var result = await ajaxPost("/user/session/call", {authKey:authKey.val()});
	if(result){
		$("#sendSucess").css("display", "inline");
		$("#sendFail").css("display", "none");
	}else{
		$("#sendSucess").css("display", "none");
		$("#sendFail").css("display", "inline");
	}
	return result;
}

async function submit() {
	var isChecked = await checked();
	console.log("보내기 전 체크 값 : ", isChecked);
	if (isChecked == false) {
		console.log("유효하지 않은 항목 존재");
		alert("입력값을 다시 확인하세요");
		return false;
	}
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
				alert("회원정보 전송을 완료했습니다.");
				return true;
			} else {
				console.log("회원가입 실패")
				alert("회원정보 전송을 실패했습니다.");
				return false;
			}
		},
		error: function(xhr, status, error) {
			console.log(xhr, status, error);
		}
	})
}

$(document).ready(function(){
	
	$(".btnPerf").click(function(){
		location.href="/survey/name";
	});
	
	var joinCnt = 0;

	$("#agree_all").change(function(){
		//대상이 체크된 상태일때
		if($(this).is(":checked")){
			$(".chkSub").attr("checked", true);
		}else{
			$(".chkSub").attr("checked", false);
		}
	});
	
	$(".chkSub1").change(function(){
		var checked = $(this).is(":checked");
		if(!checked){
			$(".chkSubAll").attr("checked", false);
		}
	})
	$(".chkSub2").change(function(){
		var checked = $(this).is(":checked");
		if(!checked){
			$(".chkSubAll").attr("checked", false);
		}
	})
	$(".chkSub3").change(function(){
		var checked = $(this).is(":checked");
		if(!checked){
			$(".chkSubAll").attr("checked", false);
		}
	})
	$(".chkSub4").change(function(){
		var checked = $(this).is(":checked");
		if(!checked){
			$(".chkSubAll").attr("checked", false);
		}
	})
	
	$("#nextBtn").click(function(){
		console.log("#joinBtn clicked");
		
		if(joinCnt == 0 ){
			if($(".chkSub1").is(":checked") == true && $(".chkSub2").is(":checked") == true && $(".chkSub3").is(":checked") == true){
				console.log("약관 동의 완료");
				joinCnt++;
				$("#info").css("color", "#35312B");
				$("#agree").css("color", "#8A7E6B");
				$("#agreement").css("display", "none");
				$("#join-form").css("display", "inline");
			}else{
				alert("필수 항목에 체크해주세요");
			}
		}else if(joinCnt == 1){
			console.log("회원 입력 페이지에서 이동")
			var isCheck = checked();
			console.log("회원 입력정보 체크 : ", isCheck);
			if(isCheck){ //이건 넘어감
				// 모든 항목 검사 및 회원가입 실행
				isCheck = submit();
				console.log("회원 입력정보 전송 확인 : ", isCheck);
				if(isCheck == false){
					console.log("요소 중 에러사항 있음")
	 				alert("체크되지 않은 항목이 존재합니다.");
				}else{
					$("#join-form").css("display", "none");
					$("#info").css("color", "#8A7E6B");
					$("#agree").css("color", "#8A7E6B");
					$("#joinComplete").css("color", "#35312B");
				
					$("#complete-join").css("display", "inline");
					$("#pageBtn").css("display","none");
				}
 			}else{
 				console.log("요소 중 에러사항 있음")
 				alert("체크되지 않은 항목이 존재합니다.");
 			}
			
		}
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
	
	function birthCheck(obj){
		checkBirth(obj);
	}
	$("#phone").blur(function(){
		telValidator();
	})
	$("#questionAnwser").blur(function(){
		checkAnswer()
	})
	
	$("#cancleBtn").click(function(){
		if(joinCnt == 0){
			joinCnt--;
			$(location).attr("href", "/user/main");
			
		}else if(joinCnt == 1){
			
			console.log("정보 입력 취소");
			joinCnt--;
			$("#info").css("color", "#35312B");
			$("#agree").css("color", "#8A7E6B");
			$("#agreement").css("display", "inline");
			$("#join-form").css("display","none");
		}
	})
	
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
        changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
        yearRange: 'c-100:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
        showButtonPanel: true, // 캘린더 하단에 버튼 패널을 표시한다. 
        currentText: '오늘 날짜' , // 오늘 날짜로 이동하는 버튼 패널
        closeText: '닫기'  // 닫기 버튼 패널
    });

    $("#birth").click(function() {
        $("#birth").datepicker();
    });
    
    $("#birth").change(function(){
    	checkBirth()
    })
    //입력이 안료되었을 때 호출
    //유효성 검사 / 공백 체크 / 중복 체크
    $("#id").blur(function(){
    	checkIdExist();
    })

    $("#nick").blur(function(){
    	checkNickExist();
    })
    
    $("#email").blur(function(){
    	var isChecked = checkEmailExist();
    	if(isChecked){
    		$("#sendMail").css("display", "inline");
			$("#emailCheckLabel").css("display", "none");
			$("#emailCheck").css("display", "none");
			$("#isVailEmail").css("display", "none");
			$("#vail-email").css("display", "none");
    	}else{
    		$("#sendMail").css("display", "none");
    	}
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
    
    //메일 전송 및 인증 번호 입력단 활성화
    $("#sendMail").click(function(){
    	if(checkEmailExist() == false){
    		$(this).css("display", "none")
    	}else{
    		$(this).css("display", "none")
    		sendMail();
    	}
    });
    
	$("#isVailEmail").click(function(){
		if(checkEmailExist() == false){
			console.log("중복된 이메일")
		}else{
			authKeyCheck();
		}
	})
   
	$("#into-login").click(function(){
		$(location).attr('href', '/user/login');
	})
	
	$("#into-main").click(function(){
		$(location).attr('href', '/');
	})
})

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
	border-radius: 30px;
    height: 60px;
	background: #ECE6CC;
	color: #8A7E6B;
}
#questionNo {
    width: 200px;
    height: 30px;
}
#join-form { 
 	display: none; 
} 

#agree {
	color: black;
}

.form-control {
	width:500px;
}
.text-area{
	width: 1000px;
    height: 250px;
}
</style>
<div class="container">
<div class="text-center" id="pageName">
<h1 id="ltitle">
	<div id="agree" style="padding: 10px;padding-left: 170px;float: left;color:#35312B;">약관 동의</div> 
	<i class="fas fa-angle-right" style="padding: 10px 50px;float: left;font-weight: 700;"></i> 
	<div id="info" style="padding: 10px;float: left;">정보 입력</div> 
	<i class="fas fa-angle-right" style="padding: 10px 50px;float: left;font-weight: 700;"></i> 
	<div id="joinComplete" style="padding: 10px;float: left;">가입완료</div>
</h1>
<hr>
</div>
<div class="text-center" id="agreement">
<div class="text-left">
<label for="agree">
  <input type="checkbox" class="chkSub chkSub1" name="chkBox" value="1">
  <span>이용약관 동의<strong>(필수)</strong><br></span>
</label><br>
<textarea class="text-area" rows="200" cols="10">
제 1 장 총칙

제 1 조 (목적)
본 약관은 통계청이 운영하는 나라통계시스템 운영홈페이지(이하 "당 사이트")에서 제공하는 모든 서비스(이하 "서비스")의 이용조건 및 절차, 이용자와 당 사이트의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.

제 2 조 (약관의 효력과 변경)
① 당 사이트는 이용자가 본 약관 내용에 동의하는 것을 조건으로 이용자에게 서비스를 제공하며, 당 사이트의 서비스 제공 행위 및 이용자의 서비스 사용 행위에는 본 약관을 우선적으로 적용하겠습니다.
② 당 사이트는 본 약관을 사전 고지 없이 변경할 수 있으며, 변경된 약관은 당 사이트 내에 공지함으로써 이용자가 직접 확인하도록 할 것입니다. 이용자가 변경된 약관에 동의하지 아니하는 경우 본인의 회원등록을 취소(회원탈퇴)할 수 있으며, 계속 사용할 경우에는 약관 변경에 대한 암묵적 동의로 간주됩니다. 변경된 약관은 공지와 동시에 그 효력을 발휘합니다.

제 3 조 (약관 외 준칙)
본 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 및 기타 관련 법령의 규정에 의합니다.

제 4 조 (용어의 정의)
① 본 약관에서 사용하는 용어의 정의는 다음과 같습니다.
 1. 이용자 : 본 약관에 따라 당 사이트가 제공하는 서비스를 받는 자
 2. 가 입 : 당 사이트가 제공하는 신청서 양식에 해당 정보를 기입하고, 본 약관에 동의하여 서비스 이용계약을 완료시키는 행위
 3. 회 원 : 당 사이트에 필요한 개인 정보를 제공하여 회원 등록을 한 자로서, 당 사이트의 정보 및 서비스를 이용할 수 있는 자
 4. 아이디 : 이용고객의 식별과 이용자가 서비스 이용을 위하여 이용자가 정한 문자와 숫자의 조합
 5. 비밀번호 : 아이디에 대한 본인 여부를 확인하기 위하여 사용되는 문자, 숫자, 특수문자 등의 조합
 6. 탈퇴 : 서비스 또는 회원이 이용계약을 종료하는 행위
② 본 약관에서 정의하지 않은 용어는 개별서비스에 대한 별도 약관 및 이용규정에서 정의합니다.

제 2 장 서비스 제공 및 이용

제 5 조 (이용 계약의 성립)
① 이용계약은 이용자가 온라인으로 당 사이트에서 제공하는 이용계약 신청서를 작성하여 가입을 완료하는 것으로 성립됩니다.
② 당 사이트는 다음 각 호에 해당하는 경우에 가입을 취소할 수 있습니다.
 1. 다른 사람의 명의를 사용하여 신청하였을 때
 2. 이용 계약 신청서의 내용을 허위로 기재하였거나 신청하였을 때
 3. 사회의 안녕 질서 혹은 미풍양속을 저해할 목적으로 신청하였을 때
 4. 다른 사람의 당 사이트 서비스 이용을 방해하거나 그 정보를 도용하는 등의 행위를 하였을 때
 5. 당 사이트를 이용하여 법령과 본 약관이 금지하는 행위를 하는 경우
 6. 기타 당 사이트가 정한 이용신청요건이 미비 되었을 때
③ 당 사이트는 다음 각 호에 해당하는 경우 그 사유가 소멸될 때까지 이용계약 성립을 유보할 수 있습니다.
 1. 서비스 관련 제반 용량이 부족한 경우
 2. 기술상 장애 사유가 있는 경우
④ 당 사이트가 제공하는 서비스는 자체 개발하거나 다른 기관과의 협의 등을 통해 제공하는 일체의 서비스를 말하는 것이며, 그 내용을 변경할 경우에는 이용자에게 공지한 후 변경하여 제공할 수 있습니다.

제 6 조 (회원정보 사용에 대한 동의)
① 회원의 개인정보는 공공기관의 개인정보보호법에 의해 보호되며 당 사이트의  개인정보처리방침이 적용됩니다.
② 당 사이트의 회원 정보는 다음과 같이 수집, 사용, 관리, 보호됩니다.
 1. 개인정보의 수집 : 당 사이트는 회원 가입시 회원이 제공하는 정보를 수집합니다.
 2. 개인정보의 사용 : 당 사이트는 서비스 제공과 관련해서 수집된 회원정보를 본인의 승낙 없이 제3자에게 누설, 배포하지 않습니다. 단, 전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우, 범죄에 대한 수사상의 목적이 있거나 방송통신심의위원회의 요청이 있는 경우 또는 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우, 회원이 당 사이트에 제공한 개인정보를 스스로 공개한 경우에는 그러하지 않습니다.
 3. 개인정보의 관리 : 회원은 개인정보의 보호 및 관리를 위하여 서비스의 개인정보관리에서 수시로 회원의 개인정보를 수정/삭제할 수 있습니다. 수신되는 정보 중 불필요하다고 생각되는 부분도 변경/조정할 수 있습니다. 개인정보의 이용기간은 이용자가 가입을 완료하고 개인정보관리에서 회원가입을 탈퇴하는 시점이며 보호기간도 동일합니다.
 4. 개인정보의 보호 : 회원의 개인정보는 오직 회원만이 열람/수정/삭제 할 수 있으며, 이는 전적으로 회원의 아이디와 비밀번호에 의해 관리되고 있습니다. 따라서 타인에게 본인의 아이디와 비밀번호를 알려주어서는 아니 되며, 작업 종료 시에는 반드시 로그아웃 해주시고, 웹 브라우저의 창을 닫아주시기 바랍니다(이는 타인과 컴퓨터를 공유하는 인터넷 카페나 도서관 같은 공공장소에서 컴퓨터를 사용하는 경우에 회원의 정보의 보호를 위하여 필요한 사항입니다.)

제 7 조 (회원의 정보 보안)
① 가입 신청자가 당 사이트 서비스 가입 절차를 완료하는 순간부터 회원은 입력한 정보의 비밀을 유지할 책임이 있으며, 회원의 아이디와 비밀번호를 타인에게 제공하여 발생하는 모든 결과에 대한 책임은 회원 본인에게 있습니다.
② 아이디와 비밀번호에 관한 모든 관리의 책임은 회원에게 있으며, 회원의 아이디나 비밀번호가 부정하게 사용되었다는 사실을 발견한 경우에는 즉시 당 사이트에 신고하여야 합니다. 신고를 하지 않음으로 인한 모든 책임은 회원 본인에게 있습니다.
③ 회원은 당 사이트 서비스의 사용 종료 시마다 정확히 접속을 종료하도록 해야 하며, 정확히 종료하지 아니함으로써 제3자가 이용자 또는 회원에 관한 정보를 이용하게 되는 등의 결과로 인해 발생하는 손해 및 손실에 대하여 당 사이트는 책임을 부담하지 아니합니다.

제 8 조 (서비스 이용시간)
① 서비스 이용시간은 당 사이트의 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴, 1일 24시간을 원칙으로 합니다.
② 제1항의 이용시간은 정기점검 등의 필요로 인하여 당 사이트가 정한 날 또는 시간 및 예기치 않은 사건사고로 인한 시간은 예외로 합니다.

제 9 조 (서비스의 중지 및 정보의 저장과 사용)
① 당 사이트 서비스에 보관되거나 전송된 메시지 및 기타 통신 메시지 등의 내용이 국가의 비상사태, 정전, 당 사이트의 관리 범위 외의 서비스 설비 장애 및 기타 불가항력에 의하여 보관되지 못하였거나 삭제된 경우, 전송되지 못한 경우 및 기타 통신 데이터의 손실이 있을 경우에 당 사이트는 관련 책임을 부담하지 아니합니다.
② 당 사이트가 정상적인 서비스 제공의 어려움으로 인하여 일시적으로 서비스를 중지하여야 할 경우에는 서비스 중지 1주일 전의 고지 후 서비스를 중지할 수 있으며, 이 기간 동안 이용자가 고지내용을 인지하지 못한 데 대하여 당 사이트는 책임을 부담하지 아니합니다. 부득이한 사정이 있을 경우 위 사전 고지기간은 감축되거나 생략될 수 있습니다. 또한 위 서비스 중지에 의하여 본 서비스에 보관되거나 전송된 메시지 및 기타 통신 메시지 등의 내용이 보관되지 못하였거나 삭제․전송되지 못한 경우 및 기타 통신 데이터의 손실이 있을 경우에 대하여도 당 사이트는 책임을 부담하지 아니합니다.
③ 당 사이트의 사정으로 서비스를 영구적으로 중단하여야 할 경우 제2항에 의거합니다. 다만, 이 경우 사전 고지기간은 1개월로 합니다.
④ 당 사이트는 사전 고지 후 서비스를 일시적으로 수정, 변경 및 중단할 수 있으며, 이에 대하여 이용자 또는 제3자에게 어떠한 책임도 부담하지 아니합니다.
⑤ 당 사이트는 이용자가 본 약관의 내용에 위배되는 행동을 한 경우, 임의로 서비스 사용을 제한 및 중지할 수 있습니다. 이 경우 당 사이트는 위 이용자의 접속을 금지할 수 있습니다.
⑥ 장기간 휴면 회원인 경우 안내 메일 또는 공지사항 발표 후 1주일간의 통지 기간을 거쳐 서비스 사용을 중지할 수 있습니다.

제 10 조 (서비스의 변경 및 해지)
① 당 사이트는 이용자가 서비스를 이용하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않으며, 회원이 본 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관하여는 책임을 지지 않습니다.
② 당 사이트는 서비스 이용과 관련하여 가입자에게 발생한 손해 중 가입자의 고의, 과실에 의한 손해에 대하여 책임을 부담하지 아니합니다.
③ 회원을 탈퇴하고자 하는 경우에는 당 사이트 로그인 후 회원탈퇴 절차에 따라 해지할 수 있습니다.

제 11 조 (정보 제공 및 홍보물 게재)
① 당 사이트는 서비스를 운영함에 있어서 각종 정보를 서비스에 게재하는 방법 등으로 회원에게 제공할 수 있습니다.
② 당 사이트는 서비스에 적절하다고 판단되거나 활용 가능성 있는 홍보물을 게재할 수 있습니다.

제 12 조 (게시물의 저작권)
① 이용자가 게시한 게시물의 내용에 대한 권리는 이용자에게 있습니다.
② 당 사이트는 게시된 내용을 사전 통지 없이 편집, 이동할 수 있는 권리를 보유하며, 다음의 경우 사전 통지 없이 삭제할 수 있습니다.
 1. 본 이용약관에 위배되거나 상용 또는 불법, 음란, 저속하다고 판단되는 게시물을 게시한 경우
 2. 다른 이용자 또는 제 3자를 비방하거나 중상모략으로 명예를 손상시키는 내용인 경우
 3. 공공질서 및 미풍양속에 위반되는 내용인 경우
 4. 범죄적 행위에 결부된다고 인정되는 내용일 경우
 5. 제3자의 저작권 등 기타 권리를 침해하는 내용인 경우
 6. 기타 관계 법령에 위배되는 경우
③ 이용자의 게시물이 타인의 저작권을 침해함으로써 발생하는 민․형사상의 책임은 전적으로 이용자가 부담하여야 합니다.

제 13 조 (이용자의 행동규범 및 서비스 이용제한)
① 이용자가 제공하는 정보의 내용이 허위인 것으로 판명되거나, 그러하다고 의심할 만한 합리적인 사유가 발생할 경우 당 사이트는 이용자의 본 서비스 사용을 일부 또는 전부 중지할 수 있으며, 이로 인해 발생하는 불이익에 대해 책임을 부담하지 아니합니다.
② 이용자가 당 사이트 서비스를 통하여 게시, 전송, 입수하였거나 전자메일 기타 다른 수단에 의하여 게시, 전송 또는 입수한 모든 형태의 정보에 대하여는 이용자가 모든 책임을 부담하며 당 사이트는 어떠한 책임도 부담하지 아니합니다.
③ 당 사이트는 당 사이트가 제공한 서비스가 아닌 가입자 또는 기타 유관기관이 제공하는 서비스의 내용상의 정확성, 완전성 및 질에 대하여 보장하지 않습니다. 따라서 당 사이트는 이용자가 위 내용을 이용함으로 인하여 입게 된 모든 종류의 손실이나 손해에 대하여 책임을 부담하지 아니합니다.
④ 이용자는 본 서비스를 통하여 다음과 같은 행동을 하지 않는데 동의합니다.
 1. 타인의 아이디와 비밀번호를 도용하는 행위
 2. 저속, 음란, 모욕적, 위협적이거나 타인의 사생활을 침해할 수 있는 내용을 전송, 게시, 게재, 전자메일 또는 기타의 방법으로 전송하는 행위
 3. 서비스를 통하여 전송된 내용의 출처를 위장하는 행위
 4. 법률, 계약에 의하여 이용할 수 없는 내용을 게시, 게재, 전자메일 또는 기타의 방법으로 전송하는 행위
 5. 타인의 특허, 상표, 영업비밀, 저작권, 기타 지적재산권을 침해하는 내용을 게시, 게재, 전자메일 또는 기타의 방법으로 전송하는 행위
 6. 당 사이트의 승인을 받지 아니한 광고, 판촉물, 정크메일, 스팸, 행운의 편지, 피라미드 조직 기타 다른 형태의 권유를 게시, 게재, 전자메일 또는 기타의 방법으로 전송하는 행위
 7. 다른 이용자의 개인정보를 수집 또는 저장하는 행위
⑤ 당 사이트는 회원이 본 약관을 위배했다고 판단되면 서비스와 관련된 모든 정보를 이용자의 동의 없이 삭제할 수 있습니다.
⑥ 제1항의 규정에 의하여 서비스의 제한을 받게 된 이용자가 위 조치에 대한 이의가 
있을 경우에는 이의신청을 할 수 있으나 서비스 제한 시 삭제된 이용자의 데이터에 대해서는 책임지지 아니합니다. 
⑦ 당 사이트는 제6항의 규정에 의한 이의신청에 대하여 그 확인이 완료될 때까지 이용제한을 연기할 수 있습니다.

제 3 장 의무 및 책임

제 14 조 (당 사이트의 의무)
① 당 사이트는 법령과 본 약관이 금지하거나 미풍양속에 반하는 행위를 하지 않으며, 지속적이고 안정적으로 서비스를 제공하기 위해 노력할 의무가 있습니다.
② 당 사이트는 회원의 개인 신상 정보를 본인의 승낙 없이 타인에게 누설, 배포하지 않습니다. 다만, 전기통신관련법령 등 관계법령에 의하여 관계 국가기관 등의 요구가 있는 경우에는 그러하지 아니합니다.
③ 당 사이트는 이용자가 안전하게 당 사이트 서비스를 이용할 수 있도록 이용자의 개인정보 (신용정보 포함) 보호를 위한 보안시스템을 갖추어야 합니다.
④ 당 사이트는 이용자의 귀책사유로 인한 서비스 이용 장애에 대하여 책임을 지지 않습니다.

제 15 조 (회원의 의무)
① 회원 가입시에 요구되는 정보는 정확하게 기입하여야 합니다. 또한 이미 제공된 회원에 대한 정보가 정확한 정보가 되도록 유지, 갱신하여야 하며, 회원은 자신의 아이디 및 비밀번호를 제3자에게 이용하게 해서는 안 됩니다.
② 회원은 당 사이트의 사전 승낙 없이 서비스를 이용하여 어떠한 영리행위도 할 수 없습니다.
③ 회원은 당 사이트 서비스를 이용하여 얻은 정보를 당 사이트의 사전승낙 없이 복사, 복제, 변경, 번역, 출판·방송 기타의 방법으로 사용하거나 이를 타인에게 제공할 수 없습니다.
④ 이용자는 당 사이트 서비스 이용과 관련하여 다음 각 호의 행위를 하여서는 안 됩니다.
 1. 다른 회원의 아이디를 부정 사용하는 행위
 2. 범죄행위를 목적으로 하거나 기타 범죄행위와 관련된 행위
 3. 선량한 풍속, 기타 사회질서를 해하는 행위
 4. 타인의 명예를 훼손하거나 모욕하는 행위
 5. 타인의 지적재산권 등의 권리를 침해하는 행위
 6. 해킹행위 또는 컴퓨터바이러스의 유포행위
 7. 타인의 의사에 반하여 광고성 정보 등 일정한 내용을 지속적으로 전송하는 행위
 8. 서비스의 안전적인 운영에 지장을 주거나 줄 우려가 있는 일체의 행위
 9. 당 사이트에 게시된 정보의 변경

제 4 장 기 타

제 16 조 (당 사이트의 소유권)
① 당 사이트가 제공하는 서비스, 그에 필요한 소프트웨어, 이미지, 마크, 로고, 디자인, 서비스명칭, 정보 및 상표 등과 관련된 지적재산권 및 기타 권리는 당 사이트에 소유권이 있습니다.
② 이용자는 당 사이트가 명시적으로 승인한 경우를 제외하고는 전항의 소정의 각 재산에 대한 전부 또는 일부의 수정, 대여, 대출, 판매, 배포, 제작, 양도, 재라이센스, 담보권 설정 행위, 상업적 이용 행위를 할 수 없으며, 제3자로 하여금 이와 같은 행위를 하도록 허락할 수 없습니다.

제 17 조 (양도금지)
회원이 서비스의 이용권한, 기타 이용계약 상 지위를 타인에게 양도, 증여할 수 없으며, 이를 담보로 제공할 수 없습니다.

제 18 조 (손해배상)
당 사이트는 무료로 제공되는 서비스와 관련하여 회원에게 어떠한 손해가 발생하더라도 당 사이트가 고의로 행한 범죄행위를 제외하고 이에 대하여 책임을 부담하지 아니합니다.

제 19 조 (면책조항)
① 당 사이트는 서비스에 표출된 어떠한 의견이나 정보에 대해 확신이나 대표할 의무가 없으며 회원이나 제3자에 의해 표출된 의견을 승인하거나 반대하거나 수정하지 않습니다. 당 사이트는 어떠한 경우라도 회원이 서비스에 담긴 정보에 의존해 얻은 이득이나 입은 손해에 대해 책임이 없습니다.
② 당 사이트는 회원간 또는 회원과 제3자간에 서비스를 매개로 하여 물품거래 혹은 금전적 거래 등과 관련하여 어떠한 책임도 부담하지 아니하고, 회원이 서비스의 이용과 관련하여 기대하는 이익에 관하여 책임을 부담하지 않습니다.

제 20 조 (관할법원)
본 서비스 이용과 관련하여 발생한 분쟁에 대해 소송이 제기될 경우 대전지방법원을 전속적 관할 법원으로 합니다.

부 칙
(시행일) 본 약관은 2018년 8월 1일부터 시행됩니다. 개정된 약관의 적용일자 이전 이용자 또는 회원은 개정된 이용약관의 적용을 받습니다.
</textarea><br><br>
<label for="agree">
  <input type="checkbox" class="chkSub chkSub2" name="chkBox" value="2">
  <span>개인정보 수집, 이용 동의<strong>(필수)<br></strong></span>
</label>
<textarea class="text-area" rows="40" cols="10">
1. 개인정보의 수집항목 및 수집방법 
통계청 나라통계사이트에서는 기본적인 회원 서비스 제공을 위한 필수정보로 실명인증정보와 가입정보로 구분하여 다음의 정보를 수집하고 있습니다. 필수정보를 입력해주셔야 회원 서비스 이용이 가능합니다.

  가. 수집하는 개인정보의 항목 
    * 수집하는 필수항목
      - 실명인증정보 : 이름, 휴대전화번호, 본인 인증 또는 I-PIN(개인식별번호), GPKI
      - 가입정보 : 아이디, 비밀번호, 성명, 이메일, 전화번호, 휴대전화번호, 기관명
    * 선택항목
      - 주소, 기관의 부서명
	
   [컴퓨터에 의해 자동으로 수집되는 정보]
   인터넷 서비스 이용과정에서 아래 개인정보 항목이 자동으로 생성되어 수집될 수 있습니다. 
    - IP주소, 서비스 이용기록, 방문기록 등
	
  나. 개인정보 수집방법
      홈페이지 회원가입을 통한 수집 

2. 개인정보의 수집/이용 목적 및 보유/이용 기간
통계청 나라통계사이트에서는 정보주체의 회원 가입일로부터 서비스를 제공하는 기간 동안에 한하여 통계청 나라통계사이트 서비스를 이용하기 위한 최소한의 개인정보를 보유 및 이용 하게 됩니다. 회원가입 등을 통해 개인정보의 수집·이용, 제공 등에 대해 동의하신 내용은 언제든지 철회하실 수 있습니다. 회원 탈퇴를 요청하거나 수집/이용목적을 달성하거나 보유/이용기간이 종료한 경우, 사업 폐지 등의 사유발생시 개인 정보를 지체 없이 파기합니다.

  * 실명인증정보
    - 개인정보 수집항목 : 이름, 휴대폰 본인 인증 또는 I-PIN(개인식별번호), GPKI
    - 개인정보의 수집·이용목적   : 홈페이지 이용에 따른 본인 식별/인증절차에 이용
    - 개인정보의 보유 및 이용기간 : I-PIN / GPKI는 별도로 저장하지 않으며 실명인증용으로만 이용

  * 가입정보
    - 개인정보 수집항목 : 아이디, 비밀번호, 성명, 이메일, 전화번호, 휴대전환번호, 기관명
    - 개인정보의 수집·이용목적 : 홈페이지 서비스 이용 및 회원관리, 불량회원의 부정 이용방지, 민원신청 및 처리 등
    - 개인정보의 보유 및 이용기간 : 2년 또는 회원탈퇴시

정보주체는 개인정보의 수집·이용목적에 대한 동의를 거부할 수 있으며, 동의 거부시 통계청 나라통계사이트에 회원가입이 되지 않으며, 통계청 나라통계사이트에서 제공하는 서비스를 이용할 수 없습니다.

3. 수집한 개인정보 제3자 제공
통계청 나라통계사이트에서는 정보주체의 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.
</textarea><br><br>
<label for="agree">
  <input type="checkbox" class="chkSub chkSub3" name="chkBox" value="3">
  <span>개인 처리 방침 동의<strong>(필수)</strong><br></span>
</label>
<textarea class="text-area" rows="40" cols="10">
4. 개인정보 처리업무 안내
통계청 나라통계사이트에서는 개인정보의 취급위탁은 하지 않고 있으며, 원활한 서비스 제공을 위해 아래의 기관을 통한 실명인증 및 공공 I-PIN, GPKI 인증을 하고 있습니다. 

  * 수탁업체
    - SCI서울신용평가정보(주)
      · 위탁업무 내용 : 실명확인
      · 개인정보 보유 및 이용 기간 : 신용평가 기관에서는 이미 보유하고 있는 개인정보이기 때문에 별도로 저장하지 않음
    - 행정자치부
      · 위탁업무 내용 : 공공 I-PIN, GPKI 인증
      · 개인정보 보유 및 이용 기간 : 행정자치부에서는 이미 보유하고 있는 개인정보이기 때문에 별도로 저장하지 않음
</textarea><br><br>
<label for="agree">
  <input type="checkbox" class="chkSub chkSub4" value="4">
  <span>이벤트, 혜택정보 수신동의<strong class="select_disable">(선택)<br></strong></span>
</label>
<textarea class="text-area" rows="40" cols="10">
분류			
이벤트 및 정보 안내 수신 서비스 이용자	이벤트 및 광고성 정보 안내, 이벤트 당첨 및 상품배송, 
수집 목적
맞춤형 혜택 서비스
수집하는 항목	
보유 및 이용 기간
성명, 휴대전화번호, 이메일 주소	회원탈퇴 시 혹은 위탁계약 종료 시 까지, 법령이 정한 시점
</textarea><br>
</div>
<div class="text-right">
<label for="agree_all">
  <input type="checkbox" class="chkSub chkSubAll" id="agree_all">
  <span>모두 동의합니다</span>
</label>
</div>
</div>

<form action="/user/join" method="post" id="join-form" class="form-horizontal"  style="dispaly:flex;">

<label for="id" class="col-xs-3 control-label">아이디 </label>
<input type="text" class="form-control" id="id" name="id" placeholder="4~12자의 영문 대소문자와 숫자로만 입력">
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
<input type="text" class="form-control" id="nick" name="nick" placeholder="닉네임을 입력해 주세요">
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
<input  type="email" class="form-control" id="email" name="email" placeholder="ex) asdf1234@gmail.com">
<span id="emailChk" class="error col-xs-offset-3 feedback">asd123@gmail.com의 형식이여야 합니다.<br></span>
<span id="emailError" class="error col-xs-offset-3 feedback">이미 존재하는 이메일입니다.<br></span>
<span id="valid-email" class="valid col-xs-offset-3 feedback">사용가능한 이메일입니다.<br></span>

<button id="sendMail" class="btn col-xs-offset-3 feedback" type="button">인증번호 받기</button>
<br>
<label for="emailCheck" id="emailCheckLabel"class="col-xs-3 control-label feedback">인증번호 </label>
<input id="emailCheck" class="form-control feedback" style="width:300px;" name="emailCheck" placeholder="메일을 확인하여 인증번호를 입력하세요">
<button id="isVailEmail" class="btn feedback" type="button">인증</button>
<br>
<span id="sendSucess" class="valid col-xs-offset-3 feedback">인증되었습니다.<br></span>
<span id="sendFail" class="error col-xs-offset-3 feedback">인증번호가 일치하지않습니다.<br></span>
<br><br>

<label for="gender" class="col-xs-3 control-label">성별 </label>
<input type="radio" name="gender" value="F" id="female" checked="checked"/> <label id="woman">여성</label>
<input type="radio" name="gender" value="M" id="male"/> <label id="male">남성</label><br>
<br><br>

<label for="birth" class="col-xs-3 control-label">생일 </label>
<input type="text" class="form-control" id="birth" readonly name="birth" placeholder="birth" onchage=birthCheck(this)>
<span id="birthChk" class="error col-xs-offset-3 feedback">생일을 선택해주세요</span>
<span id="valid-birth" class="valid col-xs-offset-3 feedback">선택 되었습니다.</span>
<br><br>

<label for="questionAnwser" class="col-xs-3 control-label">자주묻는 질문 </label>
<select id="questionNo" name="questionNo" style="width:500px;border: 1px solid #ccc;border-radius: 5px;margin-bottom:5px;">
      <option value="1">내가 좋아하는 캐릭터(인물)는?</option>
      <option value="2">다시 태어나면 되고 싶은 것은?</option>
      <option value="3">가장 감명깊게 본 영화는?</option>
      <option value="4">자신의 보물 1호는?</option>
      <option value="5">받았던 선물중에 가장 기억에 남는 선물은?</option>
      <option value="6">읽은 책 중에서 가장 좋아하는 구절은?</option>
</select>
<input type="text" class="col-xs-offset-3 form-control" id="questionAnwser" name="questionAnwser" placeholder="질문에 답을 입력해주세요"> 
<span id="answerChk" class="error col-xs-offset-3 feedback">답을 입력해주세요</span>
<span id="valid-answer" class="valid col-xs-offset-3 feedback">입력 되었습니다.</span>
<br>
</form>

<div id="complete-join" Class="feedback text-center">
<div class="text-center" style="font-size: 24px; font-weight: 300;">
향기로운 당신이 되어 주셔서 고맙습니다.<br>
로그인 후 <span style="font-size:32px; font-weight: 300;">EXQUIS ME</span>의 모든 향기를 맡아 보실 수 있습니다.<br>
<button id="into-login" class="btn" type="button">로그인 하기</button>
<br>
<br>
오늘의 당신에게 어울리는 향기를 찾아 보세요!<br>
<button class="btn btnPerf">나만의 노트 찾기</button>
</div>
</div>
<div class="text-center" id="pageBtn"> 
   	<button class="btn" type="button" id="nextBtn">다음</button>
    <button class="btn" type="button" id="cancleBtn">취소</button>
</div>
<br><br>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>