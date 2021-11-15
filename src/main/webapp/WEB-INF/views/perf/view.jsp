<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">


</style>


<script type="text/javascript">
$(document).ready(function() {
	$("#btnComInsert").click(function() {
		$.ajax({
			type: "post"
			, url: "/extagram/view_ok"
			, data: { $("#inputForm").serialize() }
			, dataType: "json"
			, success: function(res) {
				console.log("댓글 성공")
			}
			, error: function() {
				console.log("댓글 실패")
			}
		})		
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
    <th class="tg-c3ow" colspan="2"><img class="perf_img" style=" display: block; margin: auto;"
					src="/resources/img/brand/${perf.BRAND_NAME }.png"></th>
  </tr>
  <tr>
    <th class="tg-c3ow" colspan="2">메인어코드</th>
  </tr>
  <tr>
    <th class="tg-c3ow" colspan="2">${perf.PERFUME_VITALITY }</th>
  </tr>
  <tr>
    <th class="tg-c3ow">좋아요</th>
    <th class="tg-c3ow">싫어요</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-c3ow" colspan="3">
    	<h3>Top Notes</h3>
		<c:forEach items="${topNote }" var="topNote">
		<img style="clip-path: circle(50% at 50% 50%);" alt="${topNote.NOTE_NAME  }" src="/resources/img/note/${topNote.NOTE_NAME  }.jpg">
		</c:forEach>
		<br>
		<c:forEach items="${topNote }" var="topNote">
		${topNote.NOTE_NAME  }
		</c:forEach>
	</td>
  </tr>
  <tr>
    <td class="tg-c3ow" colspan="3">
    	<h3>Middle Notes</h3>
	    <c:forEach items="${middleNote }" var="middleNote">
	    	<img style="clip-path: circle(50% at 50% 50%);" alt="${middleNote.NOTE_NAME  }" src="/resources/img/note/${middleNote.NOTE_NAME  }.jpg"><br>
		</c:forEach>
		<br>
	    <c:forEach items="${middleNote }" var="middleNote">	    	
			${middleNote.NOTE_NAME  }
		</c:forEach>
    </td>
  </tr>
  <tr>
    <td class="tg-c3ow" colspan="3">
    	<h3>Base Notes</h3>
		<c:forEach items="${baseNote }" var="baseNote">
			<img style="clip-path: circle(50% at 50% 50%);" alt="${baseNote.NOTE_NAME  }" src="/resources/img/note/${baseNote.NOTE_NAME  }.jpg"><br>
		</c:forEach>
		<br>
		<c:forEach items="${baseNote }" var="baseNote">
			${baseNote.NOTE_NAME  }
		</c:forEach>
    </td></td>
  </tr>
</tbody>
</table>


</div><!-- .container -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />