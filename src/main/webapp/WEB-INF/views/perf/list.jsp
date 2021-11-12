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
</style>




<div class="container">
<div class="search">
	<form action="/perf/list" method="get" style="text-align: center;"> 
		<input type="text" name="search" size="50" maxlength="30" placeholder="상품을 검색해보세요." /><input id="search" type="submit" value="검색" />
	</form>
</div>


<div id="result">

</div>

<button id="more">더 보기</button>

<!-- ----------------------------------------------------------------------------------- -->
<c:import url="/WEB-INF/views/layout/paging.jsp" />

</div><!-- .container -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />











