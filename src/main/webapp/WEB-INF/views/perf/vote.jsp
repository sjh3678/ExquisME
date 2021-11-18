<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:import url="/WEB-INF/views/layout/header.jsp" />
<div id="container">

<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;}
.tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  overflow:hidden;padding:10px 5px;word-break:normal;}
.tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
.tg .tg-baqh{text-align:center;vertical-align:top}
</style>
<table class="tg" style="undefined;table-layout: fixed; width: 1000px">
<colgroup>
<col style="width: 250px">
<col style="width: 750px">
</colgroup>
<thead>
  <tr>
    <td class="tg-baqh" rowspan="2"><img class="perf_img" style="width:230px; height:230px; display: block; margin: auto;"
					src="/resources/img/perf/${perf.STORED_NAME }"></td>
    <td class="tg-baqh" style="height: 100px;">
    	<h4>Main Accord</h4><br>
    	<div class="noteImg" style="width: 750px;">
		<c:forEach items="${mainAccord }" var="mainAccord">
			<div style="margin: 0 auto;">
			<img style="clip-path: circle(50% at 50% 50%);" alt="${mainAccord.NOTE_NAME  }" src="/resources/img/note/${mainAccord.NOTE_NAME  }.jpg">
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
		<br>
		
	</td>
  </tr>
  <tr>
    <td class="tg-baqh">
		<h4>Notes Vote</h4><br>
		
	</td>
  </tr>
</thead>
</table>

</div>
<br>
<c:import url="/WEB-INF/views/layout/footer.jsp" />