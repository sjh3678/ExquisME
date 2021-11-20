<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">
.flex-container {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	width: 90%;
	min-width: 1080px;
}
#flex-items {
	min-width: 260px;
	width: 260px;
	height: 385px;
	border-radius: 3px; 
	margin: 4px;
	border: 1px solid #ddd;
}
#a {
	margin: 10px;
	
}
#b {
	margin: 10px;
	height: 80px;
	display: block;
	overflow : hidden;
	text-overflow: ellipsis;
}
#c {
	height: 180px;
	width: 258px;
	overflow : hidden;
	display: block;
}
#d {
	margin: 5px 10px;
}
#e {
	margin: 5px 10px;
}

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

::-webkit-scrollbar {
  width: 10px;
}
::-webkit-scrollbar-thumb {
  background-color: #aaa;
  border-radius: 10px;
}
</style>

<script type="text/javascript">
/* 무한 스크롤 */
$(document).ready(function(){
	loadList(); //init list
	
	//Javascript
	var count = 0;
	//스크롤 바닥 감지
	window.onscroll = function(e) {
	    //추가되는 임시 콘텐츠
	    //window height + window scrollY 값이 document height보다 클 경우,
	    if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
	    	//실행할 로직 (콘텐츠 추가)
		    	loadList();
	        //$('#result').append(addContent);
	    }
	};
	
	});
	
	var target = null;
	var curPage = 1;
	function loadList() {
		$.ajax({
			type: "get"
			, url: "/extagram/list_ok"
			, data: { 
			curPage: curPage++
			, target: target
			}
			, dataType: "html"
			, success: function(res){
				console.log("AJAX 성공")
				result.innerHTML += res;
			}
			, error: function(){
				console.log("AJAX 실패")
			}
		})
		$("#cur").html(curPage)
};

</script>


<script type="text/javascript">
/* 맨 위로 */
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

<h1>Extagram</h1>
<hr>

<div class="container">

<a href="/extagram/write"><button class="btn">WRITE</button></a><br><br>

<div id="result"><!-- AJAX 결과값 -->

</div>
</div><!-- .container -->

<button id="go-top">
	<svg xmlns="http://www.w3.org/2000/svg" width="38" height="38" fill="currentColor"
  		class="bi bi-arrow-up-circle-fill" viewBox="0 0 16 16">
  		<path fill-rule="evenodd" d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-7.5 3.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11.5z" />
	</svg>
</button>

<c:import url="/WEB-INF/views/layout/footer.jsp" />