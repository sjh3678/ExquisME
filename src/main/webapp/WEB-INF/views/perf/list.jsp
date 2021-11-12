<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:import url="/WEB-INF/views/layout/header.jsp" />

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
	width: 600px;
	margin: 0 auto;
	text-align: center;
}
.filter-item{
	border: 1px solid #ccc;
	margin: 10px;
}
</style>




<div class="container">
<div class="search">

<form action="/perf/list" method="get" style="text-align: center;"> 
		<input type="text" name="search" size="50" maxlength="30" placeholder="상품을 검색해보세요." /><input id="search" type="submit" value="검색" />
	
	<div>
		<label for="genderCode"> sex </label>
		<div>
			<input type="checkbox" value= 1
			name="genderCode" /> female
		</div>
		<div>
			<input type="checkbox" value= 2
			name="genderCode" /> male
		</div>
		<div>
			<input type="checkbox" value= 3
			name="genderCode" /> unisex
		</div>
	</div>
		<hr>
	<div id="topNotes" class="filter-container">
		<lable for="noteCode"> top notes </lable>
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
		
	<div id="middleNotes" class="filter-container">
		<lable for="noteCode"> middle notes </lable>
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
	
	<div id="baseNotes" class="filter-container">
		<lable for="noteCode"> base notes </lable>
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
	
	<div id="vitality" class="filter-container">
		<lable for="vitalityCode"> vitality </lable>
		<div>
			<input type="checkbox" value= 1 class="filter-item"
			name="vitalityCode" />  parfum
		</div>
		<div>
			<input type="checkbox" value= 2 class="filter-item"
			name="vitalityCode" />  eau de parfum
		</div>
		<div>
			<input type="checkbox" value= 3 class="filter-item"
			name="vitalityCode" />  eau de toilette
		</div>
		<div>
			<input type="checkbox" value= 4 class="filter-item"
			name="vitalityCode" />  eau de cologne
		</div>
		<div>
			<input type="checkbox" value= 5 class="filter-item"
			name="vitalityCode" />  shower cologne
		</div>
	</div>
</form>
<div id="result">

</div>

<button id="more">더 보기</button>

<!-- ----------------------------------------------------------------------------------- -->
<c:import url="/WEB-INF/views/layout/paging.jsp" />

</div><!-- .container -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />











