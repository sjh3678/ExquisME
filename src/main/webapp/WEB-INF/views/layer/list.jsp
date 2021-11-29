<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function(){
	
	$(".btnFunction").click(function(){
		
		if($("#like").css("display") === "none"){
			$("#like").show();
			$("#last").hide();
			return false;
		}
		
		if($("#last").css("display") === "none"){
			$("#last").show();
			$("#like").hide();
			return false;
		}
	})
	
	loadList(); //init list
	

	$("#last").click(function(){
		target = 1;
		var curPage = 1;
		console.log("#ajax clicked")
		$.ajax({
			type: "get"
			, url: "/layer/list_ok"
			, data: {
			curPage: curPage++	
			, target: target
			}
			, dataType: "html"
			, success: function(res){
				console.log("AJAX 성공")	
				result.innerHTML = res;
				console.log( res )	
			}
			, error: function(res){
				console.log("AJAX 실패")	
			}
		})
		
	})
	
	$("#like").click(function(){
		target = 2;
		var curPage = 1;
		console.log("#ajax clicked")
		$.ajax({
			type: "get"
			, url: "/layer/list_ok"
			, data: {
			curPage: curPage++	
			, target: target
			}
			, dataType: "html"
			, success: function(res){
				console.log("AJAX 성공")	
				result.innerHTML = res;
				console.log( res )	
			}
			, error: function(res){
				console.log("AJAX 실패")	
			}
		})
		
	})
	

//Javascript
var count = 0;
//스크롤 바닥 감지
window.onscroll = function(e) {
    //추가되는 임시 콘텐츠
    //window height + window scrollY 값이 document height보다 클 경우,
    if(bool_sw){
	    if((window.innerHeight + window.scrollY + 1) >= document.body.offsetHeight) {
	    	//실행할 로직 (콘텐츠 추가)
		    	loadList();
	        //$('#result').append(addContent);
	    }
    }
};

});

var target = null;
var curPage = 1;
function loadList() {
	bool_sw = false;
	$.ajax({
		type: "get"
		, url: "/layer/list_ok"
		, data: { 
		curPage: curPage++
		, target: target
		}
		, dataType: "html"
		, success: function(res){
			console.log("AJAX 성공")
			result.innerHTML += res;
// 			$("#result").html( $("#result").html() + res );
		}
		, error: function(){
			console.log("AJAX 실패")
		}
	})
	setTimeout(function(){bool_sw = true;},500)
	$("#cur").html(curPage)
};


// function loadLike(e) {
// 	var layeringNo = e;
// 	console.log(layeringNo);
// boolean login = (boolean) session.getAttribute("login");
var login = false;
	if (${login eq true }) {
		login = true;
	}
function loadLike( layeringNo ) {
	if (login == true) {
	
		var $layeringBox = $("[data-layering_no=" + layeringNo + "]");
	// 	console.log( layeringBox )
	// 	console.log( $layeringBox.find("#heart img").attr("src") )
		
		$layeringBox.find("#heart img").toggleClass("heartRed")
		
		
		$.ajax({
			type: "get"
			, url: "/layer/like"
			, data: { 
				layeringNo: layeringNo
			}
			, dataType: "json"
			, success: function(res){
				console.log("AJAX 성공")
	// 			console.log(res.list.SCNT)
				$layeringBox.find(".heart_scnt").html(res.list.SCNT)
				
	// 			result.innerHTML = res;
	// 			$("#result").html( $("#result").html() + res );
	
			}
			, error: function(){
				console.log("AJAX 실패")
			}
		})
	} else {
		if (confirm("로그인이 필요한 서비스 입니다. \n로그인 화면으로 이동하시겠습니까?")) {
			location.href="/user/login";
			return false;
		}else{
			return false;
		}//confirm end
	}
};// loadLike end	






</script>

<style type="text/css">
.heartRed {
	content:url("/resources/img/heart/heartRed.png")
}


table {
	table-layout: fixed;
}

table, th {
	text-align: center;
}

td:nth-child(2) {
	text-align: left;
}

