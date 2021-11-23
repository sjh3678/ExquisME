<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	$("#btnVote").click(function() {
		console.log("투표클릭");
		if (confirm("투표 하시겠습니까?")) {
			$("form").submit();
		}else{
			return false;
		}
	})
	
	$("#cancel").click(function() {
		console.log("취소클릭");
		history.go(-1);
	})
})
</script>


<div id="container">



<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;}
.tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  overflow:hidden;padding:10px 5px;word-break:normal;}
.tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
.tg .tg-baqh{text-align:center;vertical-align:top}

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
.vote{
	display: flex;
	flex-direction: row;
}

</style>

<div style="text-align: center;">
<h1>노트 투표</h1>
<br>
<h1>${perf.PERFUME_NAME }</h1>
</div>

<br>

<table class="tg" style="undefined;table-layout: fixed; width: 1000px; margin:0 auto;">
<colgroup>
<col style="width: 250px">
<col style="width: 750px">
</colgroup>
<thead>
  <tr>
    <th class="tg-baqh">
    	<img class="perf_img" style="width:230px; height:230px; display: block; margin: auto;"
					src="/resources/img/perf/${perf.STORED_NAME }">
	</th>
    <th class="tg-baqh">
		<h2>Main Accord</h2><br>
	    	<div class="noteImg" style="width: 750px;">
			<c:forEach items="${mainAccord }" var="mainAccord">
				<div style="margin: 0 auto;">
				<img style="width:100px; height:100px; clip-path: circle(50% at 50% 50%);" alt="${mainAccord.NOTE_NAME  }" src="/resources/img/note/${mainAccord.NOTE_NAME  }.jpg">
				</div>
			</c:forEach>
			</div>
					
			<div class="noteName" style="width: 750px;">
			<c:forEach items="${mainAccord }" var="mainAccord">
				<div style="margin: 0 auto;">
				${mainAccord.NOTE_NAME  }
				</div>
			</c:forEach>
			</div>
	</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-baqh" colspan="2"><h4>Notes Vote</h4><br>
		
		<hr>
		
		<div class="vote" style="width: 710px; margin: 0 auto;">
		<div style="width: 200px;"> 노트 종류 </div>
		<div style="width: 250px;"> 노트 특성 </div>
		<div style="width: 200px;"> 투표 수 </div>
		<div style="width: 60px;"> 투표 여부 </div>
		</div>
		
		<hr>
		
		<form action="/perf/voteProc" method="get">
		
		<h5>Top Notes</h5>
		<div class="vote" style="width: 710px; margin: 0 auto;">
			<div style="width: 100px;">
			<c:forEach items="${topNote }" var="topNote">
				<div style="margin: 0 auto; height: 50px; line-height: 40px;">
				<label for="${topNote.NOTE_NAME }">
				<img style="clip-path: circle(50% at 50% 50%);" alt="${topNote.NOTE_NAME  }" src="/resources/img/note/${topNote.NOTE_NAME  }.jpg">
				</label>
				</div>
			</c:forEach>
			</div>
					
			<div style="width: 100px;">
			<c:forEach items="${topNote }" var="topNote">
				<div style="margin: 0 auto; height: 50px; line-height: 40px;">
				<label for="${topNote.NOTE_NAME }">
				${topNote.NOTE_NAME  }
				</label>
				</div>
			</c:forEach>
			</div>
			
			<div style="width: 250px;">
			<c:forEach items="${topNote }" var="topNote">
				<div style="margin: 0 auto; height: 50px; line-height: 40px;">
				<label for="${topNote.NOTE_NAME }">
				${topNote.NOTE_ATTRIBUTES }
				</label>
				</div>
			</c:forEach>
			</div>
			
			<div style="width: 200px;">
			<c:forEach items="${topNote }" var="topNote">
				<div style="margin: 0 auto; height: 50px; line-height: 40px;">
				<c:if test="${topNote.CNT eq null}">0</c:if>
				${topNote.CNT }
				</div>
			</c:forEach>
			</div>
			
			<div style="width: 60px;">
			<c:forEach items="${topNote }" var="topNote">
				<div style="margin: 0 auto; height: 50px; line-height: 40px;">
				<input type="checkbox" id ="${topNote.NOTE_NAME }" value= ${topNote.NOTE_NO } name="noteNo" <c:forEach items="${voteNote }" var="voteNote"> <c:if test="${voteNote.NOTE_NO eq topNote.NOTE_NO}"> checked </c:if> </c:forEach> />
				</div>
			</c:forEach>
			</div>
			
		</div>
		
		<hr>
		
		<h5>Middle Notes</h5>
		<div class="vote" style="width: 710px; margin: 0 auto;">
			<div style="width: 100px;">
			<c:forEach items="${middleNote }" var="middleNote">
				<div style="margin: 0 auto; height: 50px;line-height: 40px;">
				<label for="${middleNote.NOTE_NAME }">
				<img style="clip-path: circle(50% at 50% 50%);" alt="${middleNote.NOTE_NAME  }" src="/resources/img/note/${middleNote.NOTE_NAME  }.jpg">
				</label>
				</div>
			</c:forEach>
			</div>
					
			<div style="width: 100px;">
			<c:forEach items="${middleNote }" var="middleNote">
				<div style="margin: 0 auto; height: 50px;line-height: 40px;">
				<label for="${middleNote.NOTE_NAME }">
				${middleNote.NOTE_NAME  }
				</label>
				</div>
			</c:forEach>
			</div>
			
			<div style="width: 250px;">
			<c:forEach items="${middleNote }" var="middleNote">
				<div style="margin: 0 auto; height: 50px; line-height: 40px;">
				<label for="${middleNote.NOTE_NAME }">
				${middleNote.NOTE_ATTRIBUTES }
				</label>
				</div>
			</c:forEach>
			</div>
			
			<div style="width: 200px;">
			<c:forEach items="${middleNote }" var="middleNote">
				<div style="margin: 0 auto; height: 50px; line-height: 40px;">
				<c:if test="${middleNote.CNT eq null}">0</c:if>
				${middleNote.CNT }
				</div>
			</c:forEach>
			</div>
			
			<div style="width: 60px;">
			<c:forEach items="${middleNote }" var="middleNote">
				<div style="margin: 0 auto; height: 50px; line-height: 40px;">
				<input type="checkbox" id ="${middleNote.NOTE_NAME }" value= ${middleNote.NOTE_NO } name="noteNo" <c:forEach items="${voteNote }" var="voteNote"> <c:if test="${voteNote.NOTE_NO eq middleNote.NOTE_NO}"> checked </c:if> </c:forEach>/>
				</div>
			</c:forEach>
			</div>
			
		</div>
		
		<hr>
		
		<h5>Base Notes</h5>
		<div class="vote" style="width: 710px; margin: 0 auto;">
			<div style="width: 100px;">
			<c:forEach items="${baseNote }" var="baseNote">
				<div style="margin: 0 auto; height: 50px; line-height: 40px;">
				<label for="${baseNote.NOTE_NAME }">
				<img style="clip-path: circle(50% at 50% 50%);" alt="${baseNote.NOTE_NAME  }" src="/resources/img/note/${baseNote.NOTE_NAME  }.jpg">
				</label>
				</div>
			</c:forEach>
			</div>
					
			<div style="width: 100px;">
			<c:forEach items="${baseNote }" var="baseNote">
				<div style="margin: 0 auto; height: 50px; line-height: 40px;">
				<label for="${baseNote.NOTE_NAME }">
				${baseNote.NOTE_NAME  }
				</label>
				</div>
			</c:forEach>
			</div>
			
			<div style="width: 250px;">
			<c:forEach items="${baseNote }" var="baseNote">
				<div style="margin: 0 auto; height: 50px; line-height: 40px;">
				<label for="${baseNote.NOTE_NAME }">
				${baseNote.NOTE_ATTRIBUTES }
				</label>
				</div>
			</c:forEach>
			</div>
			
			<div style="width: 200px;">
			<c:forEach items="${baseNote }" var="baseNote">
				<div style="margin: 0 auto; height: 50px; line-height: 40px;">
				<c:if test="${baseNote.CNT eq null}">0</c:if>
				${baseNote.CNT }
				</div>
			</c:forEach>
			</div>
			
			<div style="width: 60px;">
			<c:forEach items="${baseNote }" var="baseNote">
				<div style="margin: 0 auto; height: 50px; line-height: 40px;">
				<input type="checkbox" id ="${baseNote.NOTE_NAME }" value= ${baseNote.NOTE_NO } name="noteNo" <c:forEach items="${voteNote }" var="voteNote"> <c:if test="${voteNote.NOTE_NO eq baseNote.NOTE_NO}"> checked </c:if> </c:forEach>/>
				</div>
			</c:forEach>
			</div>
			
		</div>
		<hr>
		<input type="hidden" name="perfumeNo" value="${perf.PERFUME_NO }" />
		<div><button id="btnVote" type="button"> 투표 완료 </button> <button id="cancel" type="button"> 투표 취소 </button></div>
		</form>
	</td>
  </tr>
</tbody>
</table>
<br>
<c:import url="/WEB-INF/views/layout/footer.jsp" />