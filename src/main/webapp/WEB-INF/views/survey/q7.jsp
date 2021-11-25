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
	width: 100%;
	margin:0 auto;
	float: left;
}

.item img {
	width: 130px;
	height: 130px;
	cursor: pointer;
}

.item div {
	width: 400px;
	height: 50px;
	text-align: center;
	font-weight: bold;
	margin: auto;
	border-radius: 10px;
}
a:link { color: red; text-decoration: none;}
a:visited { color: black; text-decoration: none;}
a:active {
	position: relative;
	top: 1px;
}
.note {
	background-color: gray; 
	color:white;
	line-height: -30px;
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
			<li><span>7</span></li>
			<li><span> </span></li>
		</ul>
	</div>
	<div class="pageQ"><h3>회원님의 연령대를 알려주세요</h3></div>
	<div class="flavorContainer">
			<div class="item">
				<a href="/survey/q8?useName=${useName }&A1=${A1 }&A2=${A2 }&A3=${A3 }&A4=${A4 }&A5=${A5 }&A6=${A6 }&A7=1">
					<div class="note">10대</div></a><br>
			</div>
			<div class="item">
				<a href="/survey/q8?useName=${useName }&A1=${A1 }&A2=${A2 }&A3=${A3 }&A4=${A4 }&A5=${A5 }&A6=${A6 }&A7=2">
					<div class="note">20~30대</div></a><br>
			</div>
			<div class="item">
				<a href="/survey/q8?useName=${useName }&A1=${A1 }&A2=${A2 }&A3=${A3 }&A4=${A4 }&A5=${A5 }&A6=${A6 }&A7=3">
					<div class="note">40~50대</div></a><br>
			</div>
			<div class="item">
				<a href="/survey/q8?useName=${useName }&A1=${A1 }&A2=${A2 }&A3=${A3 }&A4=${A4 }&A5=${A5 }&A6=${A6 }&A7=4">
					<div class="note">60대이상</div></a><br>
			</div>
	</div><!-- flavorContainer end -->
	
</div>

</div><!-- container end -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />