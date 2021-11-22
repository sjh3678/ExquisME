<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!-- 헤더 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>exquis me</title>

<%-- JQUERY --%>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<%-- BOOTSTRAP --%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style type="text/css">
		<%-- ################################################## --%>
		/* noto-sans-kr-300 - korean */
		@font-face {
		  font-family: 'Noto Sans KR';
		  font-style: normal;
		  font-weight: 300;
		  src: url('../fonts/noto-sans-kr-v21-korean-300.eot'); /* IE9 Compat Modes */
		  src: local(''),
		       url('../fonts/noto-sans-kr-v21-korean-300.eot?#iefix') format('embedded-opentype'), /* IE6-IE8 */
		/*        url('../fonts/noto-sans-kr-v21-korean-300.woff2') format('woff2'), /* Super Modern Browsers */ */
		/*        url('../fonts/noto-sans-kr-v21-korean-300.woff') format('woff'), /* Modern Browsers */ */
		/*        url('../fonts/noto-sans-kr-v21-korean-300.ttf') format('truetype'), /* Safari, Android, iOS */ */
		       url('../fonts/noto-sans-kr-v21-korean-300.svg#NotoSansKR') format('svg'); /* Legacy iOS */
		}
		/* noto-sans-kr-regular - korean */
		@font-face {
		  font-family: 'Noto Sans KR';
		  font-style: normal;
		  font-weight: 400;
		  src: url('../fonts/noto-sans-kr-v21-korean-regular.eot'); /* IE9 Compat Modes */
		  src: local(''),
		       url('../fonts/noto-sans-kr-v21-korean-regular.eot?#iefix') format('embedded-opentype'), /* IE6-IE8 */
		/*        url('../fonts/noto-sans-kr-v21-korean-regular.woff2') format('woff2'), /* Super Modern Browsers */ */
		/*        url('../fonts/noto-sans-kr-v21-korean-regular.woff') format('woff'), /* Modern Browsers */ */
		/*        url('../fonts/noto-sans-kr-v21-korean-regular.ttf') format('truetype'), /* Safari, Android, iOS */ */
		       url('../fonts/noto-sans-kr-v21-korean-regular.svg#NotoSansKR') format('svg'); /* Legacy iOS */
		}
		/* noto-sans-kr-700 - korean */
		@font-face {
		  font-family: 'Noto Sans KR';
		  font-style: normal;
		  font-weight: 700;
		  src: url('../fonts/noto-sans-kr-v21-korean-700.eot'); /* IE9 Compat Modes */
		  src: local(''),
		       url('../fonts/noto-sans-kr-v21-korean-700.eot?#iefix') format('embedded-opentype'), /* IE6-IE8 */
		/*        url('../fonts/noto-sans-kr-v21-korean-700.woff2') format('woff2'), /* Super Modern Browsers */ */
		/*        url('../fonts/noto-sans-kr-v21-korean-700.woff') format('woff'), /* Modern Browsers */ */
		/*        url('../fonts/noto-sans-kr-v21-korean-700.ttf') format('truetype'), /* Safari, Android, iOS */ */
		       url('../fonts/noto-sans-kr-v21-korean-700.svg#NotoSansKR') format('svg'); /* Legacy iOS */
		}
		<%-- ################################################## --%>


/* 모달 */
.modal_header {
  position: absolute;
  top: 0;
  left: 0;

  width: 100%;
  height: 100%;

  display: none;

  background-color: rgba(0, 0, 0, 0.4);
}

.modal_header.show {
  display: block;
}

.modal_body_header {
  position: absolute;
  top: 50%;
  left: 50%;

  width: 400px;
  height: 200px;

  padding: 40px;

  text-align: center;

  background-color: #ECE6CC;
  border-radius: 10px;
  box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

  transform: translateX(-50%) translateY(-50%);
}

.wrap {
 	font-family: 'Noto Sans KR';
 	font-weight: 300;
	margin: 0 auto;
	width: 1100px;
}

.header, .footer{
	font-size: 27px;
 	font-weight: 300;
	color: #35312B;
	text-align: center;
/* 	background: #8A7E6B; */
}

.container{
	min-height: 800px;
	width: 1100px;
}

.header{
/* 	position: fixed; */
	height: 150px;
	top: 0;
 	width: 100%;
	left: 0;
	right: 0;
}


.btnLog {
	display: compact;
}

.logo {
	height: 40px;
	margin: 10px;
}

.hrMenu {
	margin: 0 auto;
	border-top: 1px solid #35312B;
}
.menu{
	font-weight:300;
	font-size:21px;
	color:#ECE6CC;
	margin: 10px;
}
.menuLog{
	display: flow-root;
	height: 0;
}
.btn{
	background: #ECE6CC;
	color: #35312B;
}
.btn:hover{
	background: #8A7E6B;
	color: #ECE6CC;
}
.btnHeader {
	background-color: white;
	color: #35312B;
	margin: 10px;
}

.btnHeader:hover {
	background-color: #ECE6CC;
 	color: #35312B; 
}

.btnModal{
	background-color: #8A7E6B;
	color: #ECE6CC;
	margin: 10px;
}
.btnModal:hover {
	background-color: #35312B;
}

</style>
</head>
<!-- 헤더 -->


<script type="text/javascript">
$(document).ready(function(){
	
	loadList(); //init list
	
	$("input[name=genderCode]:checkbox").change(
         function() {// 체크박스들이 변경됬을때
            var cnt_gender = 1;
            if (cnt_gender == $("input[name=genderCode]:checkbox:checked").length) {
                  $("input[name=genderCode]:checkbox:not(:checked)").attr("disabled", "disabled");
            } else {
                  $("input[name=genderCode]:checkbox").removeAttr("disabled");
            }
    })
    
    $("input[name=vitalityCode]:checkbox").change(
         function() {// 체크박스들이 변경됬을때
            var cnt_vitality = 1;
            if (cnt_vitality == $("input[name=vitalityCode]:checkbox:checked").length) {
                  $("input[name=vitalityCode]:checkbox:not(:checked)").attr("disabled", "disabled");
            } else {
                  $("input[name=vitalityCode]:checkbox").removeAttr("disabled");
            }
    })
    
    $("#slideLeft").click(function(){
     	$(this).css("display", "none");
    	$("form").fadeOut(200);
		$(".search").delay(200).animate({width:"0"},300);
		setTimeout(function(){$("#slideRight").css("display", "block")}, 500);
	})
	$("#slideRight").click(function(){
		$(this).css("display", "none");
		$(".search").animate({width:"250"},300);
		$("form").delay(300).fadeIn(200);
    	setTimeout(function(){$("#slideLeft").css("display", "block")}, 500);
	})
    
    
// 	$(window).scroll

	$("input[class=filter-item]:checkbox").change(function(){
		
		var noteArray = [];
            $('input[name="noteCode"]:checked').each(function(i){//체크된 리스트 저장
            	noteArray.push($(this).val());
            });
            $(location).attr("href", "#top");
            curPage = 1;
		$.ajax({
			type: "get"
			, url: "/perf/list_ok"
			, data: {
				search: $("#keyWord").val()
				, gender: $("input[name=genderCode]:checkbox:checked").val()
				, note: noteArray
				, vitality: $("input[name=vitalityCode]:checkbox:checked").val()
				, curPage: curPage++
			}
			, dataType: "html"
			, success: function(res){
				console.log("AJAX 성공")	
				
				result.innerHTML = res;
				console.log( res )	
				console.log( curPage )
			}
			, error: function(res){
				console.log("AJAX 실패")	
			}
		})
	})
	
	
});

//스크롤 바닥 감지
window.onscroll = function(e) {
  //추가되는 임시 콘텐츠
  //window height + window scrollY 값이 document height보다 클 경우,
  if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
  	//실행할 로직 (콘텐츠 추가)
  	loadList();
  }
};

var curPage = 1;
function loadList() {
	
	var noteArray = [];
    $('input[name="noteCode"]:checked').each(function(i){//체크된 리스트 저장
    	noteArray.push($(this).val());
    });
	
    
	$.ajax({
		type: "get"
		, url: "/perf/list_ok"
		, data: { 
			search: $("#keyWord").val()
			, gender: $("input[name=genderCode]:checkbox:checked").val()
			, note: noteArray
			, vitality: $("input[name=vitalityCode]:checkbox:checked").val()
			, curPage: curPage++
		}
		, dataType: "html"
		, success: function(res){
			console.log("AJAX 성공")
			result.innerHTML += res;
// 			$("#result").html( $("#result").html() + res );
			console.log( curPage )
//			console.log( endPage )
		}
		, error: function(){
			console.log("AJAX 실패")
		}
	})
}

function keyword(){
	
	var noteArray = [];
        $('input[name="noteCode"]:checked').each(function(i){//체크된 리스트 저장
        	noteArray.push($(this).val());
        });

        curPage = 1;
        
	$.ajax({
		type: "get"
		, url: "/perf/list_ok"
		, data: {
			search: $("#keyWord").val()
			, gender: $("input[name=genderCode]:checkbox:checked").val()
			, note: noteArray
			, vitality: $("input[name=vitalityCode]:checkbox:checked").val()
			, curPage: curPage++
		}
		, dataType: "html"
		, success: function(res){
			console.log("AJAX 성공")	
			
			result.innerHTML = res;
			console.log( res )	
			console.log( curPage )	
		}
		, error: function(res){
			console.log("AJAX 실패")	
		}
	})
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
	height: 370px;
/* 	border: 1px solid; */
	border-radius: 10px; 
	margin:4px;
	background: #ECE6CC;
	color: #35312B;
	font-weight: 400;
}
.flex-items:hover{
	filter: brightness(0.85);
}
.perf_pic {
/* 	border: 1px solid #ccc; */
	border-radius: 10px; 
	margin: 10px;
	height: 250px;
	background: white;
}
.perf_img{
	border-radius: 10px; 
}
.perf_name {
/* 	border: 1px solid #ccc; */
	height: 40px;
	margin: 10px;
	text-align: center;
	border-radius: 5px;
	font-size: 15px;
	padding: 0px 5px;
/* 	background: white;	 */
}
.brand_name {
/* 	border: 1px solid #ccc; */
	margin: 10px;
	text-align: center;
	border-radius: 5px; 
	font-size: 18px;
/* 	background: white;	 */
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
	height: 1050px;
	margin: 0 auto;
	text-align: center;
	position: fixed;
	top: 50px;
	left: 100px;
}
#slideLeft{
	position: fixed;
	top: 50px;
	left: 350px;
}
#slideRight{
	position: fixed;
	top: 50px;
	left: 100px;
}
.search_div{
	padding: 20px 0px 0px 0px;
}
</style>


<body>



<div class="search">
<form action="/perf/list" method="get" style="text-align: center;"> 
	<div class="search_div">
		<input type="text" id="keyWord" onkeyup="keyword()" name="search" size="20px" maxlength="30" placeholder="상품을 검색해보세요." /><br><br>
	</div>
	<h4> gender </h4>
	<div class="filter-container">
		<div style="padding: 10px;">
			<input type="checkbox" id="female" value= 1 class="filter-item"
			name="genderCode" /> <label for="female"> female </lable>
		</div>
		<div style="padding: 10px;">
			<input type="checkbox" id="male" value= 2 class="filter-item"
			name="genderCode" /> <label for="male"> male </lable>
		</div>
		<div style="padding: 10px;">
			<input type="checkbox" id="unisex" value= 3 class="filter-item"
			name="genderCode" /> <label for="unisex"> unisex </lable>
		</div>
	</div>
	<hr>
	
	<h4> top notes </h4>
	<hr style="margin: 5px;">
	<div class="filter-container">
		<div>
			<input type="checkbox" id="clean" value= 1 class="filter-item"
			name="noteCode" /> <label for="clean"><img style="clip-path: circle(50% at 50% 50%);" alt="clean" src="/resources/img/note/clean.jpg"></label> clean
		</div>
		<div>
			<input type="checkbox" id="citrus" value= 2 class="filter-item"
			name="noteCode" /> <label for="citrus"><img style="clip-path: circle(50% at 50% 50%);" alt="citrus" src="/resources/img/note/citrus.jpg"></label> citrus
		</div>
		<div>
			<input type="checkbox" id="water" value= 3 class="filter-item"
			name="noteCode" /> <label for="water"><img style="clip-path: circle(50% at 50% 50%);" alt="water" src="/resources/img/note/water.jpg"></label> water
		</div>
	</div>
	<br>
	<div class="filter-container">
		<div>
			<input type="checkbox" id="creamy" value= 4 class="filter-item"
			name="noteCode" /> <label for="creamy"><img style="clip-path: circle(50% at 50% 50%);" alt="creamy" src="/resources/img/note/creamy.jpg"></label> creamy
		</div>
		<div>
			<input type="checkbox" id="fruit" value= 5 class="filter-item"
			name="noteCode" /> <label for="fruit"><img style="clip-path: circle(50% at 50% 50%);" alt="fruit" src="/resources/img/note/fruit.jpg"></label> fruit
		</div>
		<div>
			<input type="checkbox" id="aroma" value= 6 class="filter-item"
			name="noteCode" /> <label for="aroma"><img style="clip-path: circle(50% at 50% 50%);" alt="aroma" src="/resources/img/note/aroma.jpg"></label> aroma
		</div>
	</div>
	
	<hr>
		
	<h4> Middle Notes </h4>
	<hr style="margin: 5px;">
	<div class="filter-container">
		<div>
			<input type="checkbox" id="green" value= 7 class="filter-item"
			name="noteCode" /> <label for="green"><img style="clip-path: circle(50% at 50% 50%);" alt="green" src="/resources/img/note/green.jpg"></label> green
		</div>
		<div>
			<input type="checkbox" id="herbal" value= 8 class="filter-item"
			name="noteCode" /> <label for="herbal"><img style="clip-path: circle(50% at 50% 50%);" alt="herbal" src="/resources/img/note/herbal.jpg"></label> herbal
		</div>
		<div>
			<input type="checkbox" id="floral" value= 9 class="filter-item"
			name="noteCode" /> <label for="floral"><img style="clip-path: circle(50% at 50% 50%);" alt="floral" src="/resources/img/note/floral.jpg"></label> floral
		</div>
	</div>
	<br>
	<div class="filter-container">
		<div>
			<input type="checkbox" id="smoke" value= 10 class="filter-item"
			name="noteCode" /> <label for="smoke"><img style="clip-path: circle(50% at 50% 50%);" alt="smoke" src="/resources/img/note/smoke.jpg"></label> smoke
		</div>
		<div>
			<input type="checkbox" id="rose" value= 11 class="filter-item"
			name="noteCode" /> <label for="rose"><img style="clip-path: circle(50% at 50% 50%);" alt="rose" src="/resources/img/note/rose.jpg"></label> rose
		</div>
		<div>
			<input type="checkbox" id="spice" value= 12 class="filter-item"
			name="noteCode" /> <label for="spice"><img style="clip-path: circle(50% at 50% 50%);" alt="spice" src="/resources/img/note/spice.jpg"></label> spice
		</div>
	</div>
	
	<hr>
	
	<h4> Base Notes </h4>
	<hr style="margin: 5px;">
	<div class="filter-container">
		<div>
			<input type="checkbox" id="leather" value= 13 class="filter-item"
			name="noteCode" /> <label for="leather"><img style="clip-path: circle(50% at 50% 50%);" alt="leather" src="/resources/img/note/leather.jpg"></label> leather
		</div>
		<div>
			<input type="checkbox" id="vanilla" value= 14 class="filter-item"
			name="noteCode" /> <label for="vanilla"><img style="clip-path: circle(50% at 50% 50%);" alt="vanilla" src="/resources/img/note/vanilla.jpg"></label> vanilla
		</div>
		<div>
			<input type="checkbox" id="chocolate" value= 15 class="filter-item"
			name="noteCode" /> <label for="chocolate"><img style="clip-path: circle(50% at 50% 50%);" alt="chocolate" src="/resources/img/note/chocolate.jpg"></label> chocolate
		</div>
	</div>
	<br>
	<div class="filter-container">
		<div>
			<input type="checkbox" id="wood" value= 16 class="filter-item"
			name="noteCode" /> <label for="wood"><img style="clip-path: circle(50% at 50% 50%);" alt="wood" src="/resources/img/note/wood.jpg"></label> wood
		</div>
		<div>
			<input type="checkbox" id="earth" value= 17 class="filter-item"
			name="noteCode" /> <label for="earth"><img style="clip-path: circle(50% at 50% 50%);" alt="earth" src="/resources/img/note/earth.jpg"></label> earth
		</div>
		<div>
			<input type="checkbox" id="musk" value= 18 class="filter-item"
			name="noteCode" /> <label for="musk"><img style="clip-path: circle(50% at 50% 50%);" alt="musk" src="/resources/img/note/musk.jpg"></label> musk
		</div>
	</div>

	<hr>
	
	<h4> vitality </h4>
	<div id="vitality" class="filter-container">
		<div style="padding: 10px;">
			<input type="checkbox" id = "parfum" value= "parfum" class="filter-item"
			name="vitalityCode" /> <label for="parfum"> parfum </lable>
		</div>
		<div style="padding: 10px;">
			<input type="checkbox" id = "eaudeparfum" value= "eau de parfum" class="filter-item"
			name="vitalityCode" /> <label for="eaudeparfum"> eau de parfum </lable>
		</div>
		<div style="padding: 10px;">
			<input type="checkbox" id = "eaudetoilette" value= "eau de toilette" class="filter-item"
			name="vitalityCode" /> <label for="eaudetoilette"> eau de toilette </lable>
		</div>
	</div>
	<div class="filter-container">
		<div style="padding: 10px;">
			<input type="checkbox" id = "eaudecologne" value= "eau de cologne" class="filter-item"
			name="vitalityCode" /> <label for="eaudecologne"> eau de cologne </lable>
		</div>
		<div style="padding: 10px;">
			<input type="checkbox" id = "showercologne" value= "shower cologne" class="filter-item"
			name="vitalityCode" /> <label for="showercologne"> shower cologne </lable>
		</div>
	</div>
</form>
</div>

<!-- 헤더 -->
<div class="wrap">

<header class="header">
<div class="menuLog">
	<c:if test="${login eq null }">
		<span class="pull-right"><a href="/user/login"><button class="btn btnHeader btnLog">LOGIN</button></a></span>
	</c:if>	
	<c:if test="${login }">
		<span class="pull-right"><a href="/user/logout"><button class="btn btnHeader btnLog">LOGOUT</button></a></span>
		<span class="pull-right"><button class="btn btn-open-popup btnHeader">CHAT</button></span>
	</c:if>
</div>
<div class="logo"><span style="vertical-align: middle; cursor: pointer;" onclick="location.href='/';">EXQUIS ME</span></div>
<div class="menu">
	<a href="/notice/list"><button class="btn btnHeader">NOTICE</button></a>
	<a href="/faq/list"><button class="btn btnHeader">FAQ</button></a>
	<a href="/extagram/list"><button class="btn btnHeader">EXTAGRAM</button></a>
	<a href="/perf/list"><button class="btn btnHeader">PERFUME</button></a>
	<a href="/layer/list"><button class="btn btnHeader">LAYER</button></a>
	<hr class="hrMenu">
</div>
<%-- 모달 채팅방 입장 영역 --%>
<div class="modal_header">
	<div class="modal_body_header">
		<div class="panel-title">${nick }님,<br>채팅에 사용하실 닉네임은 무엇인가요?<br></div>
		<form id="login-form" method="post" action="/chat">
		    <div>
		        <input type="text" name="chatNick" class="form-control" placeholder="별명을 입력해 주세요." autofocus>
		    </div>
		    <div>
		        <button type="submit" class="form-control btn btnModal">채팅 페이지로 이동</button>
		    </div>
		</form>
	</div>
</div><%-- .modal --%>
<script>
const body = document.querySelector('body');
const modal = document.querySelector('.modal_header');
const btnOpenPopup = document.querySelector('.btn-open-popup');

btnOpenPopup.addEventListener('click', () => {
	modal.classList.toggle('show');

    if (modal.classList.contains('show')) {
    	body.style.overflow = 'hidden';
    }
});

modal.addEventListener('click', (event) => {
    if (event.target === modal) {
    	modal.classList.toggle('show');

    	if (!modal.classList.contains('show')) {
			body.style.overflow = 'auto';
		}
    }
});
</script>

</header>
<!-- 헤더 -->
<button id="slideLeft">검색창 닫기</button>
<button id="slideRight" style="display: none;">검색창 열기</button>
<div class="container">
<div id="result">

</div>

<!-- ----------------------------------------------------------------------------------- -->

</div><!-- .container -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />











