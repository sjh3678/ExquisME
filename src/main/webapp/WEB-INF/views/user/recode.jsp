<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
$(document).ready(function(){
	$("#into-extagram").click(function(){
		var curPage
		$.ajax({
			type: "get",
			data: {},
			dataType: "html",
			url: "/user/recode/extagram",
			success: function(res){
				console.log("AJAX 성공");
				$("#historyArea").html(res);
			}, error: function(e){
				console.log(e)
			}
		});
	})
})
</script>
<style type="text/css">
ul{
	list-style-type: none;
	font-size: 20px;
}
li{
	float: left;
	margin-left:50px;
}
.indexArea{
	width:100%;
	height: 5%;
	background-color: #34ebe1;
	border-radius: 15px;
}
.into-extagram:hover{
	background-color:rgba(0, 0, 0, 0.2);/*까만색(0,0,0) 80% 투명도*/
}
.into-comment:hover{
	background-color:rgba(0, 0, 0, 0.2);/*까만색(0,0,0) 80% 투명도*/
}
</style>
<div class="indexArea">
<ul class="historyIndex">
	<li class="into-extagram" id="into-extagram">Extagram 기록</li>
	<li class="into-comment" id="into-comment">댓글 기록</li>
</ul>
</div>
<div id="historyArea">
</div>
