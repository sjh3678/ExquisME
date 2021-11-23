<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<div class="container">

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
     	$(this).fadeOut(300);
    	$("#divForm").fadeOut(300);
    	$(".search").delay(300).animate({width:"0"},300);
    	$("#slideRight").delay(600).fadeIn(300);
// 		setTimeout(function(){$(".search").animate({width:"0"},300)}, 300);
// 		setTimeout(function(){$("#slideRight").css("display", "block")}, 600);
	})
	$("#slideRight").click(function(){
		$(this).css("display", "none");
		$(".search").animate({width:"250"},300);
		$("#divForm").delay(300).fadeIn(300);
    	$("#slideLeft").delay(600).fadeIn(300);
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

var selectedLabel = $("form")

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
	height: 356px;
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
	border-radius: 10px; 
	margin: 10px;
	height: 250px;
	background: white;
}
.perf_img{
	border-radius: 10px; 
}
.perf_name {
	height: 40px;
	margin: 10px;
	text-align: center;
	border-radius: 5px;
	font-size: 15px;
	padding: 0px 5px;
 	background: white;
}
.brand_name {
	margin: 10px;
	text-align: center;
	border-radius: 5px; 
	font-size: 18px;
 	background: white;
}

.filter-container{
	display: inline-flex;
	flex-direction: row;
	margin: 0 auto;
	text-align: center;
}
.search{
	min-height: 900px;
 	background: #ECE6CC;
	width: 250px;
	margin: 0 auto;
	text-align: center;
	position: absolute;
 	top: 8px; 
	left: -288px;
	border-radius: 10px;
}
.search_div{
	margin: 0 auto;
	padding: 20px 0px 0px 0px;
	text-align: center;
	width: 220px;
	height: 60px;
}
.search label{
    border-radius: 5px;
    background: white;
    padding: 5px;
    margin-bottom: 8px;
}
.search label:hover{
	filter: brightness(0.8);
}
.search input[type=checkbox]{
	display: none;
}
.search input[type=checkbox]:checked + label{
	background: #8A7E6B;
	color: #ECE6CC;
}
.genderSelector{
	display: inline-flex;
}
.genderSelector div{
	padding: 5px;
}
.genderSelector label{
	width: 70px;
}
#vitality{
	margin: 3px;
	flex-direction: column;
}
#vitality label{
	width: 230px;
}
label{
	font-weight: 400;
}
.searchType{
	font-size: 18px;
	font-weight: 400;
}
.divNote{
	margin: 0 auto;
}
.divNote div{
	width: 80px;
}
.divNote label{
	width: 70px;
}
.container{
	position: relative;
}
#slideLeft{
	background: #ccc;
	position: absolute;
	top: 8px;
	left: -23px;
}
#slideRight{
	background: #ccc;
	position: absolute;
	top: 8px;
	left: -303px;
}
.btnSlide{
	display: block;	
}
</style>

<div class="container">

<div class="search">
<form action="/perf/list" method="get">
<div id="divForm">
	<div class="search_div">
		<input class="form-control text-center" type="text" id="keyWord" onkeyup="keyword()" name="search" size="20px" maxlength="30" placeholder="상품을 검색해보세요." /><br><br>
	</div>
	<div class="searchType"> Gender </div>
	<div class="filter-container genderSelector">
		<div>
			<input type="checkbox" id="female" value= 1 class="filter-item"
			name="genderCode" /> <label for="female"> female </lable>
		</div>
		<div>
			<input type="checkbox" id="male" value= 2 class="filter-item"
			name="genderCode" /> <label for="male"> male </lable>
		</div>
		<div>
			<input type="checkbox" id="unisex" value= 3 class="filter-item"
			name="genderCode" /> <label for="unisex"> unisex </lable>
		</div>
	</div>
	
	<div class="searchType"> Top Note </div>
	<div class="filter-container divNote">
		<div>
			<input type="checkbox" id="clean" value= 1 class="filter-item"
			name="noteCode" /> <label for="clean"><img style="clip-path: circle(50% at 50% 50%);" alt="clean" src="/resources/img/note/clean.jpg">clean</label> 
		</div>
		<div>
			<input type="checkbox" id="citrus" value= 2 class="filter-item"
			name="noteCode" /> <label for="citrus"><img style="clip-path: circle(50% at 50% 50%);" alt="citrus" src="/resources/img/note/citrus.jpg">citrus</label> 
		</div>
		<div>
			<input type="checkbox" id="water" value= 3 class="filter-item"
			name="noteCode" /> <label for="water"><img style="clip-path: circle(50% at 50% 50%);" alt="water" src="/resources/img/note/water.jpg">water</label> 
		</div>
	</div>
	<br>
	<div class="filter-container divNote">
		<div>
			<input type="checkbox" id="creamy" value= 4 class="filter-item"
			name="noteCode" /> <label for="creamy"><img style="clip-path: circle(50% at 50% 50%);" alt="creamy" src="/resources/img/note/creamy.jpg">creamy</label> 
		</div>
		<div>
			<input type="checkbox" id="fruit" value= 5 class="filter-item"
			name="noteCode" /> <label for="fruit"><img style="clip-path: circle(50% at 50% 50%);" alt="fruit" src="/resources/img/note/fruit.jpg">fruit</label> 
		</div>
		<div>
			<input type="checkbox" id="aroma" value= 6 class="filter-item"
			name="noteCode" /> <label for="aroma"><img style="clip-path: circle(50% at 50% 50%);" alt="aroma" src="/resources/img/note/aroma.jpg">aroma</label> 
		</div>
	</div>
			
	<div class="searchType"> Middle Note </div>
	<div class="filter-container divNote">
		<div>
			<input type="checkbox" id="green" value= 7 class="filter-item"
			name="noteCode" /> <label for="green"><img style="clip-path: circle(50% at 50% 50%);" alt="green" src="/resources/img/note/green.jpg">green</label> 
		</div>
		<div>
			<input type="checkbox" id="herbal" value= 8 class="filter-item"
			name="noteCode" /> <label for="herbal"><img style="clip-path: circle(50% at 50% 50%);" alt="herbal" src="/resources/img/note/herbal.jpg">herbal</label> 
		</div>
		<div>
			<input type="checkbox" id="floral" value= 9 class="filter-item"
			name="noteCode" /> <label for="floral"><img style="clip-path: circle(50% at 50% 50%);" alt="floral" src="/resources/img/note/floral.jpg">floral</label> 
		</div>
	</div>
	<br>
	<div class="filter-container divNote">
		<div>
			<input type="checkbox" id="smoke" value= 10 class="filter-item"
			name="noteCode" /> <label for="smoke"><img style="clip-path: circle(50% at 50% 50%);" alt="smoke" src="/resources/img/note/smoke.jpg">smoke</label> 
		</div>
		<div>
			<input type="checkbox" id="rose" value= 11 class="filter-item"
			name="noteCode" /> <label for="rose"><img style="clip-path: circle(50% at 50% 50%);" alt="rose" src="/resources/img/note/rose.jpg">rose</label> 
		</div>
		<div>
			<input type="checkbox" id="spice" value= 12 class="filter-item"
			name="noteCode" /> <label for="spice"><img style="clip-path: circle(50% at 50% 50%);" alt="spice" src="/resources/img/note/spice.jpg">spice</label> 
		</div>
	</div>
		
	<div class="searchType"> Base Note </div>
	<div class="filter-container divNote">
		<div>
			<input type="checkbox" id="leather" value= 13 class="filter-item"
			name="noteCode" /> <label for="leather"><img style="clip-path: circle(50% at 50% 50%);" alt="leather" src="/resources/img/note/leather.jpg">leather</label> 
		</div>
		<div>
			<input type="checkbox" id="vanilla" value= 14 class="filter-item"
			name="noteCode" /> <label for="vanilla"><img style="clip-path: circle(50% at 50% 50%);" alt="vanilla" src="/resources/img/note/vanilla.jpg">vanilla</label> 
		</div>
		<div>
			<input type="checkbox" id="chocolate" value= 15 class="filter-item"
			name="noteCode" /> <label for="chocolate"><img style="clip-path: circle(50% at 50% 50%);" alt="chocolate" src="/resources/img/note/chocolate.jpg">chocolate</label> 
		</div>
	</div>
	<br>
	<div class="filter-container divNote">
		<div>
			<input type="checkbox" id="wood" value= 16 class="filter-item"
			name="noteCode" /> <label for="wood"><img style="clip-path: circle(50% at 50% 50%);" alt="wood" src="/resources/img/note/wood.jpg">wood</label> 
		</div>
		<div>
			<input type="checkbox" id="earth" value= 17 class="filter-item"
			name="noteCode" /> <label for="earth"><img style="clip-path: circle(50% at 50% 50%);" alt="earth" src="/resources/img/note/earth.jpg">earth</label> 
		</div>
		<div>
			<input type="checkbox" id="musk" value= 18 class="filter-item"
			name="noteCode" /> <label for="musk"><img style="clip-path: circle(50% at 50% 50%);" alt="musk" src="/resources/img/note/musk.jpg">musk</label> 
		</div>
	</div>
	
	<div class="searchType"> Vitality </div>
	<div id="vitality" class="filter-container">
		<div>
			<input type="checkbox" id = "parfum" value= "parfum" class="filter-item"
			name="vitalityCode" /> <label for="parfum"> parfum </label>
		</div>
		<div>
			<input type="checkbox" id = "eaudeparfum" value= "eau de parfum" class="filter-item"
			name="vitalityCode" /> <label for="eaudeparfum"> eau de parfum </label>
		</div>
		<div>
			<input type="checkbox" id = "eaudetoilette" value= "eau de toilette" class="filter-item"
			name="vitalityCode" /> <label for="eaudetoilette"> eau de toilette </label>
		</div>
		<div>
			<input type="checkbox" id = "eaudecologne" value= "eau de cologne" class="filter-item"
			name="vitalityCode" /> <label for="eaudecologne"> eau de cologne </label>
		</div>
		<div>
			<input type="checkbox" id = "showercologne" value= "shower cologne" class="filter-item"
			name="vitalityCode" /> <label for="showercologne"> shower cologne </label>
		</div>
	</div>
</div>
</form>
</div>

<div id="result">

</div>


<!-- ----------------------------------------------------------------------------------- -->


</div><%-- .container --%>
<button class="btn" id="slideLeft">&lt;</button>
<button class="btn" id="slideRight" style="display: none;">&gt;</button>
<c:import url="/WEB-INF/views/layout/footer.jsp" />











