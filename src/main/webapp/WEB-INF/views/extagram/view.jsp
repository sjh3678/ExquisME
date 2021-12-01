<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>


<style type="text/css">
#flex-container {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	width: 90%;
	min-width: 1080px;
}
.flex-items {
	min-width: 260px;
	width: 540px;
	height: 330px;
	margin: 0px;
}
.flex-userResent-container {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	width: 50%;
	margin: 0px auto;
}
.flex-userResent {
	margin: 0 auto;
}
.otherEx img {
	 transition: all 0.1s linear;
}
.otherEx:hover img {
	 transform: scale(1.3);
}
.commentBox {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	width: 98%;
	min-width: 510;
	margin: 10px;
	padding: 10px;
}
.topper {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	width: 98%;
	margin: 10px;
	padding: 10px;
}
#btnHeart:hover{
	transform: scale(1.1);
}
::-webkit-scrollbar {
  width: 7px;
}
::-webkit-scrollbar-thumb {
  background-color: #ddd;
  border-radius: 10px;
}
</style>

<script type="text/javascript">
<c:if test="${not login}">
	var message = "${msg}";
	var url = "${url}";
	alert(message);
	document.location.href = url;
</c:if>
</script>

<script type="text/javascript">
/* 버튼 */
$(document).ready(function() {
	$("#btnList").click(function() {
		location.href="/extagram/list";
	})
	
	$("#btnUpdate").click(function() {
		var answer = confirm("게시글을 수정하시겠습니까?")
		if(answer == true) {
			location.href="/extagram/update?exNo=${viewExta.EX_NO}";
		} else {
			return false;
		}
	})
	
	$("#btnDelete").click(function() {
		var answer = confirm("게시글을 삭제하시겠습니까?")
		
		if( answer == true ) {
			location.href= "/extagram/delete?exNo=${viewExta.EX_NO}";
		} else {
			return false;
		}
	})
});
</script>

<script type="text/javascript">
/* AJAX */
$(document).ready(function() {
	
	//main ajax(댓글내용 + 좋아요/댓글 숫자 + 좋아요상태)
	loadList();
	$("#btnCommInsert").click(function() {
		$.ajax({
			type: "post"
			, url: "/extagram/view_ok"
			, data: $("#inputForm").serialize()
			, dataType: "html"
			, success: function(res) {
				$("#viewComment").html(res);
				
				$("#exCommWrite").val("");/* 입력창 비우기 */
				loadHeartComm();/* 숫자 카운트 */
				
			}
			, error: function() {
				console.log("실패");
			}
		})
	})

	//ajax 적용 전 댓글 목록 불러오기
	function loadList() {
		$.ajax({
			type: "post"
			, url: "/extagram/view_ok"
			, data: $("#inputForm").serialize()
			, dataType: "html"
			, success: function(res) {
				console.log("댓글 성공")
				$("#viewComment").html(res);
				loadHeartComm();/* 숫자 카운트 */
			}
			, error: function() {
				console.log("댓글 실패");
			}
		});
	}

	//좋아요, 댓글 수
	function loadHeartComm() {
		$.ajax ({
			type: "get"
			, url: "/extagram/view_ok2"
			, data: {exPostNo: ${viewExta.EX_NO}}
			, dataType: "html"
			, success: function(res) {
				console.log("카운트 성공")
				$("#countCount").html(res);
			}
			, error: function() {
				console.log("카운트 실패");
			}
		});
	}
	
});

//ajax 좋아요
function heartClick() {
	$.ajax({
		type: "get"
		, url: "/extagram/heart"
		, data: { exNo: ${viewExta.EX_NO} }
		, dataType: "html"
		, success: function(res) {
			console.log("좋아요 성공")
			$("#exCommWrite").val("");
			loadList();
		}	
		, error: function() {
			console.log("좋아요 실패")
		}
	})
}

//리스트불러오기
function loadList() {
	$.ajax({
		type: "post"
		, url: "/extagram/view_ok"
		, data: $("#inputForm").serialize()
		, dataType: "html"
		, success: function(res) {
			console.log("댓글 성공")
			$("#viewComment").html(res);
			loadHeartComm();/* 숫자 카운트 */
		}
		, error: function() {
			console.log("댓글 실패");
		}
	});
}

//좋아요, 댓글 수
function loadHeartComm() {
	$.ajax ({
		type: "get"
		, url: "/extagram/view_ok2"
		, data: {exPostNo: ${viewExta.EX_NO}}
		, dataType: "html"
		, success: function(res) {
			console.log("카운트 성공")
			$("#countCount").html(res);
		}
		, error: function() {
			console.log("카운트 실패");
		}
	});
}
</script>

<div class="container">
<h1><Strong>View</Strong></h1><br>

<div class="topper">
<div><img style="width: 35px; height: 35px; border-radius: 70%;" 
		   src="/upload/${viewExta.PROFILE}"></div>
		&nbsp;&nbsp;&nbsp;&nbsp;<div style="font-size: 25px;"><c:out value="${viewExta.NICK }"/></div>
		&nbsp;&nbsp;&nbsp;&nbsp;<div style="margin: 12px;"><fmt:formatDate value="${viewExta.EX_DATE }" pattern="yyyy-MM-dd HH:mm"/></div>
</div>

<div id="viewContent" style="margin: 20px; height: 100px; width: 500px; overflow-y: scroll;">
<c:out value="${viewExta.EX_CONTENT }"/>
</div>

<div id="flex-container">
	<div class="flex-items" style="margin: auto 0;">
		<div id="viewPicture" style="text-align: center; height: 300px; padding: 0; margin: 15px 0px;">
			<img style="max-width:500px; min-height: 300px; max-height: 300px; margin: auto; overflow: hidden;" src="/upload/${viewExta.PICTURE}">
		</div>
	</div>
	<div class="flex-items">
		<div id="viewComment" style="height: 250px; overflow-y: scroll; ">
			<!-- AJAX 댓글 자리 -->
		</div>
		
		<div id="countCount">
			<!-- AJAX 하트, 댓글 count 자리 -->
		</div>
		
		<div style="border: 1px solid #ddd; height: 37px; border-radius: 5px; margin-top: 10px;">
			<c:if test="${not login }">
				<input type="text" placeholder="로그인 후 댓글 확인 및 작성이 가능합니다." readonly="readonly" style="width: 470px; height: 34px; border: none;"/>
				<button onclick='location.href="/user/login";' class="btn pull-right">LOGIN</button>
			</c:if>
			<c:if test="${login }">
				<div class="form-inline text-center">
					<form id="inputForm" onsubmit="return false">
						<input type="hidden" name="exNo" value="${viewExta.EX_NO }" />
						<input type="hidden" name="exPostNo" value="${viewExta.EX_NO }" />
						<input type="hidden" name="userNo" value="${viewExta.USER_NO }" />
						<input type="text" id="exCommWrite" name="exComm" placeholder="댓글" maxlength="70" onkeyup="characterCheck(this)" onkeydown="characterCheck(this)" style="width: 475px; height: 34px; border: none;"/>
						<button id="btnCommInsert" class="btn pull-right" style="height:35px;">POST</button>
					</form>
				</div>
			</c:if>
		</div>
	</div>
	
</div><br>

<div class="text-center">
		<a href="/extagram/report?exNo=${viewExta.EX_NO }"><button class="btn">신고</button></a>
		<button class="btn" id="btnList">목록</button>
	<c:if test="${sessionScope.nick eq viewExta.NICK }">
		<button class="btn" id="btnUpdate">수정</button>
		<button class="btn" id="btnDelete">삭제</button>
	</c:if>
</div><br><br><br><br>

<div class="text-center" style="font-size: 20px; margin: 10px;"><strong>More ${viewExta.NICK}<small>'s</small> Extagram</strong></div>
<div class="flex-userResent-container text-center">
<c:forEach items="${resent }" var="resent">
	<div class="flex-userResent">
		<div class="otherEx" onclick="location.href='/extagram/view?exNo=${resent.EX_NO}';" style="cursor: pointer;">
			<img style="vertical-align: middle; max-width:100px; max-height:70px; overflow: hidden;" 
				 src="/upload/${resent.STORED_NAME}">
		</div>
	</div>
</c:forEach>
</div><br><br><br><br>

</div><!-- .container -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />

