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
	background-color: #35312B; 
	color:white;
}
.note:hover {
	background-color: #fff;
	color: #35312B;
	border: 5px solid #35312B;
}
</style>

<div class="container">

<div class="q2Container">
	<div class="curPage">
		<ul class="pagination pagination-sm">
			<li><span> </span></li>
			<li><span> </span></li>
			<li><span> </span></li>
			<li><span>4</span></li>
			<li><span> </span></li>
			<li><span> </span></li>
			<li><span> </span></li>
			<li><span> </span></li>
		</ul>
	</div>
	<div class="pageQ"><h3>가장 중요하게 생각하는 노트는 무엇인가요?</h3></div>
	<div class="flavorContainer">
			<div class="item">
				<a href="/survey/q5?useName=${useName }&A1=${A1 }&A2=${A2 }&A3=${A3 }&A4=1">
				<div class="note">Top-Notes <br>향수를 뿌린 후 10분 전후에 나타나는 향으로 향의 첫 느낌</div></a><br>
			</div>
			<div class="item">
				<a href="/survey/q5?useName=${useName }&A1=${A1 }&A2=${A2 }&A3=${A3 }&A4=2">
					<div class="note">Middle-Notes <br>향수를 뿌린 후 30~60 뒤 안정된 상태</div></a><br>
			</div>
			<div class="item">
				<a href="/survey/q5?useName=${useName }&A1=${A1 }&A2=${A2 }&A3=${A3 }&A4=3">
					<div class="note">Base-Notes <br>향수를 뿌린 후 2~3시간이 지난 후부터 향이 모두 날아가기까지</div></a><br>
			</div>
	</div><!-- flavorContainer end -->
	
</div>

</div><!-- container end -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />