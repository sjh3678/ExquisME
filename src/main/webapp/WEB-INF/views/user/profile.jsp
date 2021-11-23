<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">

<script type="text/javascript">
//ajax 통신
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

//인증키 검사
async function authKeyCheck(){
	var authKey = $("#emailCheck")
	console.log(authKey);
	var result = await ajaxPost("/user/session/call", {authKey:authKey.val()});
	if(result){
		$("#sendSucess").removeClass("invisible")
		$("#sendFail").addClass("invisible");
	}else{
		$("#sendSucess").addClass("invisible");
		$("#sendFail").removeClass("invisible");
		
		$("#emailCheck").val() = "";
		$("#email.Check").focus();
	}
	return result;
}

//이메일 유효성 검사
function checkEmail(){
	console.log("이메일 유효성 검사");
	
	var email = $("#email");
	var emailCheck = RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*[.][a-zA-Z]{2,3}$/);
	console.log(emailCheck.test(email.val()));
	
	if(emailCheck.test(email.val()) == false){
		console.log("유효하지 않은 이메일형식");
		
		$("#emailChk").removeClass("invisible");
		$("#emailError").addClass("invisible");
		
		$("#email").val() = "";
		$("#email").focus();
		
		return false;
	}else{
		console.log("유효한 이메일 형식");
		
		$("#emailChk").removeClass("invisible");
		$("#emailError").addClass("invisible");
		
		return true;
	}
}

//이메일 중복 검사
async function checkEmailExist() {
	console.log("이메일 중복 검사");
	
	var email = $("#email");
	
	if (checkEmail() == false) {
		console.log("유효하지 않은 이메일형식");
		
		$("#emailChk").removeClass("invisible");
		$("#emailError").addClass("invisible");
		$("#valid-email").addClass("invisible");
		
		$("#email").val() = "";
		$("#email").focus();
		
		return false;
	}
	
	try {
		const result = await ajaxPost('/user/check/email', {email: email.val()});
		
		if (result === false) {
			//중복되는 이메일 없음
			console.log("사용가능한 이메일");
			$("#emailChk").addClass("invisible");
			$("#emailError").addClass("invisible");
			$("#valid-email").removeClass("invisible");
			$("#sendMail").removeClass("invisible");
			//이메일 체크 패스
			return true;
		} else {
			console.log("이미 존재하는 이메일");
			
			// 중복되는 이메일 있음
			$("#emailChk").addClass("invisible");
			$("#emailError").removeClass("invisible");
			$("#valid-email").addClass("invisible");
			
			email.val() = "";
			email.focus();
			
			//이메일 체크 패스못함
			return false;
		}
	} catch (e) {
		console.log(e);
	}
}
//인증키 메일 발송
async function sendMail(){
	console.log("인증 메일 전송");
	
	$("#sendMail").addClass("invisible");
	console.log("메일 발송 버튼 사라짐");
	var mail = $("#email"); //사용자의 이메일 입력값.
	try {
		$("#emailCheckLabel").removeClass("invisible");
		$("#emailCheck").removeClass("invisible");
		$("#isVailEmail").removeClass("invisible");
	
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

//닉네임 공백 검사
function checkNick() {
	console.log("닉네임 공백 검사")
	
	var nick = $("#nick");
	var pattern = /\s/g;
	
	if (nick.val() == "") {
		console.log("닉네임 공백")
		
		$("#valid-nick").addClass("invisible");
		$("#nickError").addClass("invisible");
		$("#nickChk").removeClass("invisible");
		$("#nick").val() = "";
		
		return false;
		
	}else if(nick.val().match(pattern)){
		console.log("스페이스바는 문자로 취급되지 않습니다.")
		
		$("#valid-nick").addClass("invisible");
		$("#nickError").addClass("invisible");
		$("#nickChk").removeClass("invisible");
		
		return false;
		
	}else {
		console.log("유효한 닉네임 형식");
		
		$("#nickError").addClass("invisible");
		$("#nickChk").addClass("invisible");
		
		return true;
	}
}

//닉네임 중복 검사
async function checkNickExist() {
	console.log("닉네임 중복검사");
	
	var nick = $("#nick");
	
	if (checkNick() == false) {
		console.log("닉네임 공백이거나 공백문자")
		
		$("#valid-nick").addClass("invisible");
		$("#nickError").addClass("invisible");
		$("#nickChk").removeClass("invisible");
		
		return;
	}
	
	try {
		const result = await ajaxPost('/user/check/nick', {nick: nick.val()});
		
		if (result === false) {
			$("#valid-nick").removeClass("invisible");
			$("#nickError").addClass("invisible");
			$("#nickChk").addClass("invisible");
			//닉네임 체크 패스
			return true;
		} else {
			console.log("닉네임 중복")
			
			$("#valid-nick").addClass("invisible");
			$("#nickError").removeClass("invisible");
			$("#nickChk").addClass("invisible");
		
			//이메일 체크 패스못함
			return false;
		}
	} catch (e) {
		console.log(e);
	}
}

//전화번호 유효성 검사
function telValidator() {
	console.log("전화번호 검사")
    var phone = $("#phone")
    
    if (/^[0-1]{3}-[0-9]{4}-[0-9]{4}/.test(phone.val())) {
    	console.log("유효한 전화번호 형식")
    	
    	phone.addClass("is-valid");
    	phone.removeClass("is-invalid");
    	
    	$("#phoneChk").addClass("invisible");
		$("#valid-phone").removeClass("invisible");
		
        return true;
    }
	console.log("유효하지 않은 전화번호 형식")
    $("#phoneChk").removeClass("invisible");
	$("#valid-phone").addClass("invisible");
	
    return false;
}

//생일 공백 검사
function checkBirth() {
	console.log("생일 공백 검사")

	var pattern = /\s/g;// 스페이스바 거르기
	var birth = $("#birth");
	
	if (birth.val() == "") {
		console.log("생일 공백");
		
		$("#birthChk").removeClass("invisible");
		$("#valid-birth").addClass("invisible");

		return false;
		
	} else if(birth.val().match(pattern)){
		console.log("생일 형식이 공백 문자")
		
		$("#valid-birth").addClass("invisible");
		$("#birthChk").removeClass("invisible");
		
		return false;
		
	} else {
		console.log("유효한 생일 형식")
		birth.addClass("is-valid");
		birth.removeClass("is-invalid");
		
		$("#birthChk").addClass("invisible");
		$("#valid-birth").removeClass("invisible");		
		
		return true;
	}
}

//수정 버튼 눌렀을 때
async function checked() {
	console.log("가입버튼 눌림");
	var isvalid = true;
	
	if (checkEmail() == false) isvalid = false;
	else if (await checkEmailExist() == false) isvalid = false;
 	else $("#valid-email").css("display", "inline");
	console.log(isvalid);
 	
	if (checkNick() == false) isvalid = false;
	else if (await checkNickExist() == false) isvalid = false;
	else $("#valid-nick").css("display", "inline");
	console.log(isvalid);
	
	if (checkBirth() == false) isvalid = false;
	console.log(isvalid);
	
	if(authKeyCheck() == false) isvalid = false;
	
	return isvalid;
}

async function submit() {
	if (await checked() == true) {
		$("#update-form").submit();
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
	
	//파일 바뀔때 - 1개만
	$("#file").on("change", handleImgFileSelect);
	
	//파일 형식 검사 미리보기
	function handleImgFileSelect(e) {
	    var files = e.target.files;
	    var filesArr = Array.prototype.slice.call(files);

	    var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;

	    filesArr.forEach(function(f) {
	        if (!f.type.match(reg)) {
	            alert("확장자는 이미지 확장자만 가능합니다.");
	            return;
	        }

	        sel_file = f;

	        var reader = new FileReader();
	        reader.onload = function(e) {
	        	$(".pre-show").removeClass("invisible");
	            $("#img").attr("src", e.target.result);
	        }
	        reader.readAsDataURL(f);
	    });
	}
	
	$("#birth").click(function() {
        $("#birth").datepicker();
    });
	
	$("#birth").change(function(){
    	checkBirth()
    })
    
	$("#email").blur(function(){
		var isCheck = checkEmailExist();
// 		$(".keyCheck").removeClass("invisible");
		if(isCheck == false){
			console.log("이메일 중복");
		}else{
			console.log("이메일 체크 완료")
		}
	});
	$("#nick").blur(function(){
		checkNickExist();
	})
	$("#phone").blur(function(){
		telValidator();
	})
	$("#sendMail").click(function(){
		console.log("인증 메일 발송")
		sendMail();//인증메일 발송
		$(".keyCheck").removeClass("invisible");
	});
	
	$("#isVailEmail").click(function(){
		console.log("인증키 눌림");
		authKeyCheck();
	})
	
	$("#modifyBtn").click(function(){
		$(".info-write").removeClass("invisible");
		$("input[name=file]").css("display", "inline");
		$(".info-show").addClass("invisible");
	})
	
	$("#cancleBtn").click(function(){
		$(".info-write").addClass("invisible");
		$("input[name=file]").css("display", "none");
		$(".info-show").removeClass("invisible");
		$(".keyCheck").addClass("invisible");
		$("#sendMail").addClass("invisible");
	})
	
	$("#updateBtn").click(function(){
		console.log("수정 버튼 눌림")
		var isCheck = checked();
		if(isCheck){
			console.log("회원정보 수정 요청")
			submit();
		}else{
			alert("요소 중 오류가 있습니다.")
		}
	})
})
</script>

<style>
.error {
	color: red;
}

.valid {
	color: green;
}

.invisible {
	display: none;
}

.imgBox {
	width: 150px;
	height: 150px;
	border-radius: 70%;
	overflow: hidden;
	margin: 0 auto;
}

.profile {
	width: 100%;
	height: 100%;
	oject-fit: cover;
}

.info {
	font-size: 15px;
}

.info-show {
	font-size: 15px;
}

.info-write {
	font-size: 15px;
}

.button {
	background-color: #036bfc;
	color: white;
	border-radius: 8px;
}

#title {
	margin: 0 auto;
}

input[name=file] {
	display: none;
}

.infoTable {
	border-collapse: separate;
	border-spacing: 0 10px;
	table-layout: fixed;
	margin-left: auto;
	margin-right: auto;
	text-overflow: ellipsis;
	overflow: hidden;
}
</style>
<div id="title">
	<h3>${user.nick }님의프로필</h3>
	<hr>
	<br>
	<br>
	<hr>
</div>
<div id="infoArea">
	<form action="/user/profile" method="post" enctype="multipart/form-data" id="update-form">
		<!-- 보여지는 프로필 사진 -->
		<div class="imgBox" id="profile-show">
			<img class="info-show profile" src="/upload/${file.storedName}">
		</div>
		
		<!-- 업로드시 보이는 파일 업로드 창 -->
		<div id="profile-file" class="info-write invisible">
			<input class="info-write" type="file" name="file" id="file" value="${file.storedName }" />
			<div class="imgBox" id="profile-show">
				<img id="img" class="pre-show profile" width="200px" height="200px;" />
			</div>
		</div>

		<table class="infoTable">
			<tbody>
				<tr>
					<td class="info">이메일</td>
					<c:choose>
						<c:when test="${user.email ne null }">
							<td class="info-show" id="email-show">&nbsp;&nbsp;${user.email }</td>
						</c:when>
						<c:when test="${user.email eq null }">
							<td class="info-show" id="email-show">&nbsp;&nbsp;설정된 이메일이
								없습니다.</td>
						</c:when>
					</c:choose>
					<td class="info-write invisible" id="email-write">&nbsp;&nbsp;<input
						type="text" id="email" name="email"></td>
					<td class="info-write">
						<span id="emailChk" class="error invisible">asd123@gmail.com의 형식이여야 합니다.</span> 
						<span id="emailError" class="error invisible">이미 존재하는 이메일입니다.</span> 
						<span id="valid-email" class="valid invisible">사용가능한 이메일입니다.</span>
					</td>
					
					<td class="sendMail">
						<button id="sendMail" class="button invisible" type="button">인증번호 받기</button>
					</td>
				</tr>

				<tr class="keyCheck invisible">
					<td><label for="emailCheck" id="emailCheckLabel"
						class="info-write ">인증번호 </label></td>
					<td>&nbsp;&nbsp;<input id="emailCheck" type="text"
						class="info-write" name="emailCheck"
						placeholder="메일을 확인하여 인증번호를 입력하세요"></td>
					<td><button id="isVailEmail" class="button invisible"
							type="button">인증</button></td>
					<td class="info-write">
						<span id="sendSucess" class="valid invisible">인증되었습니다.</span>
						<span id="sendFail" class="error invisible">인증번호가 일치하지않습니다.</span>
					</td>
				</tr>
				<tr>
					<td class="info">닉네임</td>
					<c:choose>
						<c:when test="${user.nick ne null }">
							<td class="info-show">&nbsp;&nbsp;${user.nick }</td>
						</c:when>
						<c:when test="${user.nick eq null }">
							<td class="info-show">&nbsp;&nbsp;설정된 닉네임이 없습니다.</td>
						</c:when>
					</c:choose>
					<td class="info-write invisible">&nbsp;&nbsp;<input
						type="text" name="nick" id="nick"></td>
					<td class="info-write">
						<span id="nickChk" class="error invisible">닉네임을 입력해주세요</span> 
						<span id="nickError" class="error invisible">이미 존재하는 닉네임입니다.</span> 
						<span id="valid-nick" class="valid invisible">사용가능한 닉네임입니다.</span>
					</td>
				</tr>

				<tr>
					<td class="info">전화번호</td>
					<c:choose>
						<c:when test="${user.phone ne null }">
							<td class="info-show">&nbsp;&nbsp;${user.phone }</td>
						</c:when>
						<c:when test="${user.phone eq null }">
							<td class="info-show">&nbsp;&nbsp;설정된 전화번호 데이터가 없습니다.</td>
						</c:when>
					</c:choose>
					<td class="info-write invisible">&nbsp;&nbsp;<input type="text" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');" id="phone" name="phone" placeholder="'-'포함한 13자리 입력"></td>
					<td class="info-write">
						<span id="phoneChk" class="error invisible">'-'를 포함한 13자리 조합.</span> 
						<span id="valid-phone" class="valid invisible">유효한 전화번호 입니다.</span>
					</td>
				</tr>

				<tr>
					<td class="info">생일</td>
					<c:choose>
						<c:when test="${user.birth ne null }">
							<td class="info-show">&nbsp;&nbsp;<fmt:formatDate
									value="${user.birth }" pattern="yyyy년 MM월 dd일" /></td>
						</c:when>
						<c:when test="${user.birth eq null }">
							<td class="info-show">&nbsp;&nbsp;설정된 생일 데이터가 없습니다.</td>
						</c:when>
					</c:choose>
					<td class="info-write invisible">&nbsp;&nbsp;<input type="text" readonly id="birth" name="birth"></td>
					<td class="info-write">
						<span id="birthChk" class="error invisible">생일을 선택해주세요.</span> 
						<span id="valid-birth" class="valid invisible">선택 되었습니다.</span>
					</td>
				</tr>
				<tr>
					<td class="info">생성일</td>
					<td class="info">&nbsp;&nbsp;<fmt:formatDate
							value="${user.createDate }" pattern="yyyy년 MM월 dd일" />
					<td>
				</tr>
				<tr>
					<td class="info">성별</td>
					<c:choose>
						<c:when test="${user.gender ne null }">
							<c:if test="${user.gender eq 'F' }">
								<td class="info-show">&nbsp;&nbsp;<i class="fas fa-venus"></i></td>
							</c:if>
							<c:if test="${user.gender eq 'M' }">
								<td class="info-show">&nbsp;&nbsp;<i class="fas fa-mars"></i></td>
							</c:if>
						</c:when>
						<c:when test="${user.gender eq null }">
							<td class="info-show">&nbsp;&nbsp;<i class="fas fa-ban"></i></td>
						</c:when>
					</c:choose>
					<td class="info-write invisible">&nbsp;&nbsp;
						<input type="radio" checked="checked" name="gender" value="F" id="female">
						<label for="female">여성</label>&nbsp;&nbsp; 
						<input type="radio" name="gender" value="M" id="male"> <label for="male">남성</label>
					</td>
				</tr>
			</tbody>
		</table>
		<button id="modifyBtn" class="info-show" type="button">수정하기</button>
		<button class="info-write invisible" id="updateBtn" type="button">수정</button>
		<button class="info-write invisible" id="cancleBtn" type="button">취소</button>
	</form>
</div>


<hr>