<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<style type="text/css">
/*
#btnSub {
	box-shadow:inset 0px 1px 0px 0px #a6827e;
	background:linear-gradient(to bottom, #7d5d3b 5%, #634b30 100%);
	background-color:#7d5d3b;
	border-radius:10px;
	border:1px solid #54381e;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:13px;
	padding:6px 24px;
	text-decoration:none;
	text-shadow:0px 1px 0px #4d3534;
	font-weight: bold;
	position: relative;
    top: -18px;
    left: 10px;
}
#btnSub:hover {
	background:linear-gradient(to bottom, #634b30 5%, #7d5d3b 100%);
	background-color:#634b30;
}
#btnSub:active {
	position:relative;
	top: -17px;
    left: 10px;
}
*/

#btnSub{
    position: relative;
    background: #8A7E6B;
    color: #ECE6CC;
    top: 3px;
    left: 48px;
    width: 42px;
    height: 58px;
    border-radius: 10px;
    padding: 0px;
    text-align: center;
}
#btnSub:hover{
	transform: scale(1.1);
	background: #35312B;
}

input[type=range] {
  height: 28px;
  -webkit-appearance: none;
  margin: 40px 0;
  width: 100%;
  background: #ECE6CC;
}
input[type=range]:focus {
  outline: none;
}
input[type=range]::-webkit-slider-runnable-track {
  width: 100%;
  height: 10px;
  cursor: pointer;
  animate: 0.2s;
/*   box-shadow: 1px 1px 1px #000000; */
  background: #8A7E6B;
  border-radius: 50px;
/*   border: 1px solid #010101; */
}
input[type=range]::-webkit-slider-thumb {
/*   box-shadow: 1px 1px 2px #000031; */
/*   border: 1px solid #00001E; */
  height: 20px;
  width: 40px;
  border-radius: 15px;
  background: #35312B;
  cursor: pointer;
  -webkit-appearance: none;
  margin-top: -6px;
}
input[type=range]:focus::-webkit-slider-runnable-track {
  background: #8A7E6B;
}
input[type=range]::-moz-range-track {
  width: 100%;
  height: 10px;
  cursor: pointer;
  animate: 0.2s;
/*   box-shadow: 1px 1px 1px #000000; */
  background: #8A7E6B;
  border-radius: 50px;
/*   border: 1px solid #010101; */
}
input[type=range]::-moz-range-thumb {
/*   box-shadow: 1px 1px 2px #000031; */
/*   border: 1px solid #00001E; */
  height: 20px;
  width: 40px;
  border-radius: 15px;
  background: #ECE6CC;
  cursor: pointer;
}
input[type=range]::-ms-track {
  width: 100%;
  height: 10px;
  cursor: pointer;
  animate: 0.2s;
  background: transparent;
/*   border-color: transparent; */
  color: transparent;
}
input[type=range]::-ms-fill-lower {
  background: #8A7E6B;
/*   border: 1px solid #010101; */
  border-radius: 100px;
/*   box-shadow: 1px 1px 1px #000000; */
}
input[type=range]::-ms-fill-upper {
  background: #8A7E6B;
/*   border: 1px solid #010101; */
  border-radius: 100px;
/*   box-shadow: 1px 1px 1px #000000; */
}
input[type=range]::-ms-thumb {
  margin-top: 1px;
/*   box-shadow: 1px 1px 2px #000031; */
/*   border: 1px solid #00001E; */
  height: 20px;
  width: 40px;
  border-radius: 15px;
  background: #ECE6CC;
  cursor: pointer;
}
input[type=range]:focus::-ms-fill-lower {
  background: #8A7E6B;
}
input[type=range]:focus::-ms-fill-upper {
  background: #8A7E6B;
}
.container {
	width: 100%;
}
.h5 {
	width: 60%;
	padding: 10px;
	margin: 10px;
	font-weight: 300;
}
.R-title {
	position: relative;
	top: -30px;
	left: -30px;
	text-align: center;
	margin: 0 auto;
	font-size: 21px;
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
	width: 175px;
	height: 220px;
/* 	border: 1px solid red; */
	background: #ECE6CC;
	border-radius: 5px; 
	margin: 4px auto;
	padding: 15px;
}
.perf_pic {
	margin: 0 auto;
	max-width: 170px;
	max-height: 170px;
}

.perf_name {
/* 	border: 1px solid #ccc; */
	width: 150px;
    height: 15px;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
    background: white;
    border-radius: 5px;
    margin: 10px auto;
    text-align: center;
}
.brand_name {
	width: 150px;
    height: 15px;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
    background: white;
    border-radius: 5px;
    margin: 10px auto;
    text-align: center;
}

.search{
	width: 250px;
	height:25px;
	margin: 0px;
	padding: 0px;
	float:left;
}
.search_div{
	padding: 20px 0px 0px 0px;
    position: relative;
    top: -30px;
    left: 8px;
}
}
#paging{
	margin:0 auto;
}
.layer-container{
	width: 100%;
    height: 350px;
    margin: 10px auto;
    margin-bottom: 40px;
    background-color: #ECE6CC;
    border-radius: 15px;
    position: relative;
}
.layer-item {
	width: 20%;
	height: 285px;
	margin: 10px auto;
	padding-left: 10px;
	float: left;
}

.layer-result {
    position: relative;
    width: 240px;
    height: 240px;
    margin: 0 auto;
    padding: 10px;
    float: left;
    padding: 0px;
    border-radius: 15px;
    top: 20px;
    left: 40px;
}

.layer-operator {
	width: 10%;
	height: 285px;
	margin: 10px auto;
	padding: 10px;
	float: left;
}
.layer-operator span {
	position: relative;
	top: 90px;
	left: 90px;
	margin: 0 auto;
	font-size: 36px;
	font-weight: 300;
}
.layer-img {
	padding: 5px;
    width: 170px;
    height: 170px;
    margin: 0 auto;
    border-radius: 20px;
    background-color: #fff;
}
.layer-img-text{
	text-align: center;
    height: 100%;
    position: relative;
    top: 40%;
}
.graf-bar {
	width:100%;
	height: 30%;
	margin-top: 15px;
}

li span {
	cursor: pointer;
}

.imgbox {
	width: 100%;
	height: 140px;
	float:left;
	margin:0 auto;
}
.imgR {
	width: 240px;
	height: 240px;
	border-radius: 20px;
	overflow: hidden;
	background: white;
}

.img_result1{
	width: 120px;
	height: 240px;
	float:left;
	background-color: white;
	overflow: hidden;
}
.img_result2{
	width: 120px;
	height:240px;
	margin:0 auto;
	float:right;
	background-color: white;
	overflow: hidden;
}
.perB{
	margin: 0 auto;
	width:50%;
	height:30px;
}
.per-1 div {
	float:left;
}
.per-2 div {
	float: right;
}
.perf_img{
	margin: 0 auto;
}
.result-bottom {
	width: 38%;
    height: 130px;
    float: left;
}
#img1, #img2{
	position: relative;
    top: 40px;
    left: 50px;
}
#graf1, #graf2{
    position: relative;
    top: 45px;
    left: 50px;
}
#perbox1{
	position: relative;
    margin-left: 5px;
    top: -200px;
    left: -90px;
    font-size: 108px;
    font-weight: 700;
    color: rgb(128, 128, 128, 0.5);
}
#perbox2{
	position: relative;
    margin-left: 5px;
    top: -350px;
    left: 80px;
    font-size: 108px;
    font-weight: 700;
    color: rgb(128, 128, 128, 0.5);
}
#imgbox {
    width: 360px;
    height: 240px;
    background: white;
    border-radius: 20px;
    padding: 0 60px;
}
.layer-item>div>div>div>div{
	width: 150px;
	max-height: 150px;
	margin: auto;
}

</style>



<script type="text/javascript">
var counts = [0]; 


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

				$(".perf_pic").draggable({
					helper: "clone",
					//Create counter
					start: function() { counts[0]++; }
				});

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

	
/* $(".layer-img").on("DOMNodeInserted", function() {
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
	
		
}) */
	
	$("#btnSub").click(function(){
		$("#perfumeNo1").val($(".img_result1").children().children().children().attr("data-img"));
		$("#perfumeNo2").val($(".img_result2").children().children().children().attr("data-img"));
		console.log("perNo1 : "+$("#perfumeNo1").val());
		console.log("perNo2 : "+$("#perfumeNo2").val());

		if ($("#perfumeNo2").val() == "" ) {
			alert("향수를 2가지 선택해 주세요");
			
			return false;
			
		}else if ($("#perfumeNo2").val() == "") {
			alert("향수를 2가지 선택해 주세요");
				
			return false;
		}else if ($("#layeringContent").val() == ""){
			alert("내용을 입력해 주세요")
			
			return false;
		}
		$("#layer-form").submit();
	});
});
	function loadCurPage(i){
		var curPage =  i ;
		console.log(curPage);
			$.ajax({
				type: "post"
				, url: "/layer/write_ok"
				, data: { 
					curPage: curPage
					, search: $("#keyWord").val()
				}
				, dataType: "html"
				, success: function(data){
					console.log("AJAX 성공")
					console.log(data)
					result.innerHTML = data;
	// 				$("#result").html( $("#result").html() + res );
	
					$(".perf_pic").draggable({
						helper: "clone",
						//Create counter
						start: function() { counts[0]++; }
					});
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
				console.log( res )	;
				console.log( curPage )	
				
				$(".perf_pic").draggable({
					helper: "clone",
					//Create counter
					start: function() { counts[0]++; }
				});
			}
			, error: function(res){
				console.log("AJAX 실패")	
			}
		})
	}
	
/* function dragEnter(ev) {
	ev.preventDefault();
}

function drag(ev) {
	ev.dataTransfer.setData("text", ev.target.id);
	console.log("drag : " + ev.target.id)
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
} */

</script>
<script>
$(function(){  
	//Make every clone image unique.  
// 	var counts = [0];
	var resizeOpts = {
		handles: "all" ,autoHide:true
	};    
	
// 	$(".perf_pic").draggable({
// 		helper: "clone",
// 		//Create counter
	
// 		start: function() { counts[0]++; }
// 	});

	$("#img1").droppable({
		drop: function(e, ui){
			console.log("#img1 dropped")
				
			if(ui.draggable.hasClass("perf_pic")) {
					
				if ($("#img1").children().length > 0) {// img1의 자식요소가 1개 이상일 때
					$("#img1").children().remove();	// 기존에 등록된 자식요소 삭제
					$(".img_result1").children().remove(); // 기존에 등록된 결과이미지 삭제
				}
				
				
				$(this).append($(ui.helper).clone()); // 드롭된 div에 클론 입력하기
				
				
				
				$(".img_result1").append($(ui.helper).clone()); // 결과창에 클론 입력하기
				
				//드롭된 이미지 가져오기
				var dropImg = $(ui).innerHTML;
				console.log("dorpImg : " + dropImg)
				console.log("src : ", jQuery(this).children().attr("src"));
				//Pointing to the dragImg class in dropHere and add new class.
				//dropHere의 dragImg 클래스를 가리키고 새 클래스를 추가합니다.
				$("#img1 .perf_pic").addClass("item-"+counts[0]);
				$("#img1 .perf_img").addClass("perf_imgSize-"+counts[0]);
				
				
				//Remove the current class (ui-draggable and dragImg)
				//현재 클래스 제거(ui-dragable 및 dragImg)
				$("#img1 .item-"+counts[0]).removeClass("perf_pic ui-draggable ui-draggable-dragging");
				//드롭된 div내 자식요소div 스타일 제거
				$(this).children("div").removeAttr("style");
				//드롭된 div내 자식요소div 스타일 등록
// 				$(this).children("div").css("margin", "40px 50px");
// 				$(this).children("div").css({"margin":"0px 40px", "padding":"40px 0px 40px 15px"});
//				$(this).children("div").attr(".ui-wrapper").css("margin", "0 auto");
				//결과창 div내 자식요소div 스타일 제거
				$(".img_result1").children("div").removeAttr("style");
				//결과창 div내 자식요소div 스타일 등록
				$(".img_result1").children().css({
					"position":"relative",
					"min-width": "240px",
					"min-height":"240px",
					"background":"white",
					"border-radius":"5px",
					"margin":"0 auto"
					});
				$(".img_result1").children().children().css({
					"max-width": "120px",
					"max-height":"240px",
					"background":"white",
					"border-radius":"5px",
					"margin":"0",
					"overflow":"hidden"
				});

				//결과창 이미지 스타일 제거
				$(".img_result1").children().children().children().removeAttr("style");
				//결과창 이미지 스타일 추가@@@
				$(".img_result1").children().children().children().css({
					"max-width":"240px",
					"max-height":"240px",
					"position":"relative"
					});
				
				var width = $(".img_result1").children().children().children().css("width")
				var parseWidth = parseInt(width)
				var margin = ((240-parseWidth)/2)+"px"
				
				$(".img_result1").children().children().children().css(
					"margin-left",margin
				);
				//등록된 요소 더블 클릭 시 삭제
// 				$(".item-"+counts[0]).dblclick(function() {
// 					$(this).remove();
// 				});   
				
//				make_draggable($(".item-"+counts[0])); 
					
				$(".perf_imgSize-"+counts[0]).resizable(resizeOpts);     
				
				$("#img1").children().children().children().css("margin","auto")
			}
		}
	});
	
	$("#img2").droppable({
		drop: function(e, ui){
		console.log("#img2 dropped")
		
			if(ui.draggable.hasClass("perf_pic")) {
				
				if ($("#img2").children().length > 0) {
					$("#img2").children().remove();
					$(".img_result2").children().remove(); // 기존에 등록된 결과이미지 삭제
				}
				
				$(this).append($(ui.helper).clone());
				
				$(".img_result2").append($(ui.helper).clone()); // 결과창에 클론 입력하기
				
				//Pointing to the dragImg class in dropHere and add new class.
				$("#img2 .perf_pic").addClass("item-"+counts[0]);
				
				//Remove the current class (ui-draggable and dragImg)
				$("#img2 .item-"+counts[0]).removeClass("perf_pic ui-draggable ui-draggable-dragging");
				
				$(this).children("div").removeAttr("style");
// 				$(this).children("div").css("margin", "40px 50px");
// 				$(this).children("div").css({"margin":"0px 40px", "padding":"40px 0px 40px 15px"});
				//결과창 div내 자식요소div 스타일 제거
				$(".img_result2").children("div").removeAttr("style");
				//결과창 div내 자식요소div 스타일 등록
				$(".img_result2").children("div").css({
					"position":"relative",
					"min-width": "240px",
					"min-height":"240px",
					"background":"white",
					"border-radius":"5px",
					"margin":"0 auto"
				});
				$(".img_result2").children().children().css({
					"max-width": "120px",
					"max-height":"240px",
					"background":"white",
					"border-radius":"5px",
					"margin":"0",
					"overflow":"hidden"
				});
				//결과창 이미지 스타일 제거
				$(".img_result2").children().children().children().removeAttr("style");
				//결과창 이미지 스타일 추가
				$(".img_result2").children().children().children().css({
					"max-width":"240px",
					"max-height":"240px",
					"position":"relative",
					"float":"right"
				});
				var width = $(".img_result2").children().children().children().css("width")
				var parseWidth = parseInt(width)
				var margin = ((240-parseWidth)/2)+"px"
				console.log(margin)
				
				$(".img_result2").children().children().children().css(
					"margin-right",margin
				);
// 				$(".item-"+counts[0]).dblclick(function() {
// 					$(this).remove();
// 				});
				$("#img2 .perf_img").addClass("perf_imgSize-"+counts[0]);
				
//				make_draggable($(".item-"+counts[0]));
				
				
				$(".perf_imgSize-"+counts[0]).resizable(resizeOpts);
				
				$("#img2").children().children().children().css("margin","auto")
			}
		}
	});


	var zIndex = 0;
	function make_draggable(elements)
	{	
		elements.draggable({
			containment:'parent',
			start:function(e,ui){ ui.helper.css('z-index',++zIndex); },
			stop:function(e,ui){
			}
		});
	}    


	    
	   });
</script>

<div class="container">

	<div class="layer-container">
		<div class="layer-item">
		
			<div class="layer-img" id="img1"><div class="layer-img-text">향수를 드래그해서<br>올려 보세요.</div></div>
 			<!-- <div class="layer-img" id="img1" ondrop="drop(event)" ondragover="dragEnter(event)"></div> -->
			
			<div class="graf-bar" id="graf1">
			    <input type="range" id="graf-in1" min="1" max="99"/>
				<div id="graf-out1" style="text-align: center; color:transparent;"></div>
			</div>
			
		</div><!-- layer-item -->
		
		<div class="layer-operator" ><span class="child">+</span></div>
		
		<div class="layer-item">
		
			<div class="layer-img" id="img2"><div class="layer-img-text">향수를 드래그해서<br> 올려 보세요.</div></div>
<!-- 			<div class="layer-img" id="img2" ondrop="drop(event)" ondragover="dragEnter(event)"></div> -->
			
			<div class="graf-bar" id="graf2">
				<input id="graf-in2" type="range" min="1" max="99" />
				<div id="graf-out2" style="text-align: center; color:transparent;"></div>
			</div><!-- graf-bar -->
			
		</div><!-- layer-item -->
		
		<div class="layer-operator" ><span class="child" style="left: 70px;">=</span></div>
		<form id="layer-form" action="/layer/write" method="post">
			<div class="layer-result">
<!-- 				<div class="R-title">조합 결과</div> -->
				<div id="imgbox">
					<div class="imgR">
						<div class="img_result1"></div>
						<input type="hidden" id="perfumeNo1" name="perfumeNo1" value=""/>
						<div class="img_result2" ></div>
						<input type="hidden" id="perfumeNo2" name="perfumeNo2" value=""/>
					</div>
					<div class="perB">
						<div class="per-1">
							<span id="perbox1">50</span>
							<input type="hidden" id="perfume1Per" name="perfume1Per" value="50">
						</div>
						<div class="per-2">
							<span id="perbox2"style="margin-left:5px;">50</span>
						</div>
					</div>
				</div><!-- imgbox -->
			</div><!-- layer-result -->
			<div class="result-bottom">
				<textarea rows="2" cols="30" maxlength="60" 
				style="resize:none; width:310px; border:0px; border-radius: 10px; padding: 10px; position: relative; top: 30px; left: 40px;"
				id="layeringContent" name="layeringContent" placeholder="간단한 소개와 설명을 적어주세요. (60자 이내)"></textarea>
				<button class="btn" type="button" id="btnSub">작성</button>
			</div>
		</form>
	</div><!-- layer-container -->


<div class="search">
		<div class="search_div">
			<input class="form-control" type="text" id="keyWord" onkeyup="keyword()" name="search" size="20px" maxlength="30" placeholder="상품을 검색해 보세요." />
		</div>
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

<script>
document.querySelector('#graf-in1').addEventListener('input',e=>{
    var value1 = e.target.value;
    var value2 = 100 - e.target.value;
    var value3 = 100 - e.target.value;
    document.querySelector('#graf-out1').innerHTML= value1;
    document.querySelector('#graf-in2').value= value3;
    document.querySelector('#graf-out2').innerHTML= value2;
    document.querySelector('#perbox2').innerHTML= value2;
    document.querySelector('#perbox1').innerHTML= value1;
    document.querySelector("#perfume1Per").value = e.target.value;
});
document.querySelector('#graf-in2').addEventListener('input',i=>{
    var value1 = 100 - i.target.value;
    var value2 = i.target.value;
    var value3 = 100 - i.target.value;
    document.querySelector('#graf-out2').innerHTML= value2;
    document.querySelector('#graf-in1').value= value3;
    document.querySelector('#graf-out1').innerHTML= value1;
    document.querySelector('#perbox1').innerHTML= value1;
    document.querySelector('#perbox2').innerHTML= value2;
    document.querySelector("#perfume1Per").value = value3;
});

</script>

</div><!-- .container -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />

