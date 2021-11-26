<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/header.jsp" />

<script>
$(document).ready(function(){	

	$(".btnPerf").click(function(){
		location.href="/survey/name";
	});

	//이미지 슬라이더
	var $slider_list = $("#slider li")
	console.log($slider_list)
	$slider_list.css("left", $("#sliderbox").css("width"))
	
	$slider_list.eq(0).css("left", 0)
	
	//--------------------------------------------------
	var sliderClick = function(){
		//#sliderbox에 클릭 이벤트 발생 시키기
		$("#sliderbox").click()
	}
	
	//4초마다 #sliderbox에 클릭 이벤트 발생 시키기
	var tid = setInterval(sliderClick, 4000)
	
	//--------------------------------------------------
	
	
	//현재 보여지는 슬라이드의 인덱스
	var curSlide = 0;
	$("#sliderbox").click(function(){
		
		//초기화하고 다시 4초 걸어주기
		clearInterval(tid)
		tid = setInterval(sliderClick, 4000)
		
		console.log("slider clicked")
		
		//다음에 보여지는 슬라이드의 인덱스
		var nextSlide = curSlide + 1
		nextSlide %= $slider_list.length
		
		console.log(curSlide, nextSlide)
		
		if(curSlide!=nextSlide){//다음에 보여지는 슬라이드가 없을 경우
		//현재 슬라이드 보여주기
		$slider_list.eq(curSlide).animate({"left" : "-=" + $("#sliderbox").css("width")})
		
		//다음 슬라이드 "준비하기"
		$slider_list.eq(nextSlide).css("left", $("#sliderbox").css("width"))
		
		//다음 슬라이드 보여주기
		$slider_list.eq(nextSlide).animate({"left" : "-=" + $("#sliderbox").css("width")})
		
		curSlide++
		curSlide %= $slider_list.length
		}
	})
})

</script>

<style>
.section>div {
    height:300px;
    width: 49%;
    border-radius: 10px;
    margin: 3px;
    margin-bottom: 10px;
    text-align: center;
    vertical-align: middle;
}

#top {
    float: left;
    width: 100%;
	background-color: rgb(236, 230, 204, 0.5);
    padding-top: 50px;
}

#topR {
    float: right;
    margin-right: -2px;
    background-color: rgb(138, 126, 107, 0.5);
    padding-top: 50px;
}

#topL {
    float: left;
    background-color: rgb(236, 230, 204, 0.5);
    padding-top: 50px;
}

#middle {
    float: left;
    height: 345px;
    width: 100%;
    background-color: rgb(236, 230, 204);
	color: rgb(53, 49, 43);
}


#middleL {
	float: left;
	height: 280px;
	width: 26%;
	margin: 10px;
	background-color: transparent;
}

#middleR {
	float: right;
	height: 290px;
	width: 71%;
	background-color: transparent;
    padding-top: 50px;
}
#middleTop {
	float: left;
	height: 30px;
	width: 97%;
	margin: 16px;
	margin-bottom: 0px;
	background-color: rgb(138, 126, 107, 0.5);
	color: rgb(53, 49, 43);
	font-size: 21px;
	font-weight: 300;
	vertical-align: middle;
	border-radius: 10px;
}
#base {
	float: left;
	height: 400px;
    width: 100%;
	margin-bottom: 40px; 
    background-color: rgb(138, 126, 107, 0.5);
}
#baseTop {
	float: left;
	height: 30px;
	width: 97%;
	margin: 16px;
	background-color: rgb(236, 230, 204);
	color: rgb(53, 49, 43);
	font-size: 21px;
	font-weight: 300;
	vertical-align: middle;
	border-radius: 10px;
}
.card {
	height: 100%;
    width: 1040px;
    margin: 0;
}
.card>div {
	float: left;
	height: 322px;
	width: 200px;
	background-color: white;
	margin: 0 4px;
	border-radius: 5px;
}
.cardTitle{
	width: 100%;
	float: left;
	margin-top: 10px;
}
.cardTitleImage{
	float: left;
	margin-left: 10px;
}
.cardTitleNick{
	float: left;
	margin-left: 10px;
}
.cardImage{
	width: 100%;
	float: left;
	height: 250px;
}
.cardHeart{
	width: 100%;
	float: left;
}
.btnHome {
	display: block;
	height: 60px;
    width: 240px;
	background-color: rgb(53, 49, 43, 0.8);
	color: rgb(236, 230, 204);
	font-size: 21px;
	font-weight: 300;
	margin: 0 auto;
	margin-top: 50px;
}
.btnHome:hover {
	transform: scale(1.02);
	background-color: rgb(138, 126, 107);
}

#sliderbox {
	height: 274px;
	width: 1040px;
/*  	border: 1px solid red; */
	
	/* 외부 여백 */
	margin: 0 auto;
	
	/* div 영역을 벗어난 부분을 안 보이게 처리 */
	/* overflow: visible; /* 일단 보이게 해서 작업 후에 hidden으로 변경 */
	overflow: hidden;
	
}
#slider {
	padding: 0;
	margin: 0;
	list-style-type: none;
	
	position: relative;
}
#slider li {
	position: absolute;
}
#poster {
    height: 265px;
    background-size: contain;
    background-repeat: no-repeat;
    background-position: center;
    border-radius: 10px;
}
#pName {
	font-size: 18px;
	font-weight: 700;
}
#pVital {
	font-size: 21px;
}
#pLike, #pDislike {
	font-size: 15px;
}
#pBrand {
	font-size: 28px;
}
#middleImg{
	 width: 270px;
	 height: 270px;
	 background: #FFF;
	 border-radius: 10px;
}
#middleImg:hover {
	transform: scale(1.02);
}
.cardFrame:hover { 
	transform: scale(1.02);
}

</style>

<div class="container">
	<div class="section">
		<c:if test="${login eq null }">
			<div id="top">
			오늘 내 기분에 가장 잘 어울리는 향기는 무엇일까?
			<button class="btn btnHome btnPerf">나만의 노트 찾기</button>
			</div>
		</c:if>
		<c:if test="${login }">		
			<div id="topL">
			오늘 내 기분에 가장 잘 어울리는 향기는 무엇일까?
			<button class="btn btnHome btnPerf">나만의 노트 찾기</button>
			</div>
			<div id="topR">
			나만 알고 있었던 향기로운 조합!
			<button class="btn btnHome">나만의 레이어 등록하기</button>
			</div>
		</c:if>
		<div id="middle">
		<div id="middleTop">가장 사랑 받는 향수</div>
			<div id="middleL">	
				<div class="main_list">
					<div class="list_start" id="sliderbox">
						<ul id="slider">
						<c:forEach items="${list }" var="showList">
							<li>
							<div class="list_detail" id="middleImg">
								<a href="/perf/view?perfumeNo=${showList.PERFUME_NO }">
								<img class="poster" id="poster" src="/upload/${showList.STORED_NAME }"/>
								</a>
							</div>
							<div class="middleR" style="position: absolute; top: 0px; left: 300px; float: right; height: 270px; width: 730px; background-color: transparent; padding-top: 50px;">
								<p id="pName">${showList.PERFUME_NAME }</p>
								<p id="pVital">${showList.PERFUME_VITALITY }</p>
								<p id="pLike">이 향수를 좋아하는 분 ${showList.LIKECNT}명</p>
								<p id="pDislike">이 향수를 싫어하는 분 ${showList.DISLIKECNT }명</p>
								<p id="pBrand">${showList.BRAND_NAME }</p>
							</div>
							</li>
						</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			
		</div>
		<div id="base">
			<div id="baseTop">
			가장 많은 좋아요를 받은 EXTAGRAM
			</div>
			<div class="card" style="height: 400px; width: 1040px; margin: 0 15px;">
			<c:forEach items="${listExta }" var="listExta">
				<div class="cardFrame" onclick="location.href='/extagram/view?exNo=${listExta.EX_NO}';" style="cursor: pointer;">
				<div class="cardTitle">
					<div class="cardTitleImage">
					<img style="width: 30px; height: 30px; border-radius: 70%;" src="/upload/${listExta.PROFILE}">
					</div>
					<div class="cardTitleNick">${listExta.NICK }</div>
				</div>
				<div class="cardImage">
					<img style="max-width: 95%; max-height: 240px; display: block; margin: 10px auto;" src="/upload/${listExta.PICTURE}">
				</div>
				<div class="cardHeart">
					<img style="width: 20px; height: auto;" src="/resources/img/heart/heartRed.png"/> ${listExta.HEART }&nbsp;&nbsp;
					<img style="width: 20px; height: auto;" src="/resources/img/heart/balloonBlue.png"/> ${listExta.COMM }
				</div>
				</div>
			</c:forEach>
			</div>
		</div>
	</div>
</div><%-- .container --%>

<c:import url="/WEB-INF/views/layout/footer.jsp" />