.flex-container {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	width: 90%;
	min-width: 1080px;
	font-size: 15px;
}
#flex-items {
	min-width: 260px;
	width: 260px;
	height: 470px;
	border-radius: 10px; 
	margin:4px;
	background: #ECE6CC;
}
#flex-items:hover {
	transform: scale(1.02);
} 
#perf_pic {
	position: relative;
	margin: 10px;
	height: 250px;
	overflow: hidden;
	border-radius: 150px;
}

#writer {
	margin: 10px 10px 0px 10px;
	text-align: left;
	font-size: 15px;
/* 	background: #fff; */
	border-radius: 5px;
}

#perf_name1 {
	margin: 5px 10px 0px 10px;
	text-align: left;
	background: #fff;
	border-radius: 5px;
	padding-left: 10px;
}
#perf_name2 {
	margin: 5px 10px 0px 10px;
	text-align: left;
	background: #fff;
	border-radius: 5px;
	padding-left: 10px;	
}
.perf_per {
}
.per1 {
	
	position: relative;
    top: -220px;
    font-size: 48px;
    font-weight: 700;
    width: 50%;
    color: rgb(255, 255, 255, 0.7);
	background: rgb(0, 0, 0, 0.2);
	
	width: 50%;
    float: left;
    text-align: center;
}

.per2 {
	
	position: relative;
    top: -220px;
    font-size: 48px;
    font-weight: 700;
    width: 50%;
    color: rgb(0, 0, 0, 0.3);
	background: rgb(255, 255, 255, 0.5);

	width: 50%;
	float:right;
	text-align: center;
}

#heart {
	margin: 15px 10px 0px 10px;
	text-align: center;
	height: 30px;
}
#heart:hover {
	transform: scale(1.02);
}
#heartInner {
	vertical-align: middle;
    position: absolute;
    height: 30px;
    padding-left: 110px;
}
#heartInner img:hover{
	transform: scale(1.05);
}
#heartInner span {
	vertical-align: middle;
}
#heart_cnt {
/* 	margin: 0px 10px 0px 10px; */
	text-align: center;
}
#content {
    overflow: hidden;
    width: 240px;
	height: 60px;
	font-size: 12px;
	padding: 5px;
	margin: 5px 10px 0px 10px;
	background: #fff;
	border-radius: 5px;	
	white-space: normal;
}
.imgcontainer1{
	overflow: hidden;
	width: 50%;
	float:left;


	height: 250px;
	background-color:#fff;
	background-size: 230px 240px;
	background-position-x: left;
}
.imgcontainer2{
	overflow: hidden;
	width: 50%;
/* 	float:left; */

	float:right;
	
	height: 250px;
	background-color:#fff;
	background-size: 230px 240px;
	background-position-x: right;
}
#profile {
	float: left; 
	width: 30px;
	height: 20px;
}
/* .imgcontainer1 img{
	max-width: 230px;
	height:240px;
}
.imgcontainer2 img{
	max-width: 230px;
	margin-left:50%;
} */

#perf_name1, #perf_name2{
	background: rgb(138, 126, 107, 0.3);
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
    height: 23px;
    width: 240px;
}
.btnLayer {
	margin: 5px;
}
#like, #last {
	width: 80px;
}
</style>


<div class="container">

<input type="button" id="last" value="최신순" class="btn btnFunction btnLayer pull-left" style="display: none;"/>
<input type="button" id="like" value="좋아요순" class="btn btnFunction btnLayer pull-left"/>
<c:if test="${login }">
	<a href="/layer/write"><button id="writeLayer" class="btn btnLayer pull-left">나만의 레이어링 등록</button></a>
</c:if>
<c:if test="${empty login }">
	<a href="/user/login"><button id="writeLayer" class="btn btnLayer pull-left" onclick="if(!confirm('회원만 등록할 수 있습니다. 로그인 하시겠습니까?')){return false;}">나만의 레이어링 등록</button></a>
</c:if>


<div id="result">

</div>


<!-- ----------------------------------------------------------------------------------- -->

</div><!-- .container -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />











