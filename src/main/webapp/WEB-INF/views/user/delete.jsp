<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function(){
	$("#yes").click(function(){
		console.log("#yes clicked")
		$.ajax({
			type: "post"
			, url: "/user/delete"
			, data: {}
			, dataType: "json"
			, success: function(res){
				console.log("AJAX 성공");
				$(location).attr('href', '/user/mypage')

			}, error: function(error){
				console.log("AJAX 실패");
				console.log(error)
			}
		})
	})
	$("#no").click(function(){
		console.log("#no clicked")
		$(location).attr('href', '/user/mypage')
	})
})
</script>
<style type="text/css">

</style>
<div style="margin-top:300px;">
<div style="margin: 50px;">탈퇴하셔도 활동하셨던 내역은 유지되며 이후 삭제나 수정하실 수 없습니다.<br>정말 탈퇴하시겠습니까?<br></div>
<button class="btn btnProfile" type="button" id="yes">예</button>&nbsp;&nbsp;<button class="btn btnProfile" type="button" id="no">아니오</button>
</div>