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
	height: 375px;
	border-radius: 3px; 
	margin: 0px;
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

a:link { color: black; text-decoration: none;}
a:visited { color: black; text-decoration: none;}
a:hover { color: black; text-decoration: underline;}
</style>


<script type="text/javascript">
$(document).ready(function() {
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
		})
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
		})
	}
	
	
	//ajax 좋아요
	if( ${isHearted} ) {
		$("#btnHeart")
			.addClass("btn-warning")
			.html('좋아요 취소하기');
	} else {
		$("#btnHeart")
			.addClass("btn")
			.html('좋아요');
	}	
	
	

	
	
	
})

function heartClick() {
			$.ajax({
				type: "get"
				, url: "/extagram/heart"
				, data: { exPostNo: ${viewExta.EX_NO} }
				, dataType: "json"
				, success: function(res) {
					console.log("좋아요 성공")
					
					if(res.result) { //좋아요 성공
						$("#btnHeart")
						.removeClass("btn")
						.addClass("btn-warning")
						.html('좋아요 취소하기');
					} else { //좋아요 취소 성공
						$("#btnHeart")
						.revomeClass("btn-warning")
						.addClass("btn")
						.html('좋아요');
					}
					//좋아요 수 적용
					$("#heartCnt").html(res.cnt);
				}	
				, error: function() {
					console.log("좋아요 실패")
				}
				
			
			})
		}




</script>


<div class="container">
<h1>Extagram view ${cntHeart}</h1>

<hr>


<div class="topper">
<div><img style="width: 30px; height: 30px; border-radius: 70%;" 
		   src="/resources/img/perf/${viewExta.PROFILE}"></div>
		&nbsp;&nbsp;&nbsp;&nbsp;<div style="font-size: 25px;">${viewExta.NICK }</div>
		&nbsp;&nbsp;&nbsp;&nbsp;<div style="margin: 12px;"><fmt:formatDate value="${viewExta.EX_DATE }" pattern="yyyy-MM-dd HH:mm"/></div>
</div>

<div id="viewContent" style="margin: 20px; height: 100px; width: 500px;">
${viewExta.EX_CONTENT }
</div>

<div id="flex-container">
	<div class="flex-items">
		<div id="viewPicture">
			<img style="width:auto; height:350px; display: block; margin: auto;" src="/resources/img/perf/${viewExta.PICTURE}">
		</div>
	</div>
	<div class="flex-items">
		<div id="viewComment" style="height: 321px; overflow-y: scroll; ">
			<!-- AJAX 댓글 자리 -->
		</div>
		
		<div id="countCount">
			<!-- AJAX 하트, 댓글 count 자리 -->
		</div>
		
		<div style="border: 1px solid #ddd; height: 37px;">
			<c:if test="${not login }">
				<input type="text" placeholder="로그인이 필요합니다." readonly="readonly" style="width: 470px; height: 34px; border: none;"/>
				<button onclick='location.href="/user/login";' class="btn pull-right">LOGIN</button>
			</c:if>
			<c:if test="${login }">
				<div class="form-inline text-center">
					<form id="inputForm" onsubmit="return false">
						<input type="hidden" name="exNo" value="${viewExta.EX_NO }" />
						<input type="hidden" name="exPostNo" value="${viewExta.EX_NO }" />
						<input type="text" id="exCommWrite" name="exComm" placeholder="댓글" style="width: 475px; height: 34px; border: none;"/>
						<button type="button" id="btnCommInsert" class="btn pull-right">POST</button>
					</form>
				</div>
			</c:if>
		</div>
	</div>
	
</div><br>

<div class="text-center">
	<a href="/extagram/report?exNo=${viewExta.EX_NO }"><button class="btn">신고</button></a>
	<a href="/extagram/list"><button class="btn">목록</button></a>
<%-- 	<c:if test="${sessionScope.nick eq viewExta.NICK }"> --%>
		<a href="/extagram/update?exNo=${viewExta.EX_NO }"><button class="btn">수정</button></a>
		<a href="/extagram/delete?exNo=${viewExta.EX_NO }"><button class="btn">삭제</button></a>
<%-- 	</c:if> --%>
</div>


</div><!-- .container -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />

