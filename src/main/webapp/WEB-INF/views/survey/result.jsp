<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/header.jsp" />
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script> 
<style type="text/css">
.flex-container {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	width: 90%;
	min-width: 1080px;
	font-size: 11px;
	justify-content: center;
}
.flex-items {
	min-width: 120px;
	width: 120px;
	height: 250px;
	border-radius: 10px; 
	margin:4px;
	float: left;
}
.items-wrap {
	display: flex;
	width:100%;
	height: 250px;
 	margin: 0 auto;
	font-size: 15px;
	justify-content: center;
}
.perf-wrap {
	display: flex;
	width:100%;
	height: 250px;
	margin: 0 auto;
	justify-content: center;
}
.note-img {
	width:100%;
	height:120px;
	border-radius: 10px;
}
.note-img img {
	width:100%;
	height:120px;
	border-radius: 10px;
	border: 5px solid #000;
}
.note-info {
	text-align: center;
}
h4 {
	text-align: center;
}
.perf-img img{
	width: 100%;
	height: 120px;
	border-radius: 10px;
	border: 5px solid #000;
}
.result-perf {
	margin: 0 auto;
}
.perf-info {
	text-align: center;
}
.icon-wrap {
	width: 250px;
	height: 45px;
	margin: 0 auto;
}
.sns{
	list-style: none;
	margin: 0 auto;
	
}
.sns>li>a {
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
</style>


<div class="container">


<h1 style="text-align: center;">Found Your Own Cent</h1>
<hr>


	<h4>${useName }님 이런 향을 써보시는 것은 어떠신가요?</h4>
	<div class="flex-container">
		<div class="items-wrap">
			<c:forEach items="${list }" var="list">
			    <div class="flex-items">
					<div class="result-wrap">
						<div class="note-img"><img alt="" src="/resources/img/note/${list.NOTE_NAME }.jpg"></div>
						<div class="note-info" style="font-size:20px; font-weight: bold;">${list.NOTE_NAME }</div> 
						<div class="note-info">${list.NOTE_ATTRIBUTES }</div>
						<div class="note-info">${list.NOTE_TYPE }</div>
					</div><!-- result-wrap end -->
				</div><!-- flex-items end -->
			</c:forEach><!-- list end -->
		</div><!-- items-wrap end -->	
		<div class="result-perf">
			<h4>${useName }님께 추천드린 향이 포함된 향수를 써보시는건 어떨까요?</h4>
			<div class="perf-wrap">
				<c:forEach items="${perfList }" var="perfList">
				 <div class="flex-items">
				 	<div class="perf-img"><img alt="" src="/upload/${perfList.STORED_NAME }" style="margin: 0 auto;"></div>
					<div class="perf-info" style="font-size: 13px; font-weight: bold;">${perfList.PERFUME_NAME }</div>
					<div class="perf-info">${perfList.BRAND_NAME }</div>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<div class="icon-wrap">
	<h4>${useName }님의 테스트 결과를 SNS에 공유해 보세요</h4>
		<ul class="sns">
			<li>
				<a id="create-kakao-link-btn" href="javascript:shareKakao();">
		 			 <img src="/resources/img/sns/kakao.png"/>
				</a>
			</li>
	    	<li class="twitter">
	    		<a id="btnTwitter" class="link-icon twitter" href="javascript:shareTwitter();">
	    			<img src="/resources/img/sns/twitter.png"> 
	    		</a>
			</li>
	    	<li class="band">
	    		<a id="btnFacebook" class="link-icon facebook" href="javascript:shareFacebook();">
	    			<img src="/resources/img/sns/facebook.png">
	    		</a>    
	    	</li>
		</ul>
	</div>	
</div><!-- container end -->

<script type="text/javascript">
	//현재 페이지의 URL불러오기
	var curr_url = document.URL;
	//URL객체 생성
	var new_curr_url = new URL(curr_url); 
	//url에서 type이라는 파라미터를 찾아서 param에 넣음
	var urlparam = new_curr_url.searchParams; 
	console.log("param : "+ urlparam);
	
function shareKakao(){
	// SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('f60b25bc30d4a8d8cafcab1bd28c7feb');
	// SDK 초기화 여부를 판단합니다.
	console.log(Kakao.isInitialized());
	
	Kakao.Link.createDefaultButton({
	  container: '#create-kakao-link-btn',
	  objectType: 'feed',
	  content: {
	    title: 'ExquisMe',
	    description: '당신에게 어울리는 향과 그에 맞는 향수는 무엇일까요?',
	    imageUrl:
	      '/resources/img/profile/기본프로필.jpg',
	    link: {
	      mobileWebUrl: 'https://developers.kakao.com',
	      webUrl: 'https://developers.kakao.com',
	    },
	  },
	
	  buttons: [
	    {
	      title: '결과 보기',
	      link: {
	        webUrl: 'http://localhost:8088/survey/result?'+ urlparam ,
	      },
	    },
	    {
	      title: ' 테스트\n하러가기',
	      link: {
	        webUrl: 'http://localhost:8088/survey/name',
	      },
	    },
	  ],
	});
};

//현재 페이지의 URL불러오기
var curr_url = document.URL;
//URL객체 생성
var new_curr_url = new URL(curr_url); 
//url에서 type이라는 파라미터를 찾아서 param에 넣음
var urlparam = new_curr_url.searchParams; 
console.log("param : "+ urlparam);
function shareFacebook() {
    var sendUrl = "devpad.tistory.com/"; // 전달할 URL
    window.open("http://www.facebook.com/sharer/sharer.php?u=http://localhost:8088/survey/result?" + urlparam);
}
//현재 페이지의 URL불러오기
var curr_url = document.URL;
//URL객체 생성
var new_curr_url = new URL(curr_url); 
//url에서 type이라는 파라미터를 찾아서 param에 넣음
var urlparam = new_curr_url.searchParams; 
console.log("param : "+ urlparam);
function shareTwitter() {
    var sendUrl = "devpad.tistory.com/"; // 전달할 URL
    window.open("https://twitter.com/intent/tweet?text=ExquisMe&url=http://localhost:8088/survey/result?"+urlparam);
}
</script>
<c:import url="/WEB-INF/views/layout/footer.jsp" />