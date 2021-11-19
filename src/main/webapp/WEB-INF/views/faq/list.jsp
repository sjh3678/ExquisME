<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">
.modal {
  position: absolute;
  top: 0;
  left: 0;

  width: 100%;
  height: 100%;

  display: none;

  background-color: rgba(0, 0, 0, 0.4);
}

.modal.show {
  display: block;
}

.modal_body {
  position: absolute;
  top: 50%;
  left: 50%;

  width: 400px;
  height: 200px;

  padding: 40px;

  text-align: center;

  background-color: rgb(255, 255, 255);
  border-radius: 10px;
  box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

  transform: translateX(-50%) translateY(-50%);
}

.row{
	width: 1100px;
}
.title{
	background: #8A7E6B;
	color: #ECE6CC;
	font-size: 21px;
	font-weight: 700;
 	margin-bottom: 5px;
}
.titleText{
	margin: 20px;
}
.contentChild{
	background: #ECE6CC;
	margin-bottom: 5px;
/* 	overflow-y: scroll; */
}
.title a:link{
	color: #ECE6CC;
}
.title a:hover{
	color: #35312B;
}
</style>

<script>
$(document).ready(function(){
	
    $(".titleChild").click(function(){
		$(this).parent().next("div").children().slideToggle();
    });
	
})
</script>

<div class="container">

<h1>faq list</h1>
<hr>

<c:if test="${login }">
궁금한 것이 해결되지 않았다면 <button class="btn btn-open-popup">채팅 문의</button>를 통해 문의해 보세요!<br><br>
</c:if>
<%-- 모달 채팅방 입장 영역 --%>
<div class="modal">
	<div class="modal_body">
		<div class="panel-title">${nick }님,<br>채팅에 사용하실 닉네임은 무엇인가요?</div>
		<form id="login-form" method="post" action="/faq/chat">
		    <div>
		        <input type="text" name="chatNick" class="form-control" placeholder="별명을 입력해 주세요." autofocus>
		    </div>
		    <div>
		        <button type="submit" class="form-control btn" style="background-color:pink;">채팅방으로 이동</button>
		    </div>
		</form>
	</div>
</div><%-- .modal --%>

<c:forEach items="${faqList }" var="i">
<div class="row">
	<div class="title">
		<div class="titleChild" style="cursor: pointer;">
			<span class="titleText">${i.faqTitle}</span>
		</div>
	</div>
	<div class="content">
		<div class="contentChild" style="display: none;">
			<div class="contentText">
			${i.faqContent}<br><br>
			</div>
		</div>
	</div>
</div>
</c:forEach>


<script>
const body = document.querySelector('body');
const modal = document.querySelector('.modal');
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

</div><%-- .container --%>
<c:import url="/WEB-INF/views/layout/footer.jsp" />