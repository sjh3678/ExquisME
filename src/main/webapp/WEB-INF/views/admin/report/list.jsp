<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;}
.tg td{border-color:black;border-style:solid;border-width:1px; sans-serif;font-size:14px;
  overflow:hidden;padding:10px 5px;word-break:normal;}
.tg th{border-color:black;border-style:solid;border-width:1px; sans-serif;font-size:14px;
  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
.tg .tg-data{border-color:inherit;text-align:center;vertical-align:top}
.tg .tg-title{background-color:#eee;border-color:inherit;font-weight:bold;text-align:center;vertical-align:top}
.tg .tg-content{border-color:inherit;text-align:left;vertical-align:top}
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

<div class="container table">

<h1><Strong>Admin Report</Strong></h1><br>


<form action="/admin/report/list" method="post">
<c:forEach items="${reportList }" var="reportList">
<span class="pull-left">대기중 : ${reportList.WAITING} &nbsp;&nbsp;&nbsp;&nbsp; 처리완료 : ${reportList.SUCCESS}</span><br>
<table class="tg" style="width: 100%;">
<tbody>
  <tr>
    <td class="tg-title">No</td>
    <td class="tg-data">${reportList.REPORT_NO }<input type="hidden" name="reportNo" value="${reportList.REPORT_NO }"/></td>
    <td class="tg-title">신고인</td>
    <td class="tg-data">${reportList.REPORTERNICK }<input type="hidden" name="reportNo" value="${reportList.REPORTER }"/></td>
    <td class="tg-title">피 신고인</td>
    <td class="tg-data">${reportList.DEFENDANTNICK }<input type="hidden" name="reportNo" value="${reportList.DEFENDANT }"/></td>
  </tr>
  <tr>
    <td class="tg-title">신고일</td>
    <td class="tg-data"><fmt:formatDate value="${reportList.REPORT_DATE }" pattern="yyyy-MM-dd HH:mm"/></td>
    <td class="tg-title">제재 시작 일</td>
    <td class="tg-data"><fmt:formatDate value="${reportList.BAN_DATE }" pattern="yyyy-MM-dd HH:mm"/></td>
    <td class="tg-title">제재 종료 일</td>
    <td class="tg-data"><fmt:formatDate value="${reportList.EXPIRE_DATE }" pattern="yyyy-MM-dd HH:mm"/></td>
  </tr>
  <tr>
    <td class="tg-title">제제 사유</td>
    <td class="tg-data">
    	<select id="reason" name="reason">
			<option value="${reportList.REASON }">${reportList.REASON }</option>
			<option value="무혐의">무혐의</option>
			<option value="사면">사면</option>
			<option value="선동">선동</option>
			<option value="도배">도배</option>
			<option value="광고">광고</option>
			<option value="비방">비방</option>
			<option value="욕설">욕설</option>
			<option value="음란물">음란물</option>
		</select>
    </td>
    <td class="tg-title">제재 처분</td>
    <td class="tg-data">
    	<select id="banType" name="banType">
			<option value="${reportList.BAN_TYPE }">
				<c:if test="${reportList.BAN_TYPE == 0}">
					<span>무혐의/사면 처분</span>
				</c:if>
				<c:if test="${reportList.BAN_TYPE == 1}">
					<span>1일 정지 중</span>
				</c:if>
				<c:if test="${reportList.BAN_TYPE == 7}">
					<span>7일 정지 중</span>
				</c:if>
				<c:if test="${reportList.BAN_TYPE == 30}">
					<span>한 달 정지 중</span>
				</c:if>
				<c:if test="${reportList.BAN_TYPE == 365}">
					<span>1년 정지 중</span>
				</c:if>
				<c:if test="${reportList.BAN_TYPE == 99999}">
					<span>영구 정지 중</span>
				</c:if>
			</option>
			<option value="0">무혐의 / 사면</option>
			<option value="1">1일 정지</option>
			<option value="7">7일 정지</option>
			<option value="30">한 달 정지</option>
			<option value="365">1년 정지</option>
			<option value="99999">영구 정지</option>
		</select>
    </td>
    <td class="tg-title">처리 상태</td>
    <td class="tg-data">${reportList.IS_EXECUTE}</td>
  </tr>
  <tr>
    <td class="tg-title" colspan="6">신고 사유<br>(클릭 시 해당 게시글 이동)</td>
  </tr>
  <tr>
    <td class="tg-content" colspan="6"><div style="height: 500px; resize: none;"><a href="/extagram/view?exNo=${reportList.EX_POST_NO }"><c:out value="${reportList.REPORT_CONTENT}"/></a></div></td>
  </tr>
</tbody>
</table>
</c:forEach><br>
<div class="text-center"><button id="complete" class="btn" style="background-color: #eee;">완료</button></div>
</form>

<c:import url="/WEB-INF/views/layout/paging2.jsp" />

</div><!-- .container -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />







