<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<style type="text/css">
input[type=range] {
  height: 28px;
  -webkit-appearance: none;
  margin: 10px 0;
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
  box-shadow: 1px 1px 1px #000000;
  background: #8A7E6B;
  border-radius: 50px;
  border: 1px solid #010101;
}
input[type=range]::-webkit-slider-thumb {
  box-shadow: 1px 1px 2px #000031;
  border: 1px solid #00001E;
  height: 20px;
  width: 40px;
  border-radius: 15px;
  background: #ECE6CC;
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
  box-shadow: 1px 1px 1px #000000;
  background: #8A7E6B;
  border-radius: 50px;
  border: 1px solid #010101;
}
input[type=range]::-moz-range-thumb {
  box-shadow: 1px 1px 2px #000031;
  border: 1px solid #00001E;
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
  border-color: transparent;
  color: transparent;
}
input[type=range]::-ms-fill-lower {
  background: #8A7E6B;
  border: 1px solid #010101;
  border-radius: 100px;
  box-shadow: 1px 1px 1px #000000;
}
input[type=range]::-ms-fill-upper {
  background: #8A7E6B;
  border: 1px solid #010101;
  border-radius: 100px;
  box-shadow: 1px 1px 1px #000000;
}
input[type=range]::-ms-thumb {
  margin-top: 1px;
  box-shadow: 1px 1px 2px #000031;
  border: 1px solid #00001E;
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
	text-align:center;
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
	background-color: #ECE6CC;
	border-radius: 15px;
}
.layer-container h5 {
	margin-top: 10px 5px 0 0 ;
}
.layer-item {
	width: 20%;
	height: 320.5px;
	margin: 10px auto;
	padding-left: 10px;
	float: left;
}
.layer-img {
	border-radius: 50px;
	background-color: #fff;
}
.layer-img div{
/* 	display: none; */
}
.layer-result {
	width: 40%;
	height: 87%;
	margin: 10px auto;
	padding: 10px;
	float: left;
	padding:0px;
}

.layer-operator {
	width: 10%;
	height: 87%;
	margin: 10px auto;
	padding: 10px;
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
	height: 210px;
	margin: 0 auto;
}
.graf-bar {
	width:100%;
	height: 30%;
	margin-top: 15px;
}

li span {
	cursor: pointer;
}
.imgR {
	width: 100%;
	height: 150px;
}

.img_result1{
	width:80px;
	height:90px;
	border: 1px solid #ccc;
	margin-left: 25px;
	float:left;
	background-color: #fff;
}
.slash{
	width:80px; 
	height: 90px; 
	float:left; 
	font-size: 50px; 
	text-align: center;
	margin:0 auto;
}
.img_result2{
	width:80px;
	height:90px;
	border: 1px solid #ccc;
	margin:0 auto;
	float:left;
	background-color: #fff;
}
.perB{
	margin-top:30px;
	width:90%;
	height:30%;
}
.per-1 div {
	float:left;
}
.per-2 div {
	float: right;
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
				$(this).children("div").css("margin", "40px 50px");
				//결과창 div내 자식요소div 스타일 제거
				$(".img_result1").children("div").removeAttr("style");
				//결과창 div내 자식요소div 스타일 등록
				$(".img_result1").children("div").css("margin", "0 auto");
				
				//등록된 요소 더블 클릭 시 삭제
				$(".item-"+counts[0]).dblclick(function() {
					$(this).remove();
				});   
				
//				make_draggable($(".item-"+counts[0])); 
					
				$(".perf_imgSize-"+counts[0]).resizable(resizeOpts);     
				
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
				$(this).children("div").css("text-align", "center");
				//결과창 div내 자식요소div 스타일 제거
				$(".img_result2").children("div").removeAttr("style");
				//결과창 div내 자식요소div 스타일 등록
				$(".img_result2").children("div").css("margin", "0 auto");
				$(".item-"+counts[0]).dblclick(function() {
					$(this).remove();
				});
				$("#img2 .perf_img").addClass("perf_imgSize-"+counts[0]);
				
//				make_draggable($(".item-"+counts[0]));
				
				
				$(".perf_imgSize-"+counts[0]).resizable(resizeOpts);
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
		<h5>* 원하는 향수를 검색해서 드래그 해보세요</h5>
		<div class="layer-item">
		
			<div class="layer-img" id="img1" ></div>
 			<!-- <div class="layer-img" id="img1" ondrop="drop(event)" ondragover="dragEnter(event)"></div> -->
			
			<div class="graf-bar" id="graf1">
			    <input type="range" id="graf-in1" min="1" max="100"/>
				<div id="graf-out1" style="text-align: center;">막대를 조절하여 퍼센트를 정해주세요</div>
			</div>
			
		</div><!-- layer-item -->
		
		<div class="layer-operator" ><span class="child">+</span></div>
		
		<div class="layer-item">
		
			<div class="layer-img" id="img2"></div>
<!-- 			<div class="layer-img" id="img2" ondrop="drop(event)" ondragover="dragEnter(event)"></div> -->
			
			<div class="graf-bar" id="graf2">
				<input id="graf-in2" type="range" min="1" max="100" />
				<div id="graf-out2" style="text-align: center;">막대를 조절하여 퍼센트를 정해주세요</div>
			</div><!-- graf-bar -->
			
		</div><!-- layer-item -->
		
		<div class="layer-operator" ><span class="child">=</span></div>
		<form action="/layer/write" method="post">
			<div class="layer-result">결과
				<div id="imgbox">
					<div class="imgR">
						<div class="img_result1"></div>
						<input type="hidden" name="perfumeNo1" value="$(img_result1).children('img').Attr('data-img')" />
						<div class="slash">/</div>
						<div class="img_result2" ></div>
						<input type="hidden" name="perfumeNo2" value="$(img_result2).img.Attr('data-img')" />
					</div>
					<div class="perB">
						<div class="per-1">
							<div id="per1" style="margin-right:5px;">향수 1 : </div>
							<div id="perbox1"></div>
							<input type="hidden" name="perfume1Per" value="">
						</div>
						<div class="per-2">
							<div id="perbox2"style="margin-left:5px;"></div>
							<div id="per2">향수 2 : </div>
						</div>
					</div>
				</div><!-- imgbox -->
			</div><!-- layer-result -->
		<textarea rows="2" cols="30" maxlength="60" style="resize:none; width:300px;" id="layeringContent" name="layeringContent" placeholder="간단한 소개, 설명을 적어주세요"></textarea>
		<input type="submit" id="submit" value="작성하기" />
		</form>
	</div><!-- layer-container -->


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

<script>
document.querySelector('#graf-in1').addEventListener('input',e=>{
    var value1 = e.target.value + "%";
    var value2 = 100 - e.target.value +"%";
    var value3 = 100 - e.target.value;
    document.querySelector('#graf-out1').innerHTML= value1;
    document.querySelector('#graf-in2').value= value3;
    document.querySelector('#graf-out2').innerHTML= value2;
    document.querySelector('#perbox2').innerHTML= value2;
    document.querySelector('#perbox1').innerHTML= value1;
    document.querySelector('input[name="perfume1Per"]').innerHTML= e.target.value;
});
document.querySelector('#graf-in2').addEventListener('input',i=>{
    var value1 = 100 - i.target.value + "%";
    var value2 = i.target.value + "%";
    var value3 = 100 - i.target.value;
    document.querySelector('#graf-out2').innerHTML= value2;
    document.querySelector('#graf-in1').value= value3;
    document.querySelector('#graf-out1').innerHTML= value1;
    document.querySelector('#perbox1').innerHTML= value1;
    document.querySelector('#perbox2').innerHTML= value2;
    document.querySelector('input[name="perfume1Per"]').innerHTML= 100 - i.target.value;
});

</script>

</div><!-- .container -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />

