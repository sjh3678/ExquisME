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
<div>
<span>회원 탈퇴를 진행하시겠습니까?</span><br>
<button type="button" id="yes">예</button>&nbsp;&nbsp;<button type="button" id="no">아니오</button>
</div>