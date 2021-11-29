<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">

.item-container{ 
	width: 100%; 
	height: 100vh; 
	position: relative;
} 
.title{
	position: absolute;
	top:20%;
	left:35%;
}
.input{
	position: absolute;
	top:30%;
	left:38%;
}
.submit{
	position: absolute;
	top:35%;
	left:41%;
}
#name{
	margin: 0 auto;
	width: 250px;
	height: 40px;
 	border-radius:5px; 
 	text-align: center;
}
.btnsub {
	background:linear-gradient(to bottom, #eae0c2 5%, #ccc2a6 100%);
	background-color:#eae0c2;
 	border-radius:5px; 
	border:1px solid #333029;
	display:inline-block;
	cursor:pointer;
	color:#505739;
	font-family:Arial;
	font-size:17px;
	font-weight:bold;
	padding:5px 60px;
	text-decoration:none;
	text-shadow:0px 1px 0px #ffffff;
}
.btnsub:hover {
	background:linear-gradient(to bottom, #ccc2a6 5%, #eae0c2 100%);
	background-color:#ccc2a6;
}
.btnsub:active {
	position:relative;
	top:1px;
}
</style>
<div class="container">

	<div class="item-container">
		<div class="title"><h4>회원님의 성함 또는 호칭을 입력 해 주세요</h4></div><br>
		<form id="nameform" name="nameform" action="/survey/q1">
			<input type="hidden"/>
			<div class="input">
				<input type="text" id="name" name="useName" placeholder="이름 입력 칸 (최대 10글자)" maxlength="10"/><br>
			</div>
			<div class="submit">
				<input type="submit" class="btnsub" id="nameSub" value="입력완료" />
			</div>
		</form>
	</div>

</div><!-- container end -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />