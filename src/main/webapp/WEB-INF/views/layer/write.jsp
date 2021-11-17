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
	border: solid 5px #8B4513;
}
.layer-item {
	width: 20%;
	height: 87%;
	margin: 10px auto;
	padding: 10px;
	border: solid 5px #8B4513;
	float: left;
}
.layer-img {
	border: 5px solid #ccc;
	border-radius: 50px;
}
.layer-img div{
	display: none;
}
.layer-result {
	width: 20%;
	height: 87%;
	margin: 10px auto;
	padding: 10px;
	border: solid 5px #8B4513;
	float: left;
}

.layer-operator {
	width: 20%;
	height: 87%;
	margin: 10px auto;
	padding: 10px;
	border: solid 5px #8B4513;
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
	border:solid 5px #ccc;
}
.graf-bar {
	width:100%;
	height: 30%;
	margin: 0 auto;
	border:solid 5px #ccc;
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
	
	
/* 		var layerResult = ("#img1").children(":first-child");
		var idx = $(this).children().attr("data-img");
		$("[data-div='" + idx + "']").append( layerResult ); */

	
$(".layer-img").on("DOMNodeInserted", function() {
// 	console.log("event")
// 	console.log( $(this).children().length )

	var len = $(this).children().length;
		
	if( len == 1 ) {
// 		console.log('one')
	} else {
// 		console.log('more')
		
		var before = $(this).children(":first-child");
		var idx = $(this).children().attr("data-img");
		$("[data-div='" + idx + "']").append( before );
	}
	
		
})
	

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

	if( $(ev.target).hasClass("perf_img") ) {
		console.log($(ev.target).parent().get(0).appendChild( document.getElementById(data) ));
		$(ev.target).parent().get(0).appendChild( document.getElementById(data) )
	
		var idx = $(ev.target).attr("data-img");
		console.log( idx )
		$("[data-div='" + idx + "']").append( $(ev.target) );
	} else {
		ev.target.appendChild(document.getElementById(data));
	}
}

</script>


<div class="container">

<form action="/layer/write" method="post">	
	<div class="layer-container">
		<h5>* 원하는 향수를 검색해서 드래그 해보세요</h5>
		<div class="layer-item">
			<div class="layer-img" id="img1" ondrop="drop(event)" ondragover="dragEnter(event)"></div>
			<div class="graf-bar" id="graf1">그래프1</div>
		</div>
		<div class="layer-operator" ><span class="child">+</span></div>
		<div class="layer-item">
			<div class="layer-img" id="img2" ondrop="drop(event)" ondragover="dragEnter(event)"></div>
			<div class="graf-bar" id="graf2">그래프2</div>
		</div>
		<div class="layer-operator" ><span class="child">=</span></div>
		<div class="layer-result">결과
			<div class="imgbox1"></div>
			<div class="imgbox2"></div>
		</div>
	</div>
	<input type="button" id="submit" value="전송" />
</form>



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
