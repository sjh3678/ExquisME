<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>exquis me</title>

<%-- JQUERY --%>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery-ui.min.js"></script>

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


/* 모달 */
.modal_header {
  position: absolute;
  top: 0;
  left: 0;

  width: 100%;
  height: 100%;

  display: none;

  background-color: rgba(0, 0, 0, 0.4);
}

.modal_header.show {
  display: block;
  z-index: 9998;
}

.modal_body_header {
  position: absolute;
  top: 50%;
  left: 50%;

  width: 400px;
  height: 200px;

  padding: 40px;

  text-align: center;

  background-color: #ECE6CC;
  border-radius: 10px;
  box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

  transform: translateX(-50%) translateY(-50%);
  z-index: 9999;
}

.wrap {
 	font-family: 'Noto Sans KR';
 	font-weight: 300;
	margin: 0 auto;
	width: 1100px;
}

.header, .footer{
	font-size: 27px;
 	font-weight: 300;
	color: #35312B;
	text-align: center;
/* 	background: #8A7E6B; */
}

.container{
	min-height: 800px;
	width: 1100px;
}

.header{
/* 	position: fixed; */
	height: 150px;
	top: 0;
 	width: 100%;
	left: 0;
	right: 0;
}


.btnLog {
	display: compact;
}

.logo {
	height: 40px;
	margin: 10px;
}

.hrMenu {
	margin: 0 auto;
	border-top: 1px solid #35312B;
}
.menu{
	font-weight:300;
	font-size:21px;
	margin: 10px;
}
.menuLog{
	display: flow-root;
	height: 0;
}
.btn{
	background: #ECE6CC;
	color: #35312B;
}
.btn:hover{
	background: #8A7E6B;
	color: #ECE6CC;
}
.btnHeader {
	background-color: white;
	color: #35312B;
	margin: 10px;
}

.btnHeader:hover {
	background-color: #ECE6CC;
 	color: #35312B; 
}

.btnModal{
	background-color: #8A7E6B;
	color: #ECE6CC;
	margin: 10px;
}
.btnModal:hover {
	background-color: #35312B;
}
@keyframes blink-effect{
	50%{
		opacity: 0;
	}
}
.blink{
	animation-name: blink-effect;
	animation-duration: 1s; 
	animation-iteration-count:infinite; 
	animation-timing-function:step-end;
}
/* 스크롤 위로 올라가기 버튼 CSS */
#go-top {
  display: none;
  position: fixed;
  right: 50px;
  bottom: 50px;
  outline: 0;
  border: 0;
  background: transparent;
  cursor: pointer;
  z-index: 9999;
  color: #3f4547; /* 색상변경*/
}

/* 스크롤바 예쁘게 꾸미기 */
::-webkit-scrollbar {
  width: 10px;
}
::-webkit-scrollbar-thumb {
  background-color: #aaa;
  border-radius: 10px;
}
</style>

<script type="text/javascript">
/* 스크롤 위로 올라가기 */
jQuery(document).ready(function () {
  $(window).scroll(function () {
    if ($(this).scrollTop() > 100) {
      $('#go-top').fadeIn(500);
    } else {
      $('#go-top').fadeOut('slow');
    }
  });
  $('#go-top').click(function (e) {
    e.preventDefault();
    $('html, body').animate({scrollTop: 0}, 200);
  });
});
</script>

</head>
<body>

<div class="wrap">

<header class="header">
<div class="menuLog">
	<c:if test="${login eq null }">
		<span class="pull-right"><a href="/user/login"><button class="btn btnHeader btnLog">LOGIN</button></a></span>
		<span class="pull-right"><a href="/user/join"><button class="btn btnHeader btnLog">JOIN</button></a></span>
	</c:if>	
	<c:if test="${login }">
		<span class="pull-right"><a href="/user/logout"><button class="btn btnHeader btnLog">LOGOUT</button></a></span>
		<span class="pull-right"><button class="btn btn-open-popup btnHeader">CHAT</button></span>
		<span class="pull-right"><a href="/user/mypage"><button class="btn btnHeader btnLog">MYPAGE</button></a></span>
	</c:if>
	<c:if test="${admin eq 'S' || admin eq 'M' }"><%-- 관리자 로그인 상태일 때 --%>
		<span class="pull-left blink" style="background: red; color: white; font-size: 12px; font-weight: 400; vertical-align: middle; border-radius: 2px; margin: 10px;">&nbsp;&nbsp;관리자 로그인&nbsp;&nbsp;</span> 	
	</c:if>
</div>
<div class="logo"><span style="vertical-align: middle; cursor: pointer;" onclick="location.href='/';">EXQUIS ME</span></div>
<div class="menu">
	<a href="/notice/list"><button class="btn btnHeader">NOTICE</button></a>
	<a href="/faq/list"><button class="btn btnHeader">FAQ</button></a>
	<a href="/extagram/list"><button class="btn btnHeader">EXTAGRAM</button></a>
	<a href="/perf/list"><button class="btn btnHeader">PERFUME</button></a>
	<a href="/layer/list"><button class="btn btnHeader">LAYER</button></a>
	<hr class="hrMenu">
</div>
<%-- 모달 채팅방 입장 영역 --%>
<div class="modal_header">
	<div class="modal_body_header">
		<div class="panel-title">${nick }님,<br>채팅에 사용하실 닉네임은 무엇인가요?<br></div>
		<form id="login-form" method="post" action="/chat">
		    <div>
		        <input type="text" name="chatNick" class="form-control" placeholder="별명을 입력해 주세요." autofocus>
		    </div>
		    <div>
		        <button type="submit" class="form-control btn btnModal">채팅 페이지로 이동</button>
		    </div>
		</form>
	</div>
</div><%-- .modal --%>
<script>
const body = document.querySelector('body');
const modal = document.querySelector('.modal_header');
const btnOpenPopup = document.querySelector('.btn-open-popup');

btnOpenPopup.addEventListener('click', () => {
	modal.classList.toggle('show');

    if (modal.classList.contains('show')) {
    	body.style.overflow = 'hidden';
    }
});

modal.addEventListener('click', (event) => {
    if (event.target === modal) {
    	modal.classList.toggle('show');

    	if (!modal.classList.contains('show')) {
			body.style.overflow = 'auto';
		}
    }
});
</script>

<!-- 스크롤 위로 올라가기 button -->
<button id="go-top">
	<svg xmlns="http://www.w3.org/2000/svg" width="38" height="38" fill="currentColor"
  		class="bi bi-arrow-up-circle-fill" viewBox="0 0 16 16">
  		<path fill-rule="evenodd" d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-7.5 3.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11.5z" />
	</svg>
</button>

</header>