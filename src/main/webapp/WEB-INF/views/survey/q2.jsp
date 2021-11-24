<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/header.jsp" /> 
<style type="text/css">
.container {
	width:90%;
	background: linear-gradient(180deg, #ECE6CC 40%, #ffffff 60%);
	border-radius: 10px;
}
.pagination-sm>li:first-child>a, .pagination-sm>li:first-child>span {
    border-radius: 150px;
}
.pagination>li>span {
	min-width: 30px;
	min-height: 30px;
    position: relative;
    float: left;
    margin-left: -1px;
    line-height: 1.42857143;
    text-decoration: none;
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 150px;
	margin-left: 10px;
	font-weight: bold;
	color: #000;
}
.pagination-sm>li:last-child>span {
    border-radius: 150px;
}
.flavorContainer {
	width: 50%;
	text-align:center;
	margin: auto;
}
.pageQ {
	text-align: center;
	margin-top: 50px;
	margin-bottom: 100px;
}

.item {
	width: 50%;
	margin:0 auto;
	float: left;
}

.item img {
	width: 130px;
	height: 130px;
	cursor: pointer;
}

.item div {
	width: 130px; 
	text-align: center;
	font-weight: bold;
	margin: auto;
}

</style>

<div class="container">

<div class="q2Container">
	<div class="curPage">
		<ul class="pagination pagination-sm">
			<li><span> </span></li>
			<li><span>2</span></li>
			<li><span> </span></li>
			<li><span> </span></li>
			<li><span> </span></li>
			<li><span> </span></li>
			<li><span> </span></li>
			<li><span> </span></li>
		</ul>
	</div>
	<div class="pageQ"><h3>이 중 가장 좋아하는 분위기는 어떤 것일까요?</h3></div>
	<div class="flavorContainer">
		<c:if test="${A1 eq 1 }">
			<div class="item">
				<a href="/survey/q3?useName=${useName }&A1=1&A2=1">
					<img alt="다정한" src="/resources/img/survey/2-fond.jpg"></a><br>
				<div>1.다정한</div>
			</div>
			<div class="item">
				<a href="/survey/q3?useName=${useName }&A1=1&A2=2">
					<img alt="달콤한" src="/resources/img/survey/2-sweety.jpg"><br>
				</a>
				<div>2.달콤한</div>
			</div>
			<div class="item">
				<a href="/survey/q3?useName=${useName }&A1=1&A2=3">
					<img alt="포근한" src="/resources/img/survey/2-comfy.jpg"><br>
				</a>
				<div>3.포근한</div>
			</div>
			<div class="item">
				<a href="/survey/q3?useName=${useName }&A1=1&A2=4">
					<img alt="우아한" src="/resources/img/survey/2-elegant.jpg"><br>
				</a>
				<div>4.우아한</div>
			</div>
		</c:if><!-- if test="${A1 eq 1 }" end -->
		<c:if test="${A1 eq 2 }">
			<div class="item">
				<a href="/survey/q3?useName=${useName }&A1=2&A2=1">
					<img alt="새콤한" src="/resources/img/survey/2-acidulous.jpg"></a><br>
				<div>1.새콤한</div>
			</div>
			<div class="item">
				<a href="/survey/q3?useName=${useName }&A1=2&A2=2">
					<img alt="달콤한" src="/resources/img/survey/2-sweety.jpg"><br>
				</a>
				<div>2.달콤한</div>
			</div>
			<div class="item">
				<a href="/survey/q3?useName=${useName }&A1=2&A2=3">
					<img alt="신선한" src="/resources/img/survey/2-fresh.jpg"><br>
				</a>
				<div>3.신선한</div>
			</div>
			<div class="item">
				<a href="/survey/q3?useName=${useName }&A1=2&A2=4">
					<img alt="가벼운" src="/resources/img/survey/2-light.jpg"><br>
				</a>
				<div>4.가벼운</div>
			</div>
		</c:if><!-- if test="${A1 eq 1 }" end -->
		<c:if test="${A1 eq 3 }">
			<div class="item">
				<a href="/survey/q3?useName=${useName }&A1=3&A2=1">
					<img alt="매력적인" src="/resources/img/survey/2-attractive.jpg"></a><br>
				<div>1.매력적인</div>
			</div>
			<div class="item">
				<a href="/survey/q3?useName=${useName }&A1=3&A2=2">
					<img alt="포근한" src="/resources/img/survey/2-comfy.jpg"><br>
				</a>
				<div>2.포근한</div>
			</div>
			<div class="item">
				<a href="/survey/q3?useName=${useName }&A1=3&A2=3">
					<img alt="달콤한" src="/resources/img/survey/2-sweety.jpg"><br>
				</a>
				<div>3.달콤한</div>
			</div>
			<div class="item">
				<a href="/survey/q3?useName=${useName }&A1=3&A2=4">
					<img alt="우아한" src="/resources/img/survey/2-elegant.jpg"><br>
				</a>
				<div>4.우아한</div>
			</div>
		</c:if><!-- if test="${A1 eq 1 }" end -->
		<c:if test="${A1 eq 4 }">
			<div class="item">
				<a href="/survey/q3?useName=${useName }&A1=4&A2=1">
					<img alt="포근한" src="/resources/img/survey/2-comfy.jpg"></a><br>
				<div>1.포근한</div>
			</div>
			<div class="item">
				<a href="/survey/q3?useName=${useName }&A1=4&A2=2">
					<img alt="시원한" src="/resources/img/survey/2-cool.jpg"><br>
				</a>
				<div>2.시원한</div>
			</div>
			<div class="item">
				<a href="/survey/q3?useName=${useName }&A1=4&A2=3">
					<img alt="단단한" src="/resources/img/survey/2-hard.jpg"><br>
				</a>
				<div>3.단단한</div>
			</div>
			<div class="item">
				<a href="/survey/q3?useName=${useName }&A1=4&A2=4">
					<img alt="깔끔한" src="/resources/img/survey/2-neat.jpg"><br>
				</a>
				<div>4.깔끔한</div>
			</div>
		</c:if><!-- if test="${A1 eq 1 }" end -->
	</div><!-- flavorContainer end -->
	
</div>

</div><!-- container end -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />