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
			error: (error) => {
				reject(error);
			}
		})
	})
}

//아이디 유효성 검사
function checkId(){
	var id = $("#id");
	
	const idFormCheck = RegExp(/^[a-zA-Z0-9-_]{4,12}$/);
	var idWithoutNumber = id.val().replace(/\D/g, '');
	var idWithoutString = id.val().replace(/[0-9]/g, '');
	
	//에러
	if(!idFormCheck.test(id.val()) || idWithoutNumber === "" || idWithoutString === ""){
		id.addClass("is-invalid"); // 오류
		id.removeClass("is-valid"); // 정상
		
		$("#idChk").css("display", "inline");
		$("#idError").css("display", "none");
		$("#valid-id").css("display", "none");
		
		return false;
	}else {//정상
		id.addClass("is-valid");
		id.removeClass("is-invalid");
		
		$("#idChk").css("display", "none");
		$("#idError").css("display", "none");
		
		return true;
	}
}

//아이디 중복 검사
async function checkIdExist(){
	var id= $("#id");
	if(checkId() == false){
		return;
	}
	try{
		const result = await ajaxPost("/user/check/id", {id:id.val()});
		console.log(result);
		if(result === false){
			id.removeClass("is-invalid");
			id.addClass("is-invalid");
			
			$("#idChk").css("display", "none");
			$("#idError").css("display", "none");
			$("#valid-id").css("display", "inline");
			
			return true;
		}else{
			id.removeClass("is-valid");
			id.addClass("is-invalid");
			

			$("#idChk").css("display", "none");
			$("#idError").css("display", "inline");
			$("#valid-id").css("display", "none");
			
			return false;
		}
	}catch(e){
		console.log(e);
		alert("에러 발생 이것이 보인다면 개발자는 또다시 갈립니다.");
	}
}

//이메일 유효성 검사
function checkEmail(){
	var email = $("#email");
	var emailCheck = RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*[.][a-zA-Z]{2,3}$/);
	console.log(emailCheck.test(email.val()));
	if(emailCheck.test(email.val()) == false){
		email.addClass("is-invalid");
		email.removeClass("is-valid");
		
		$("#emailChk").css("display", "inline");
		$("#emailError").css("display", "none")
		
		return false;
	}else{
		email.addClass("is-valid");
		email.remove("is-invalid");
		
		$("#emailChk").css("display", "none");
		$("#emailError").css("display","none");
		
		return true;
	}
}

async function checkEmailExist() {
	var email = $("#email");
	
	if (checkEmail() == false) {
		return;
	}
	
	try {
		const result = await ajaxPost('/user/check/email', {email: email.val()});
		
		if (result === false) {
			//중복되는 이메일 없음
			email.removeClass("is-invalid");
			email.addClass("is-valid");
			
			$("#valid-email").css("display", "inline");
			$("#emailChk").css("display", "none");
			$("#emailError").css("display", "none");
			
			//이메일 체크 패스
			return true;
		} else {
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
		console.log(e);
		alert("에러가 발생했습니다.");
	}
}

//닉네임 공백 검사
function checkNick() {
	
	var nick = $("#nick");
	
	if (nick.val() == "") {
		nick.addClass("is-invalid");
		nick.removeClass("is-valid");
		
		$("#valid-email").css("display", "none");
		$("#nickError").css("display", "none");
		$("#nickChk").css("display", "inline");
		
		return false;
		
	} else {
		nick.addClass("is-valid");
		nick.removeClass("is-invalid");
		
		$("#nickError").css("display", "none");
		$("#nickChk").css("display", "none");
		
		return true;
	}
}

//닉네임 중복 검사
async function checkNickExist() {
	var nick = $("#nick");
	
	if (checkNick() == false) {
		return;
	}
	
	try {
		const result = await ajaxPost('/user/check/nick', {nick: nick.val()});
		
		if (result === false) {
			//중복되는 닉네임 없음
			nick.removeClass("is-invalid");
			nick.addClass("is-valid");
			
			$("#nickError").css("display", "none");
			$("#nickChk").css("display", "none");
			$("#valid-nick").css("display", "inline");
			
			//닉네임 체크 패스
			return true;
		} else {
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

//비밀번호 유효성 / 공백 검사
function checkPw() {
	var pw = $("#pw");

	const pwFormCheck = RegExp(/^[a-zA-Z0-9-_]{8,12}$/); // 대소문자 + 숫자 4~12자
	var pwWithoutNumber = pw.val().replace(/\D/g, ''); // 숫자만
	var pwWithoutString = pw.val().replace(/[0-9]/g, ''); // 문자열만
	
	if(!pwFormCheck.test(pw.val()) || pwWithoutNumber === "" || pwWithoutString === ""){
		pw.addClass("is-invalid"); // 오류
		pw.removeClass("is-valid"); // 정상
	
		$("#pw1Chk").css("display", "inline");
		$("#pw1Error").css("display", "none");
		$("#valid-pw1").css("display", "none");
		
		return false;
	}else if (pw.val() == "") {
		pw.addClass("is-invalid");
		pw.removeClass("is-valid");
		
		$("#pw1Error").css("display", "none");
		$("#pw1Chk").css("display", "inline");
		$("#valid-pw1").css("display", "none");
		
		return false;
	} else {
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
	var pw = $("#pw");
	var pwCheck = $("#pwCheck");
	console.log("pw : ",pw);
	console.log("pwCheck : ", pwCheck);
	if (pw.val() != pwCheck.val()) {
		pwCheck.addClass("is-invalid");
		pwCheck.focus();
		
		$("#pw2Error").css("display", "inline");
		$("#pw2Chk").css("display", "none");
		$("#valid-pw2").css("display", "none");
		
		return false;
		
	} else {
		if (pwCheck.val() == "") {
			pwCheck.removeClass("is-valid");
			pwCheck.removeClass("is-invalid");
				
			return false;
		} else {
			pwCheck.removeClass("is-invalid");
			pwCheck.addClass("is-valid");
			
			$("#pw2Error").css("display", "none");
			$("#pw2Chk").css("display", "none");
			$("#valid-pw2").css("display", "inline");
			
			return true;
		}
	}
}

//생일 공백 검사
function checkBirth() {
	var birth = $("#birth");
	
	if (birth.val() == "") {
		birth.addClass("is-invalid");
		birth.removeClass("is-valid");
		
		return false;
	} else {
		birth.addClass("is-valid");
		birth.removeClass("is-invalid");
		
		return true;
	}
}

//질문 답 공백 검사
function checkAnswer() {
	var	answer = $("#questionAnwser");
	
	if (answer.val() == "") {
		answer.addClass("is-invalid");
		answer.removeClass("is-valid");
		
		return false;
		
	} else {
		answer.addClass("is-valid");
		answer.removeClass("is-invalid");
		
		return true;
	}
}

//가입 버튼 눌렀을 때
async function checked() {
	var isvalid = true;
	
 	if (checkEmail() == false) isvalid = false;
	else if (await checkEmailExist() == false) isvalid = false;
	else $("#valid-email").css("display", "inline");
	
	if (checkPwCheck() == false) isvalid = false;
	
	if (checkPw() == false) isvalid = false;
	
	if (checkNick() == false) isvalid = false;
	else if (await checkNickExist() == false) isvalid = false;
	else $("#valid-nick").css("display", "inline");
	
	if (checkId() == false) isvalid = false;
 	else if (await checkIdExist() == false) isvalid = false;
	else $("#valid-id").css("display", "inline");
	
	if (checkBrith() == false) isvalid = false;
	
	if (checkAnswer() == false) isvalid = false;
	
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
					alert("회원가입에 성공했습니다!");
					
					// 리다이렉션
					window.location.replace("/user/main");
				} else {
					// 회원가입 실패
					alert("회원가입에 실패했습니다.");
				}
			},
			error: function(xhr, status, error) {
				alert(error);
			}
		})
	}
}

$(document).ready(function(){
	var joinCnt = 0;

	$("#agree_all").change(function(){
		//대상이 체크된 상태일때
		if($(this).is(":checked")){
			$(".chkSub").attr("checked", true);
		}else{
			$(".chkSub").attr("checked", false);
		}
	});
	
	$("#nextBtn").click(function(){
		console.log("#joinBtn clicked");
		if(joinCnt == 0 ){
			console.log("약관 동의 완료");
			joinCnt++;
			$("#info").css("color", "black");
			$("#agree").css("color", "#877b9e");
			$("#agreement").css("display", "none");
			$("#join-form").css("display", "inline");
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
	
	//가입 버튼 클릭 시 form submit
	$("#btnSubmit").click(function() {
		//가입 버튼 눌렀을 때
		submit();
	})
	$("#cancleBtn").click(function(){
		if(joinCnt == 0 ){
			joinCnt--;
			$(history).go(-1);
			
		}else if(joinCnt == 1){
			
			console.log("정보 입력 취소");
			joinCnt--;
			$("#info").css("color", "black");
			$("#agree").css("color", "#877b9e");
			$("#agreement").css("display", "inline");
			$("#joinForm").css("display", "none");
			$("#info").css("color", "#877b9e");
			$("#agree").css("color", "black");
		}
	})
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

    $(function() {
        $("#birth").datepicker();
    });
    
    //입력이 안료되었을 때 호출
    //유효성 검사 / 공백 체크 / 중복 체크
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
   
   
})

</script>
<style>
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
#join-form { 
 	display: none; 
} 

#agree {
	color: black;
}

.form-control {
	width:500px;
}

</style>
<div class="container">
<div class="text-center" id="pageName">
<h1 id="ltitle"><span id="agree">약관 동의</span> <i class="fas fa-angle-right"></i> <span id="info">정보 입력</span> <i class="fas fa-angle-right"></i> <span id="sms">메일 인증</span></h1>
<hr>
</div>
<div class="text-center" id="agreement">
<div class="text-center">
<label for="agree_all">
  <input type="checkbox" class="chkSub" id="agree_all">
  <span>모두 동의합니다</span>
</label>
</div>
<div class="text-center">
<label for="agree">
  <input type="checkbox" class="chkSub" name="chkBox" value="1">
  <span>이용약관 동의<strong>(필수)</strong><br></span>
</label>
<label for="agree">
  <input type="checkbox" class="chkSub" name="chkBox" value="2">
  <span>개인정보 수집, 이용 동의<strong>(필수)<br></strong></span>
</label>
<label for="agree">
  <input type="checkbox" class="chkSub" name="chkBox" value="3">
  <span>개인정보 이용 동의<strong>(필수)</strong><br></span>
</label>
<label for="agree">
  <input type="checkbox" class="chkSub" value="4">
  <span>이벤트, 혜택정보 수신동의<strong class="select_disable">(선택)<br></strong></span>
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
<input type="text" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');" class="form-control" id="phone" name="phone" placeholder="'-'없이 11자리 입력">
<span id="phoneChk" class="error col-xs-offset-3 feedback">'-'를 제외한 11자리의 전화번호를 입력해주세요</span>
<span id="nickError" class="error col-xs-offset-3 feedback">이미 존재하는 닉네임입니다.</span>
<span id="valid-nick" class="valid col-xs-offset-3 feedback">사용가능한 닉네임입니다.</span>
<br><br>

<label for="email" class="col-xs-3 control-label">이메일 </label>
<input  type="email" class="form-control" id="email" name="email" placeholder="ex) asdf1234@gmail.com">
<span id="emailChk" class="error col-xs-offset-3 feedback">asd123@gmail.com의 형식이여야 합니다.</span>
<span id="emailError" class="error col-xs-offset-3 feedback">이미 존재하는 이메일입니다.</span>
<span id="valid-email" class="valid col-xs-offset-3 feedback">사용가능한 이메일입니다.</span>
<br><br>

<label for="gender" class="col-xs-3 control-label">성별 </label>
<input type="radio" name="gender" value="F" id="female" checked="checked"/> <label id="woman">여성</label>
<input type="radio" name="gender" value="M" id="male"/> <label id="male">남성</label><br>
<br><br>

<label for="birth" class="col-xs-3 control-label">생일 </label>
<input type="text" class="form-control" id="birth" name="birth" placeholder="birth">
<span id="birthChk" class="error col-xs-offset-3 feedback">생일을 선택해주세요</span>
<span id="valid-birth" class="valid col-xs-offset-3 feedback">선택 되었습니다.</span>
<br><br>

<label for="questionAnwser" class="col-xs-3 control-label">자주묻는 질문 </label>
<select id="questionNo" name="questionNo" style="width:500px;">
      <option value="1">내가 좋아하는 캐릭터(인물)는?</option>
      <option value="2">다시 태어나면 되고 싶은 것은?</option>
      <option value="3">가장 감명깊게 본 영화는?</option>
      <option value="4">자신의 보물 1호는?</option>
      <option value="5">받았던 선물중에 가장 기억에 남는 선물은?</option>
      <option value="6">읽은 책 중에서 가장 좋아하는 구절은?</option>
</select>
<input type="text" class="col-xs-offset-3 form-control" id="questionAnwser" name="questionAnwser" placeholder="질문에 답을 입력해주세요"> 
<br>
<span id="answerChk" class="error col-xs-offset-3 feedback">답을 입력해주세요</span>
<span id="valid-answer" class="valid col-xs-offset-3 feedback">선택 되었습니다.</span>
<br>
</form>

<div class="text-center"> 
   	<button class="btn btn-primary" type="button" id="nextBtn">다음</button>
    <button class="btn btn-danger" type="button" id="cancleBtn">취소</button>
</div>
<br><br>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>