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
			<li><span> </span></li>
			<li><span> </span></li>
			<li><span> </span></li>
			<li><span> </span></li>
			<li><span> </span></li>
			<li><span> </span></li>
			<li><span>8</span></li>
		</ul>
	</div>
	<div class="pageQ"><h3>8번 질문</h3></div>
	<div class="flavorContainer">
			<div class="item">
				<a href="/survey/result?useName=${useName }&A1=${A1 }&A2=${A2 }&A3=${A3 }&A4=${A4 }&A5=${A5 }&A6=${A6 }&A7=${A7 }&A8=1">
					<img alt="꽃" src="/resources/img/survey/1-flower.jpg"></a><br>
				<div>Q8-A1</div>
			</div>
			<div class="item">
				<a href="/survey/result?useName=${useName }&A1=${A1 }&A2=${A2 }&A3=${A3 }&A4=${A4 }&A5=${A5 }&A6=${A6 }&A7=${A7 }&A8=2">
					<img alt="과일" src="/resources/img/survey/1-fruit.jpg"><br>
				</a>
				<div>Q8-A2</div>
			</div>
			<div class="item">
				<a href="/survey/result?useName=${useName }&A1=${A1 }&A2=${A2 }&A3=${A3 }&A4=${A4 }&A5=${A5 }&A6=${A6 }&A7=${A7 }&A8=3">
					<img alt="달콤" src="/resources/img/survey/1-sweet.jpg"><br>
				</a>
				<div>Q8-A3</div>
			</div>
			<div class="item">
				<a href="/survey/result?useName=${useName }&A1=${A1 }&A2=${A2 }&A3=${A3 }&A4=${A4 }&A5=${A5 }&A6=${A6 }&A7=${A7 }&A8=4">
					<img alt="바다" src="/resources/img/survey/1-sea.jpg"><br>
				</a>
				<div>Q8-A4</div>
			</div>
	</div><!-- flavorContainer end -->
	
</div>

</div><!-- container end -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />