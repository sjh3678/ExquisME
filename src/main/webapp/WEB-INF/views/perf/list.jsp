<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style type="text/css">
.wrap{
	margin: 0 auto;
	width: 1100px;
}

.header, .footer{
	text-align: center;
	background: skyblue;
}

.container{
	min-height: 400px;
}
</style>

</head>


<script type="text/javascript">
$(document).ready(function(){
	
	loadList(); //init list
	
	$("#more").click(function(){
		console.log("#ajax clicked")
		
		loadList();
	})
	
	$("input[name=genderCode]:checkbox").change(
         function() {// 체크박스들이 변경됬을때
            var cnt = 1;
            if (cnt == $("input[name=genderCode]:checkbox:checked").length) {
                  $("input[name=genderCode]:checkbox:not(:checked)").attr("disabled", "disabled");
            } else {
                  $("input[name=genderCode]:checkbox").removeAttr("disabled");
            }
    })
// 	$(window).scroll

});

var curPage = 1;
function loadList() {
	$.ajax({
		type: "get"
		, url: "/perf/list_ok"
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
</script>


<style type="text/css">
.flex-container {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	width: 90%;
	min-width: 1080px;
}
.flex-items {
	min-width: 260px;
	width: 260px;
	height: 400px;
	border: 1px solid;
	border-radius: 3px; 
	margin:4px;
}
.perf_pic {
	border: 1px solid #ccc;
	margin: 10px;
	height: 250px;
}

.perf_name {
	border: 1px solid #ccc;
	margin: 10px;
	text-align: center;
}
.brand_name {
	border: 1px solid #ccc;
	margin: 10px;
	text-align: center;
}

.filter-container{
	display: flex;
	flex-direction: row;
	margin: 0 auto;
	text-align: center;
}
.search{
	background-color: #EEE;
	width: 250px;
	margin: 0 auto;
	text-align: center;
	position: fixed;
	top: 50px;
	left: 100px;
}
.search_div{
	padding: 20px 0px 0px 0px;
}
</style>


<body>


<div style="witdh: 300px;">
</div>
<div class="search">

<form action="/perf/list" method="get" style="text-align: center;"> 
	<div class="search_div">
		<input type="text" name="search" size="15px" maxlength="30" placeholder="상품을 검색해보세요." /><input id="search" type="submit" value="검색" /><br><br>
	</div>
	<label for="genderCode"> sex </label>
	<div class="filter-container">
		<div style="padding: 10px;">
			<input type="checkbox" value= 1
			name="genderCode" /> female
		</div>
		<div style="padding: 10px;">
			<input type="checkbox" value= 2
			name="genderCode" /> male
		</div>
		<div style="padding: 10px;">
			<input type="checkbox" value= 3
			name="genderCode" /> unisex
		</div>
	</div>
	<hr>
	
	<lable for="noteCode" style="padding: 10px;"> top notes </lable>
	<hr style="margin: 5px;">
	<div class="filter-container">
		<div>
			<input type="checkbox" value= 1 class="filter-item"
			name="noteCode" /> <img style="clip-path: circle(50% at 50% 50%);" alt="clean" src="/resources/img/note/clean.jpg"> clean
		</div>
		<div>
			<input type="checkbox" value= 2 class="filter-item"
			name="noteCode" /> <img style="clip-path: circle(50% at 50% 50%);" alt="citrus" src="/resources/img/note/citrus.jpg"> citrus
		</div>
		<div>
			<input type="checkbox" value= 3 class="filter-item"
			name="noteCode" /> <img style="clip-path: circle(50% at 50% 50%);" alt="water" src="/resources/img/note/water.jpg"> water
		</div>
	</div>
	<div class="filter-container">
		<div>
			<input type="checkbox" value= 4 class="filter-item"
			name="noteCode" /> <img style="clip-path: circle(50% at 50% 50%);" alt="creamy" src="/resources/img/note/creamy.jpg"> creamy
		</div>
		<div>
			<input type="checkbox" value= 5 class="filter-item"
			name="noteCode" /> <img style="clip-path: circle(50% at 50% 50%);" alt="fruit" src="/resources/img/note/fruit.jpg"> fruit
		</div>
		<div>
			<input type="checkbox" value= 6 class="filter-item"
			name="noteCode" /> <img style="clip-path: circle(50% at 50% 50%);" alt="aroma" src="/resources/img/note/aroma.jpg"> aroma
		</div>
	</div>
	
	<hr>
		
	<lable for="noteCode" style="padding: 10px;"> middle notes </lable>
	<hr style="margin: 5px;">
	<div class="filter-container">
		<div>
			<input type="checkbox" value= 7 class="filter-item"
			name="noteCode" /> <img style="clip-path: circle(50% at 50% 50%);" alt="green" src="/resources/img/note/green.jpg"> green
		</div>
		<div>
			<input type="checkbox" value= 8 class="filter-item"
			name="noteCode" /> <img style="clip-path: circle(50% at 50% 50%);" alt="herbal" src="/resources/img/note/herbal.jpg"> herbal
		</div>
		<div>
			<input type="checkbox" value= 9 class="filter-item"
			name="noteCode" /> <img style="clip-path: circle(50% at 50% 50%);" alt="floral" src="/resources/img/note/floral.jpg"> floral
		</div>
	</div>
	<div class="filter-container">
		<div>
			<input type="checkbox" value= 10 class="filter-item"
			name="noteCode" /> <img style="clip-path: circle(50% at 50% 50%);" alt="smoke" src="/resources/img/note/smoke.jpg"> smoke
		</div>
		<div>
			<input type="checkbox" value= 11 class="filter-item"
			name="noteCode" /> <img style="clip-path: circle(50% at 50% 50%);" alt="rose" src="/resources/img/note/rose.jpg"> rose
		</div>
		<div>
			<input type="checkbox" value= 12 class="filter-item"
			name="noteCode" /> <img style="clip-path: circle(50% at 50% 50%);" alt="spice" src="/resources/img/note/spice.jpg"> spice
		</div>
	</div>
	
	<hr>
	
	<lable for="noteCode" style="padding: 0px;"> base notes </lable>
	<hr style="margin: 5px;">
	<div class="filter-container">
		<div>
			<input type="checkbox" value= 13 class="filter-item"
			name="noteCode" /> <img style="clip-path: circle(50% at 50% 50%);" alt="leather" src="/resources/img/note/leather.jpg"> leather
		</div>
		<div>
			<input type="checkbox" value= 14 class="filter-item"
			name="noteCode" /> <img style="clip-path: circle(50% at 50% 50%);" alt="vanilla" src="/resources/img/note/vanilla.jpg"> vanilla
		</div>
		<div>
			<input type="checkbox" value= 15 class="filter-item"
			name="noteCode" /> <img style="clip-path: circle(50% at 50% 50%);" alt="chocolate" src="/resources/img/note/chocolate.jpg"> chocolate
		</div>
	</div>
	<div class="filter-container">
		<div>
			<input type="checkbox" value= 16 class="filter-item"
			name="noteCode" /> <img style="clip-path: circle(50% at 50% 50%);" alt="wood" src="/resources/img/note/wood.jpg"> wood
		</div>
		<div>
			<input type="checkbox" value= 17 class="filter-item"
			name="noteCode" /> <img style="clip-path: circle(50% at 50% 50%);" alt="earth" src="/resources/img/note/earth.jpg"> earth
		</div>
		<div>
			<input type="checkbox" value= 18 class="filter-item"
			name="noteCode" /> <img style="clip-path: circle(50% at 50% 50%);" alt="musk" src="/resources/img/note/musk.jpg"> musk
		</div>
	</div>

	<hr>
	
	<lable for="vitalityCode" style="padding: 10px;"> vitality </lable>
	<div id="vitality" class="filter-container">
		<div style="padding: 10px;">
			<input type="checkbox" value= 1 class="filter-item"
			name="vitalityCode" />  parfum
		</div>
		<div style="padding: 10px;">
			<input type="checkbox" value= 2 class="filter-item"
			name="vitalityCode" />  eau de parfum
		</div>
		<div style="padding: 10px;">
			<input type="checkbox" value= 3 class="filter-item"
			name="vitalityCode" />  eau de toilette
		</div>
	</div>
	<div class="filter-container">
		<div style="padding: 10px;">
			<input type="checkbox" value= 4 class="filter-item"
			name="vitalityCode" />  eau de cologne
		</div>
		<div style="padding: 10px;">
			<input type="checkbox" value= 5 class="filter-item"
			name="vitalityCode" />  shower cologne
		</div>
	</div>
</form>
</div>
<div class="wrap">

<header class="header">
HEADER<br>
<a href="/notice/list">/notice/list</a>|
<a href="/admin/notice/list">/admin/notice/list</a>|
<a href="/faq">/faq</a>|
<a href="/admin/faq">/admin/faq</a>|
<a href="/user/login">/user/login</a>|
<a href="/user/logout">/user/logout</a>|
<a href="/extagram/list">/extagram/logout</a>|

</header>
<div class="container">
<div id="result">

</div>

<button id="more">더 보기</button>

<!-- ----------------------------------------------------------------------------------- -->

</div><!-- .container -->
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />











