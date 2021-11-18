<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {

	
	$(document.body).on("click", "#perfLike", function() {
		console.log("좋아요");
		$.ajax({
			type: "get"
			, url: "/perf/like"
			, data: {
				perfumeNo: ${perf.PERFUME_NO }
				, likeType: "like"
			}
			, dataType: "html"
			, success: function(res) {
					console.log("성공");
					likeResult.innerHTML = res;
			}
			, error: function() {
				console.log("실패");
			}
		}); //ajax end
		
	}) //$(document.body).on("click", "#perfLike", function()  end
	
	$(document.body).on("click", "#perfLikeCancel", function() {
		console.log("좋아요 취소");
		$.ajax({
			type: "get"
			, url: "/perf/like"
			, data: {
				perfumeNo: ${perf.PERFUME_NO }
				, likeType: "likeCancel"
			}
			, dataType: "html"
			, success: function(res) {
					console.log("성공");
					likeResult.innerHTML = res;
			}
			, error: function() {
				console.log("실패");
			}
		}); //ajax end
	})
	$(document.body).on("click", "#perfDislike", function() {
		console.log("싫어요");
		$.ajax({
			type: "get"
			, url: "/perf/like"
			, data: {
				perfumeNo: ${perf.PERFUME_NO }
				, likeType: "dislike"
			}
			, dataType: "html"
			, success: function(res) {
					console.log("성공");
					likeResult.innerHTML = res;
			}
			, error: function() {
				console.log("실패");
			}
		}); //ajax end
	})
	
	$(document.body).on("click", "#perfDislikeCancel", function() {
		console.log("싫어요 취소");
		$.ajax({
			type: "get"
			, url: "/perf/like"
			, data: {
				perfumeNo: ${perf.PERFUME_NO }
				, likeType: "dislikeCancel"
			}
			, dataType: "html"
			, success: function(res) {
					console.log("성공");
					likeResult.innerHTML = res;
			}
			, error: function() {
				console.log("실패");
			}
		}); //ajax end
	})
})
</script>



<div class="container">
<h1>${perf.PERFUME_NAME }</h1>
<hr>

<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;}
.tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  overflow:hidden;padding:10px 5px;word-break:normal;}
.tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
.tg .tg-c3ow{border-color:inherit;text-align:center;vertical-align:top}

.noteImg{
	display: flex;
	flex-direction: row;
	margin: 0 auto;
	text-align: center;
}

.noteName{
	display: flex;
	flex-direction: row;
	margin: 0 auto;
	text-align: center;
}
</style>

