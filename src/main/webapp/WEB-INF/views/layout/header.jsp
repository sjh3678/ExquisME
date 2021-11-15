<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%-- JQUERY --%>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<%-- BOOTSTRAP --%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style type="text/css">
					<%-- ################################################## --%>
					/* noto-sans-kr-300 - korean */
					@font-face {
					  font-family: 'Noto Sans KR';
					  font-style: normal;
					  font-weight: 300;
					  src: url('../fonts/noto-sans-kr-v21-korean-300.eot'); /* IE9 Compat Modes */
					  src: local(''),
					       url('../fonts/noto-sans-kr-v21-korean-300.eot?#iefix') format('embedded-opentype'), /* IE6-IE8 */
					/*        url('../fonts/noto-sans-kr-v21-korean-300.woff2') format('woff2'), /* Super Modern Browsers */ */
					/*        url('../fonts/noto-sans-kr-v21-korean-300.woff') format('woff'), /* Modern Browsers */ */
					/*        url('../fonts/noto-sans-kr-v21-korean-300.ttf') format('truetype'), /* Safari, Android, iOS */ */
					       url('../fonts/noto-sans-kr-v21-korean-300.svg#NotoSansKR') format('svg'); /* Legacy iOS */
					}
					/* noto-sans-kr-regular - korean */
					@font-face {
					  font-family: 'Noto Sans KR';
					  font-style: normal;
					  font-weight: 400;
					  src: url('../fonts/noto-sans-kr-v21-korean-regular.eot'); /* IE9 Compat Modes */
					  src: local(''),
					       url('../fonts/noto-sans-kr-v21-korean-regular.eot?#iefix') format('embedded-opentype'), /* IE6-IE8 */
					/*        url('../fonts/noto-sans-kr-v21-korean-regular.woff2') format('woff2'), /* Super Modern Browsers */ */
					/*        url('../fonts/noto-sans-kr-v21-korean-regular.woff') format('woff'), /* Modern Browsers */ */
					/*        url('../fonts/noto-sans-kr-v21-korean-regular.ttf') format('truetype'), /* Safari, Android, iOS */ */
					       url('../fonts/noto-sans-kr-v21-korean-regular.svg#NotoSansKR') format('svg'); /* Legacy iOS */
					}
					/* noto-sans-kr-700 - korean */
					@font-face {
					  font-family: 'Noto Sans KR';
					  font-style: normal;
					  font-weight: 700;
					  src: url('../fonts/noto-sans-kr-v21-korean-700.eot'); /* IE9 Compat Modes */
					  src: local(''),
					       url('../fonts/noto-sans-kr-v21-korean-700.eot?#iefix') format('embedded-opentype'), /* IE6-IE8 */
					/*        url('../fonts/noto-sans-kr-v21-korean-700.woff2') format('woff2'), /* Super Modern Browsers */ */
					/*        url('../fonts/noto-sans-kr-v21-korean-700.woff') format('woff'), /* Modern Browsers */ */
					/*        url('../fonts/noto-sans-kr-v21-korean-700.ttf') format('truetype'), /* Safari, Android, iOS */ */
					       url('../fonts/noto-sans-kr-v21-korean-700.svg#NotoSansKR') format('svg'); /* Legacy iOS */
					}
					<%-- ################################################## --%>

.wrap {
 	font-family: 'Noto Sans KR';
 	font-weight: 300;
	margin: 0 auto;
	width: 1100px;
}

.header, .footer{
	font-size: 21px;
 	font-weight: 700;
	color: #35312B;
	text-align: center;
	background: #8A7E6B;
}

.container{
	min-height: 400px;
}

.unique a:link{
	color: #ECE6CC;
}
.unique a:hover{
	color: #35312B;
}
.header{
/* 	position: fixed; */
	top: 0;
/* 	width: 100%; */
	left: 0;
	right: 0;
}
</style>

</head>
<body>

<div class="wrap">

<header class="header">
헤더 영역
<div class="unique" style="font-weight:300; font-size:21px; color:#ECE6CC;">
	<a href="/notice/list">notice</a> |
	<a href="/faq/list">faq</a> |
	<a href="/extagram/list">extagram</a> |
	<a href="/perf/list">perf</a> |
	<a href="/layer/list">layer</a> |
	<a href="/user/login">login</a> |
	<a href="/user/logout">logout</a>
</div>
</header>