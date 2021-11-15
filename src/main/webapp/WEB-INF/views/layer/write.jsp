<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:import url="/WEB-INF/views/layout/header.jsp" />
<style type="text/css">
.container {
	width: 100%;
}
.flex-container {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	width: 90%;
	min-width: 1080px;
	font-size: 9px;
	margin: 0 auto;
}
.flex-items {
	min-width: 150px;
	width: 15%;
	height: 180px;
	border: 1px solid;
	border-radius: 3px; 
	margin:4px auto;
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
	width: 250px;
	margin: 0px;
	padding: 0px;
	float:left;
}
.search_div{
	padding: 20px 0px 0px 0px;
}
#paging{
	margin:0 auto;
}
.layer-container{
	width: 100%;
	height: 350px;
	margin: 10px auto;
	border: solid 15px #8B4513;
}
.layer-item {
	width: 20%;
	height: 85%;
	margin: 10px auto;
	padding: 10px;
	border: solid 15px #8B4513;
	float: left;
}
.layer-img {
	border: 15px solid #ccc;
	border-radius: 50px;
}
.layer-result {
	width: 20%;
	height: 85%;
	margin: 10px auto;
	padding: 10px;
	border: solid 15px #8B4513;
	float: left;
}

.layer-operator {
	width: 20%;
	height: 85%;
	margin: 10px auto;
	padding: 10px;
	border: solid 15px #8B4513;
	float: left;
	font-size: 20px;
}
.layer-operator span {
	position: relative;
	top: 25%;
	left: 45%;
	margin: 0 auto;
	font-weight: bold;
}
.layer-img {
	width:100%;
	height: 70%;
	margin: 0 auto;
	boarder:solid 1px #ccc;
}
.graf-bar {
	width:100%;
	height: 30%;
	margin: 0 auto;
	boarder:solid 1px #ccc;
}

li span {
	cursor: pointer;
}

</style>



<script type="text/javascript">
$(document).ready(function(){
	loadList()	
	
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
	
//	$(document).on("click", "input[name='curP']", loadCurPage())
	

});
	function loadCurPage(i){
		var curPage =  i ;
		console.log(curPage);
			$.ajax({
				type: "post"
				, url: "/layer/write_ok"
				, data: { 
					curPage: curPage
				}
				, dataType: "html"
				, success: function(data){
					console.log("AJAX 성공")
					console.log(data)
					result.innerHTML = data;
	// 				$("#result").html( $("#result").html() + res );
				}
				, error: function(){
					console.log("AJAX 실패")
				}
			})
			$("#cur").html(curPage)
	}
	
	function keyword(){
		
	        $(location).attr("href", "#top");
	        var curPage = 1;
		$.ajax({
			type: "post"
			, url: "/layer/write_ok"
			, data: {
				search: $("#keyWord").val()
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

function dragEnter(ev) {
	ev.preventDefault();
}

function drag(ev) {
	ev.dataTransfer.setData("text", ev.target.id);
}

function drop(ev) {
	ev.preventDefault();
	var data = ev.dataTransfer.getData("text");
	ev.target.appendChild(document.getElementById(data));
}

</script>


<div class="container">

<div class="layer-container">
	<h5>* 원하는 향수를 검색해서 드래그 해보세요</h5>
	<div class="layer-item">
		<div class="layer-img" ondrop="drop(event)" ondragover="dragEnter(event)"></div>
		<div class="graf-bar">그래프</div>
	</div>
	<div class="layer-operator" ><span class="child">+</span></div>
	<div class="layer-item">
		<div class="layer-img" ondrop="drop(event)" ondragover="dragEnter(event)"></div>
		<div class="graf-bar">그래프</div>
	</div>
	<div class="layer-operator" ><span class="child">=</span></div>
	<div class="layer-result">결과</div>
</div>




<div class="search">
	<form action="/layer/write" method="get" style="text-align: center;"> 
		<div class="search_div">
			<input type="text" id="keyWord" onkeyup="keyword()" name="search" size="20px" maxlength="30" placeholder="상품을 검색해보세요." />
		</div>
	</form>
</div>


<%-- <div class="flex-container">
<c:forEach items="${list }" var="perf">
    <div class="flex-items">
		<div class="perf_pic"><img class="perf_img" style="width:70px; height:80px; display: block; margin: auto;"
					src="/resources/img/perf/${perf.STORED_NAME }"></div>
		<div class="perf_name">${perf.PERFUME_NAME }</div>
		<div class="brand_name">${perf.BRAND_NAME }</div>
    </div>
</c:forEach>
<div id="paging">
	<c:import url="/WEB-INF/views/layout/pagingLayer.jsp"/>
</div>
</div> --%>

<div id="result">

</div>


</div><!-- .container -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />
