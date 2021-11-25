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

.item div {
	width: 300px;
	height: 50px;
	text-align: center;
	font-weight: bold;
	margin: auto;
	border-radius: 10px;
}
a:link { color: white; text-decoration: none;}
a:visited { color: white; text-decoration: none;}
a:active {
	position: relative;
	top: 1px;
}
.gender {
	background-color: gray; 
	color: white;
	display:table-cell;
	vertical-align: middle;
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
	<div class="pageQ"><h3>회원님의 성별을 알려주세요</h3></div>
	<div class="flavorContainer">
			<div class="item">
				<a href="/survey/result?useName=${useName }&A1=${A1 }&A2=${A2 }&A3=${A3 }&A4=${A4 }&A5=${A5 }&A6=${A6 }&A7=${A7}&A8=1">
				<div class="gender">여성</div></a><br>
			</div>
			<div class="item">
				<a href="/survey/result?useName=${useName }&A1=${A1 }&A2=${A2 }&A3=${A3 }&A4=${A4 }&A5=${A5 }&A6=${A6 }&A7=${A7}&A8=2">
				<div class="gender">남성</div></a><br>
			</div>
	</div><!-- flavorContainer end -->
	
</div>

</div><!-- container end -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />