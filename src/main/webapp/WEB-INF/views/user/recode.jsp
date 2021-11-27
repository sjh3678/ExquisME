<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
function getExtaList(curPage){
	console.log("받은 값 : ",curPage);
	$.ajax({
		type: "get",
		data: {curPage:curPage},
		dataType: "html",
		url: "/user/recode/extagram",
		success: function(res){
			console.log("AJAX 성공");
			$("#historyArea").html(res);
		}, error: function(e){
			console.log(e)
		}
	});
}

function getCommList(curPage){
	console.log("받은 값 : ",curPage);
	$.ajax({
		type: "get",
		data: {curPage:curPage},
		dataType: "html",
		url: "/user/recode/comment",
		success: function(res){
			console.log("AJAX 성공");
			$("#historyArea").html(res);
		}, error: function(e){
			console.log(e);
		}
	});
}

function getLayerList(curPage){
	console.log("받은 값 : ",curPage);
	$.ajax({
		type: "get",
		data: {curPage:curPage},
		dataType: "html",
		url: "/user/recode/layer",
		success: function(res){
			console.log("AJAX 성공");
			$("#historyArea").html(res);
		}, error: function(e){
			console.log(e);
		}
	});
}

$(document).ready(function(){
	$("#into-extagram").click(function(){
		 getExtaList(1);
	})
	
	$("#into-comment").click(function(){
		getCommList(1);
	})
	$("#into-layer").click(function(){
		getLayerList(1);
		
	})
})

</script>
<style type="text/css">
.indexArea{
	width: 95%;
	height: 5%;
	background-color: #8A7E6B;
	font-size: 18px;
	border-radius: 15px;
	margin: 10px auto;
}
.btnHistory{
	width: 150px;
	margin: 3px 10px;
}
.btnHistory:hover{
	transform: scale(1.1);
	background: #35312B;
}
.btnDetail{
	background: #8A7E6B;
	color: #ECE6CC;
}
.btnDetail:hover{
	transform: scale(1.1);
	background: #35312B;
}
.pagingArea li{
	border-radius: 5px;
	background: #8A7E6B;
    width: 20px;
    color: #ECE6CC;
    text-align: center;
    cursor: pointer;
}
.pagingArea li:hover{
	background: #35312B;
}
table{
	font-size: 12px;
}
.table-striped>tbody>tr:nth-of-type(odd) {
    background-color: rgb(138, 126, 107, 0.2);
}
</style>
<div class="indexArea">
	<button class="btn btnHistory into" id="into-extagram">Extagram 작성 내역</button>
	<button class="btn btnHistory into" id="into-comment">댓글 작성 내역</button>
	<button class="btn btnHistory into" id="into-layer">Layer 등록 내역</button>
</div>
<div id="historyArea">
</div>