<table class="tg" style="undefined;table-layout: fixed; width: 846px">
<colgroup>
<col style="width: 570px">
<col style="width: 250px">
<col style="width: 250px">
</colgroup>
<thead>
  <tr>
    <th class="tg-c3ow" rowspan="4"><img class="perf_img" style="width:500px; height:500px; display: block; margin: auto;"
					src="/resources/img/perf/${perf.STORED_NAME }"></th>
    <th class="tg-c3ow" colspan="2"><img class="perf_img" style="width: 250px; display: block; margin: auto;"
					src="/resources/img/brand/${perf.BRAND_NAME }.png"></th>
  </tr>
  <tr>
    <th class="tg-c3ow" colspan="2">
	<h4>Main Accord</h4><br>
	    <div class="noteImg" style="width: 300px;">
		<c:forEach items="${mainAccord }" var="mainAccord">
			<div style="margin: 0 auto;">
			<img style="clip-path: circle(50% at 50% 50%);" alt="${mainAccord.NOTE_NAME  }" src="/resources/img/note/${mainAccord.NOTE_NAME  }.jpg">
			</div>
		</c:forEach>
		</div>
				
		<div class="noteName" style="width: 300px;">
		<c:forEach items="${mainAccord }" var="mainAccord">
			<div style="margin: 0 auto;">
			${mainAccord.NOTE_NAME  }
			</div>
		</c:forEach>
		</div>
		<br>
	</th>
  </tr>
  <tr>
    <th class="tg-c3ow" colspan="2">
    <h4>Vitality</h4>
    ${perf.PERFUME_VITALITY }
    </th>
  </tr>
  <tr id="likeResult">
    <th class="tg-c3ow">
    <h4>Like</h4>
    	<div id="perfLikeCnt">
    	${perfLike.CNT }
   		</div>
   		<br>
   		<c:if test="${userLikeCnt eq 0 && not empty login }">	
    	<i id="perfLike" class="far fa-thumbs-up" style="font-size: 30px; color: blue;"></i>
    	</c:if>
    	<c:if test="${userLikeCnt eq 1 && not empty login }">
    	<i id="perfLikeCancel" class="fas fa-thumbs-up" style="font-size: 30px; color: blue;"></i>
    	</c:if>
    	<br>
    </th>
    <th class="tg-c3ow">
    <h4>Dislike</h4>
    
    	<div>
    	${perfDislike.CNT }
    	</div>
    	<br>
    	<c:if test="${userDislikeCnt eq 0 && not empty login }">
    	<i id="perfDislike" class="far fa-thumbs-down" style="font-size: 30px; color: red;"></i>
    	</c:if>
    	<c:if test="${userDislikeCnt eq 1 && not empty login }">
    	<i id="perfDislikeCancel" class="fas fa-thumbs-down" style="font-size: 30px; color: red;"></i>
    	</c:if>
    	<br>
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-c3ow" colspan="3">
    	<h3>Top Notes</h3><br>
    	
		<div class="noteImg" style="width: 500px;">
		<c:forEach items="${topNote }" var="topNote">
			<div style="margin: 0 auto;">
			<img style="clip-path: circle(50% at 50% 50%);" alt="${topNote.NOTE_NAME  }" src="/resources/img/note/${topNote.NOTE_NAME  }.jpg">
			</div>
		</c:forEach>
		</div>
				
		<div class="noteName" style="width: 500px;">
		<c:forEach items="${topNote }" var="topNote">
			<div style="margin: 0 auto;">
			${topNote.NOTE_NAME  }
			</div>
		</c:forEach>
		</div>
		<br>
	</td>
  </tr>
  <tr>
    <td class="tg-c3ow" colspan="3">
    	<h3>Middle Notes</h3><br>
	    <div class="noteImg" style="width: 500px;">
		<c:forEach items="${middleNote }" var="middleNote">
			<div style="margin: 0 auto;">
			<img style="clip-path: circle(50% at 50% 50%);" alt="${middleNote.NOTE_NAME  }" src="/resources/img/note/${middleNote.NOTE_NAME  }.jpg">
			</div>
		</c:forEach>
		</div>
				
		<div class="noteName" style="width: 500px;">
		<c:forEach items="${middleNote }" var="middleNote">
			<div style="margin: 0 auto;">
			${middleNote.NOTE_NAME  }
			</div>
		</c:forEach>
		</div>
		<br>
    </td>
  </tr>
  <tr>
    <td class="tg-c3ow" colspan="3">
    	<h3>Base Notes</h3><br>
		<div class="noteImg" style="width: 500px;">
		<c:forEach items="${baseNote }" var="baseNote">
			<div style="margin: 0 auto;">
			<img style="clip-path: circle(50% at 50% 50%);" alt="${baseNote.NOTE_NAME  }" src="/resources/img/note/${baseNote.NOTE_NAME  }.jpg">
			</div>
		</c:forEach>
		</div>
				
		<div class="noteName" style="width: 500px;">
		<c:forEach items="${baseNote }" var="baseNote">
			<div style="margin: 0 auto;">
			${baseNote.NOTE_NAME  }
			</div>
		</c:forEach>
		</div>
		<br>
    </td>
  </tr>
</tbody>
</table>
<br>


</div><!-- .container -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />