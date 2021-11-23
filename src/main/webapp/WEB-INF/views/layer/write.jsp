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
/* 	display: none; */
}
.layer-result {
	width: 30%;
	height: 87%;
	margin: 10px auto;
	padding: 10px;
	border: solid 5px #8B4513;
	float: left;
}

.layer-operator {
	width: 15%;
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
.imgR {
	width: 90%;
	height: 70%;
}
.imgR img {
	float: left;
}
.img_result1{
	margin-left: 40px;
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
					$("#img1").children().remove()	// 기존에 등록된 자식요소 삭제
				}
					
				$(this).append($(ui.helper).clone()); // 드롭된 div에 클론 입력하기
				
				//드롭된 이미지 src 가져오기
				var src = jQuery(this).children().attr("src");
				console.log("src : ", jQuery(this).children().attr("src"));
				//Pointing to the dragImg class in dropHere and add new class.
				//dropHere의 dragImg 클래스를 가리키고 새 클래스를 추가합니다.
				$("#img1 .perf_pic").addClass("item-"+counts[0]);
				$("#img1 .perf_img").addClass("perf_imgSize-"+counts[0]);
				$("#img3 .perf_pic").addClass("item-"+counts[0]);
				$("#img3 .perf_img").addClass("perf_imgSize-"+counts[0]);
				
				
				//Remove the current class (ui-draggable and dragImg)
				//현재 클래스 제거(ui-dragable 및 dragImg)
				$("#img1 .item-"+counts[0]).removeClass("perf_pic ui-draggable ui-draggable-dragging");
				$("#img3 .item-"+counts[0]).removeClass("perf_pic ui-draggable ui-draggable-dragging");
				
				//드롭된 div내 자식요소div 스타일 제거
				$(this).children("div").removeAttr("style");
				$("#img3").children("div").removeAttr("style");
				
				//드롭된 div내 자식요소div 스타일 등록
				$(this).children("div").css("margin", "40px 50px");
				$("#img3").children("div").css("margin", "40px 50px");
				/* $("#img1 div").css({"width":"200px", "height":"200px", "display":"block", "margin":"auto"}) */
				
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
		console.log("결과2"+ $(this).children("img").css("src"))
		
			if(ui.draggable.hasClass("perf_pic")) {
				
				if ($("#img2").children().length > 0) {
					$("#img2").children().remove()
				}
				
				var src = $(this).children("img").css("src");
				
				$(this).append($(ui.helper).clone());
				$(".img_result").find('img').css("src", src);
				
				//Pointing to the dragImg class in dropHere and add new class.
				$("#img2 .perf_pic").addClass("item-"+counts[0]);
				
				//Remove the current class (ui-draggable and dragImg)
				$("#img2 .item-"+counts[0]).removeClass("perf_pic ui-draggable ui-draggable-dragging");
				
				$(this).children("div").removeAttr("style");
				$(this).children("div").css("margin", "40px 50px");
				
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
				<input id="graf-in2" type="range" min="1" max="100"/>
				<div id="graf-out2" style="text-align: center;">막대를 조절하여 퍼센트를 정해주세요</div>
			</div><!-- graf-bar -->
			
		</div><!-- layer-item -->
		
		<div class="layer-operator" ><span class="child">=</span></div>
		
		<div class="layer-result">결과
			<div id="imgbox">
				<div class="imgR">
					<div id="img3" class="img_result1"><img alt="이미지를 등록해 주세요"  style="width:70px; height: 80px; margin:auto; display:block;"></div>
					<div style="width:70px; height: 80px; float:left; font-size: 50px; text-align: center;">/</div>
					<div class="img_result2" ><img alt="이미지를 등록해 주세요"  style="width:70px; height: 80px; margin:auto; display:block;"></div>
				</div>
				<div class="perB">
					<div class="per-1">
						<div id="per1" style="margin-right:5px;">향수 1 : </div>
						<div id="perbox1"></div>
					</div>
					<div class="per-2">
						<div id="perbox2"style="margin-left:5px;"></div>
						<div id="per2">향수 2 : </div>
					</div>
				</div>
			</div><!-- imgbox -->
		</div><!-- layer-result -->
		
		<input type="button" id="submit" value="전송" />
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
});

</script>

</div><!-- .container -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />

