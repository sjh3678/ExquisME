<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    top: -300px;
    left: 250px;
    border: 3.5px solid black;
    cursor: pointer;
    line-height: 38px;
    font-weight: bold;
    border-radius: 10px;
}
#prev:hover{background: #ccc; color:white;}
#main{
    width: 130px;
    height: 40px;
    position: relative;
    top: -346px;
    left: 725px;
    border: 3.5px solid black;
    cursor: pointer;
    line-height: 38px;
	font-weight: bold;
    border-radius: 10px;
}
#main:hover{background: #ccc;}

a{text-decoration: none; color: black;}
a:hover{text-decoration: none;}
a:active{text-decoration:none;}
a:visited{text-decoration: none; color: black;}
</style>
</head>
<body>
<div class="error-wrap">
	<img alt="" src="/resources/img/error/urlError.png">
	<a href="javascript:history.back();"><div id="prev">이전 페이지</div></a>
	<a href="/"><div id="main">메인 페이지</div></a>
</div>

</body>
</html>