<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;}
.tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  overflow:hidden;padding:10px 5px;word-break:normal;}
.tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
.tg .tg-c3ow{border-color:inherit;text-align:center;vertical-align:top}
.tg .tg-fjr1{background-color:#eee;border-color:inherit;font-weight:bold;text-align:center;vertical-align:top}
.tg .tg-0pky{border-color:inherit;text-align:left;vertical-align:top}
</style>

<script type="text/javascript">
$(document).ready(function() {
	$("#complete").click(function() {
		var answer = confirm("제재 완료 하시겠습니까?");
		if(answer == true) {
			var reason = document.getElementById("reason").value;
			var banType = document.getElementById("banType").value;
			
			if( !reason ) {
				alert("제제 사유를 선택해주세요.");
				return false;
			} else if ( !banType ) {
				alert("제제 처분을 선택해주세요.")
				return false;
			} else {
				submitContents( $("#complete") )
				$("form").submit();
			}	
	    } else {
    		return false;
	    }
	});
});
</script>

<div class="container">

<h1><Strong>Admin Report</Strong></h1><br>


<form action="/admin/report/list" method="post">
<c:forEach items="${reportList }" var="reportList">
<span class="pull-left">대기중 : ${reportList.WAITING} &nbsp;&nbsp;&nbsp;&nbsp; 처리완료 : ${reportList.SUCCESS}</span><br>
<table class="tg" style="width: 100%;">
<tbody>
  <tr>
    <td class="tg-fjr1">No</td>
    <td class="tg-c3ow">${reportList.REPORT_NO }<input type="hidden" name="reportNo" value="${reportList.REPORT_NO }"/></td>
    <td class="tg-fjr1">신고인</td>
    <td class="tg-c3ow">${reportList.REPORTERNICK }<input type="hidden" name="reportNo" value="${reportList.REPORTER }"/></td>
    <td class="tg-fjr1">피 신고인</td>
    <td class="tg-c3ow">${reportList.DEFENDANTNICK }<input type="hidden" name="reportNo" value="${reportList.DEFENDANT }"/></td>
  </tr>
  <tr>
    <td class="tg-fjr1">신고일</td>
    <td class="tg-c3ow"><fmt:formatDate value="${reportList.REPORT_DATE }" pattern="yy-MM-dd HH:mm"/></td>
    <td class="tg-fjr1">제재 시작일</td>
    <td class="tg-c3ow"><fmt:formatDate value="${reportList.BAN_DATE }" pattern="yy-MM-dd HH:mm"/></td>
    <td class="tg-fjr1">제재 종료일</td>
    <td class="tg-c3ow"><fmt:formatDate value="${reportList.EXPIRE_DATE }" pattern="yy-MM-dd HH:mm"/></td>
  </tr>
  <tr>
    <td class="tg-fjr1">제제 사유</td>
    <td class="tg-c3ow">
    	<select id="reason" name="reason">
			<option value="${reportList.REASON }">${reportList.REASON }</option>
			<option value="무혐의">무혐의</option>
			<option value="기만">기만</option>
			<option value="도배">도배</option>
			<option value="광고">광고</option>
			<option value="비방">비방</option>
			<option value="욕설">욕설</option>
		</select>
    </td>
    <td class="tg-fjr1">제재 처분</td>
    <td class="tg-c3ow">
    	<select id="banType" name="banType">
			<option value="${reportList.BAN_TYPE }">${reportList.BAN_TYPE }</option>
			<option value="0">무혐의</option>
			<option value="0">사면</option>
			<option value="1">1일 정지</option>
			<option value="3">3일 정지</option>
			<option value="5">5일 정지</option>
			<option value="7">7일 정지</option>
			<option value="30">30일 정지</option>
			<option value="365">365일 정지</option>
		</select>
    </td>
    <td class="tg-fjr1">처리 상태</td>
    <td class="tg-c3ow">${reportList.IS_EXECUTE}</td>
  </tr>
  <tr>
    <td class="tg-fjr1" colspan="6">신고 사유</td>
  </tr>
  <tr>
    <td class="tg-0pky" colspan="6"><div style="height: 500px;"><a href="/extagram/view?exNo=${reportList.EX_POST_NO }">${reportList.REPORT_CONTENT}</a></div></td>
  </tr>
</tbody>
</table>
</c:forEach><br>
<div class="text-center"><button id="complete" class="btn" style="background-color: #eee;" onclick="/admin/report/list">완료</button></div>
</form>

<c:import url="/WEB-INF/views/layout/paging.jsp" />

</div><!-- .container -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />







