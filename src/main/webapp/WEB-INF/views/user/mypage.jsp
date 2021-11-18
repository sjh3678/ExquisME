<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
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

//비밀번호 인증 모달창 (비)활성화
async function checkPw(pw){
	var modal = $("#modal");
	console.log("비밀번호 인증 시작")
	const result = await ajaxPost("/user/check/password", {pw:pw.val()});
	if(result == true){
		console.log("인증 성공")
		$("#modal").css("display", "none");
		return true;
	}else{
		console.log("인증 실패")
		return false;
	}
}

$(document).ready(function(){
	var authkey = 0;
	
	$("#profile").click(function(){
		console.log("#profile clicked")
		$.ajax({
			type: "get"
			, url: "/user/profile"
			, data: {}
			, dataType: "html"
			, success: function(res){
				console.log("AJAX 성공");
				$("#rightArea").html(res)
			}, error: function(){
				console.log("AJAX 실패");
			}
		})
	})
	
	$("#recode").click(function(){
		console.log("#hitory clicked")
		$.ajax({
			type: "get"
			, url: "/user/recode"
			, data: {}
			, dataType: "html"
			, success: function(res){
				console.log("AJAX 성공");
				$("#rightArea").html(res);
			}, error: function(error){
				console.log("AJAX 실패");
				console.log(error);
			}
		})
	})
	
	$("#changePw").click(function(){
		console.log("cheangePw clicked");
		if(authkey == 0){
			$("#modal").css("display", "inline")
		}else{
			$.ajax({
				type: "get"
				, url: "/user/pw/update"
				, data: {}
				, dataType: "html"
				, success: function(res){
					console.log("AJAX 성공")
					$("#rightArea").html(res);
				}, error(error){
					console.log("AJAX 실패")
					console.log(error);
				}
			})
		}
	})
		
		
	$("#deleteInfo").click(function(){
		console.log("deleteInfo clicked");
		if(authkey == 0){
			$("#modal").css("display", "inline")
		}else{
			$.ajax({
				type: "get"
				, url: "/user/delete"
				, data: {}
				, dataType: "html"
				, success: function(res){
					console.log("AJAX 성공")
					$("#rightArea").html(res);
				}, error(error){
					console.log("AJAX 실패")
					console.log(error);
				}
			})
		}
	});
	
	$("#checkBtn").click(function(){
		console.log("인증버튼 눌림 ");
		var pw = $("#pw");
		console.log(pw.val());
		var isCheck = checkPw(pw);
		console.log(isCheck);
		if(isCheck){
			console.log("인증 성공");
			authkey = 1;
		}else{
			console.log("인증 실패");
			authkey = 0;
		}
	})

	$("#close-modal").click(function(){
		$('#modal').css("display", "none");
	})
});

</script>
<style type="text/css">
#leftArea {
	float: left;
	width: 30%;
	height: 100%;
}
#rightArea {
	float: right;
	width: 68%;
	height: 100%;
}
.modal {
  position: absolute;
  top: 0;
  left: 0;

  width: 100%;
  height: 100%;

  display: none;

  background-color: rgba(0, 0, 0, 0.4);
}

.modal.show {
  display: block;
}

.modal_body {
  position: absolute;
  top: 50%;
  left: 50%;

  width: 300px;
  height: 150px;
  text-align: center;

  background-color: rgb(255, 255, 255);
  border-radius: 10px;
  box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

  transform: translateX(-50%) translateY(-50%);
}
.pwCheck{
	margin:0 auto;
}
.pageList{
	font-size:20px;
}
</style>
<div class="container">
<div class="text-center">
<h1>마이페이지</h1>
<hr>
<div id="leftArea">
<table class="table">
<tr>
	<td class="pageList"><span id="profile"><i class="fas fa-user-circle"></i>&nbsp;프로필 수정</span></td>
</tr>
<tr>
	<td class="pageList"><span id="history"><i class="fas fa-history"></i>&nbsp;개인 기록</span></td>
</tr>
<tr>
	<td class="pageList"><span id="changePw"><i class="fas fa-lock"></i>&nbsp;비밀번호 변경</span></td>
</tr>
<tr>
	<td class="pageList"><span id="deleteInfo"><i class="fas fa-lock"></i>&nbsp;회원탈퇴</span></td>
</tr>
</table>

</div>
<div class="modal" id="modal">
<div class="modal_body" id="modal-body">
<div class="text-right">
<input type="button" class="btn btn-danger" id="close-modal" value="X">
</div>
<table class="pwCheck">
<tr>
	<td><label for="pw">비밀번호 확인</label></td>
</tr>

<tr>
	<td><input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호를 입력하세요"></td>
	<td><button type="button" class="btn btn-primary" id="checkBtn">인증</button><br></td>
</tr>
</table>


</div>
</div>
<div id="rightArea">

</div>

</div>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>