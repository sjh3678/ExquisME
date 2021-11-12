<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function(){
	
	loadList(); //init list
	

$("#last").click(function(){
	console.log("#last")
	$.ajax({
        type: "get"
        , url: "/layer/list_ok"
        , data: {
            target: $("#last").val()
        }
        , dataType: "html"
        , success: function(res){
       		console.log("AJAX 성공")
       		result.innerHTML = res;
            //응답데이터 확인
            console.log( res )
        }
        , error: function(res){
            console.log("AJAX 실패")
        }
    })
});
	
$("#like").click(function(){
	console.log("#like")
	$.ajax({
		type: "get"
		, url: "/layer/list_ok"
		, data: {
			target: $("#like").val()
        }
        , dataType: "html"
        , success: function(res){
            console.log("AJAX 성공")
            result.innerHTML = res;
            //응답데이터 확인
            console.log( res )
        }
        , error: function(res){
		console.log("AJAX 실패")
		}
	})
});
	
// 	$(window).scroll

});

//Javascript
var count = 0;
//스크롤 바닥 감지
window.onscroll = function(e) {
    //추가되는 임시 콘텐츠
    //window height + window scrollY 값이 document height보다 클 경우,
    if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
    	//실행할 로직 (콘텐츠 추가)
    	loadList();
        count++;
    }
};

var curPage = 1;
function loadList() {		
	$.ajax({
		type: "get"
		, url: "/layer/list_ok"
		, data: { 
			curPage: curPage++
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
	$("#cur").html(curPage)
}

//$("#perf_pic").click(function(){
//	location.href="/layer/view?" + (this).${layer.LAYERING_NO};
//});

var view = document.getElementById("perf_pic");
view.click(function(){
	location.href="/layer/view";
});


</script>

<style type="text/css">
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
}
#flex-items {
	min-width: 260px;
	width: 260px;
	height: 440px;
	border: 1px solid;
	border-radius: 3px; 
	margin:4px;
}
#perf_pic {
	position: relative;
	border: 1px solid #ccc;
	margin: 10px;
	height: 250px;
	overflow: hidden;
}

#writer_name {
	border: 1px solid #ccc;
	margin: 10px;
	text-align: center;
}
#perf_name1 {
	border: 1px solid #ccc;
	margin: 10px;
	text-align: center;
}
#perf_name2 {
	border: 1px solid #ccc;
	margin: 10px;
	text-align: center;
}
#heart_cnt {
	border: 1px solid #ccc;
	margin: 10px;
	text-align: center;
}
.imgcontainer1{
	overflow: hidden;
	width: 50%;
	float:left;


	height: 240px;
	
	background-size: 230px 240px;
	background-position-x: left;
}
.imgcontainer2{
	overflow: hidden;
	width: 50%;
/* 	float:left; */

	float:right;
	
	height: 240px;
	
	background-size: 230px 240px;
	background-position-x: right;
}
/* .imgcontainer1 img{
	max-width: 230px;
	height:240px;
}
.imgcontainer2 img{
	max-width: 230px;
	margin-left:50%;
} */
</style>


<div class="container">

<button type="submit" name="target" id="last" value="1" class="btn btn-primary pull-left">최신순</button>
<button type="button" name="target" id="like" value="2" class="btn btn-primary pull-left">인기순</button>
<a href="/layer/write"><button class="btn btn-primary pull-left">레이어링등록</button></a>


<div id="result">

</div>


<!-- ----------------------------------------------------------------------------------- -->

</div><!-- .container -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />











