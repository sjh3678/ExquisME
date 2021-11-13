<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:import url="/WEB-INF/views/layout/header.jsp" />
<style type="text/css">
.flex-container {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	width: 90%;
	min-width: 1080px;
	font-size: 9px;
}
.flex-items {
	min-width: 150px;
	width: 150px;
	height: 180px;
	border: 1px solid;
	border-radius: 3px; 
	margin:4px;
}
.perf_pic {
	border: 1px solid #ccc;
	margin: 10px;
	height: 90px;
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

.search{
	background-color: #EEE;
	width: 250px;
	margin: 0 auto;
	text-align: center;
}
.search_div{
	padding: 20px 0px 0px 0px;
}
#paging{
	margin:0 auto;
}
</style>



<script type="text/javascript">
$(document).ready(function(){
	loadList();

	$("#search").click(function(){
		console.log("#search clicked")
		
		$.ajax({
			type: "post"
			, url: "/layer/write_ok"
			, data: {
				search: $("#keyWord").val()
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
	
	var curPage = 1;
	function loadList() {
		$.ajax({
			type: "post"
			, url: "/layer/write_ok"
			, data: { 
				curPage: curPage
			}
			, dataType: "html"
			, success: function(res){
				console.log("AJAX 성공")
				result.innerHTML = res;
// 				$("#result").html( $("#result").html() + res );
			}
			, error: function(){
				console.log("AJAX 실패")
			}
		})
		$("#cur").html(curPage)
	}

});
</script>


<div class="container">



<div class="search">
	<form action="/layer/write" method="get" style="text-align: center;"> 
		<div class="search_div">
			<input type="text" id="keyWord"name="search" size="15px" maxlength="30" placeholder="상품을 검색해보세요." /><input id="search" type="button" value="검색" /><br><br>
		</div>
	</form>
</div>



<div id="result">

</div>


</div><!-- .container -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />
