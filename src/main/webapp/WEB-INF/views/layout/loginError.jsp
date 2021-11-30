<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<style type="text/css">
.error-wrap {
    width: 1100px;
    height: 800px;
    margin: 0 auto;
	text-align: center;
}
#prev {
    width: 130px;
    height: 40px;
    position: relative;
    top: -155px;
    left: 390px;
    border: 3.5px solid black;
    cursor: pointer;
    line-height: 38px;
    font-weight: bold;
    border-radius: 10px;
}
#prev:hover{background: #ccc; color:black;}
#login{
    width: 130px;
    height: 40px;
    position: relative;
    top: -195px;
    left: 585px;
    border: 3.5px solid black;
    cursor: pointer;
    line-height: 38px;
	font-weight: bold;
    border-radius: 10px;
}
#login:hover{background: #ccc;}

a{text-decoration: none; color: black;}
a:hover{text-decoration: none;}
a:active{text-decoration:none;}
a:visited{text-decoration: none; color: black;}
</style>
<div class="container">

<div class="error-wrap">
	<img alt="" src="/resources/img/error/loginError.png">
	<a href="javascript:history.back();"><div id="prev">이전 페이지</div></a>
	<a href="/user/login"><div id="login">로그인 페이지</div></a>
</div>

</div><!-- .container -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />