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
				$("#rightArea").html(res);
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
			$("#modal").css("display", "inline");
		}else{
			$.ajax({
				type: "get"
				, url: "/user/pw/update"
				, data: {}
				, dataType: "html"
				, success: function(res){
					console.log("AJAX 성공");
					$("#rightArea").html(res);
				}, error: function(error){
					console.log("AJAX 실패")
					console.log(error);
				}
			});
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
					console.log("AJAX 성공");
					$("#rightArea").html(res);
					
				}, error: function(error){
					console.log("AJAX 실패")
					console.log(error);
				}
			})
		}
	});
	
	$("#checkBtn").click(function(){
		console.log("인증버튼 눌림 ");
		var pw = $("#pw");
		$.ajax({
			type: "post",
			url: "/user/check/password",
			data: {pw:pw.val()},
			dataType: "json",
			success : function(res){
				console.log(res);
				if(res == false){
					console.log("인증 실패")
					alert("인증 실패")
					authkey = 0;
				}else{
					console.log("인증 확인됨")
					authkey = 1;	
					$("#modal").css("display", "none")
				}
			}, error : function(error){
				console.log(error)
			}
		})
		
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
	height: 800px;
	background-color: #8A7E6B;
	border-radius: 10px;
	text-align: center;
}
#leftArea div{
	color: #35312B;
	width: 90%;
	margin: 0 auto;
	margin-top: 15px;
	font-size: 18px;
	font-weight: 400;
	background-color: #ECE6CC;
	border-radius: 10px;
	text-align: left;
	cursor: pointer;
}
#leftArea div:hover{
	background-color: #35312B;
	color: #ECE6CC;
}
#rightArea {
	float: right;
	width: 69%;
	height: 800px;
	background-color: #ECE6CC;
	border-radius: 10px;
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
.pageList{
	font-size:20px;
}
.container{
	margin: 0 auto;
	padding-right: 0;
	padding-bottom:20px;
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
<div class="container">
<h1>마이페이지</h1>
<hr>
<div class="text-center">
<div id="leftArea">
	<div id="profile">&nbsp;&nbsp;<i class="fas fa-user-circle"></i>&nbsp;프로필 수정</div>
	<div id="recode">&nbsp;&nbsp;<i class="fas fa-history"></i>&nbsp;개인 기록</div>
	<div id="changePw">&nbsp;&nbsp;<i class="fas fa-lock"></i>&nbsp;비밀번호 변경</div>
	<div id="deleteInfo">&nbsp;&nbsp;<i class="fas fa-lock"></i>&nbsp;회원탈퇴</div>
</div>

<div class="modal" id="modal">
<div class="modal_body" id="modal-body">
	<div class="text-right">
		<input style="margin: 5px;" type="button" class="btn" id="close-modal" value="닫기">
	</div>
	<label for="pw">비밀번호 확인</label>
	<input style="width: 200px; margin: auto; margin-bottom: 6px;" type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호를 입력하세요.">
	<button style="margin-left: 10px;"type="button" class="btn" id="checkBtn">인증</button>
</div>
</div>

<div id="rightArea">

</div>

</div>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>