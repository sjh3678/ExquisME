<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/header.jsp" />

<!-- 스마트 에디터 2 라이브러리 로드 -->
<!-- <script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script> -->

<script type="text/javascript">
function submitContents(elClickedObj) {
	oEditors.getById["reportContent"].exec("UPDATE_CONTENTS_FIELD", []);
	
	try {
		elClickedObj.form.submit();
	} catch(e) {}
}
</script>

<script type="text/javascript">
$(document).ready(function() {
	//작성버튼
	$("#btnWrite").click(function() {
		var answer = confirm("신고 내역을 제출하시겠습니까?");
		if(answer == true) {
			var defendant = document.getElementById("defendant").value;
			var reportContent = document.getElementById("reportContent").value;
			
			if( !defendant ) {
				alert("신고 대상을 선택해 주시기 바랍니다.");
				return false;
			} else if( !reportContent ) {
				alert("신고 사유를 작성해야합니다.");
				return false;
			} else {
				submitContents( $("#btnWrite") )
				$("form").submit();
			}	
	    } else {
    		return false;
	    }
	});
	
	//취소버튼
	
	$("#btnCancel").click(function() {
		var answer = confirm("신고를 취소하시겠습니까?")
		if(answer == true) {
				history.go(-1);
		} else {
			return false;
		}
	
	});
});
</script>

<script type="text/javascript">
<c:if test="${not login}">
	var message = "${msg}";
	var url = "${url}";
	alert(message);
	document.location.href = url;
</c:if>
</script>

<div class="container">

<h1><Strong>Report</Strong></h1>
<hr>

<form action="/extagram/report" method="post">
<div class="form-group">
	<span><strong>신고자</strong><br>${nick }</span><br>
	<input type="hidden" id="reporter" name="reporter" value="${userNo }" />
	<input type="hidden" id="exPostNo" name="exPostNo" value="${viewExta.EX_NO}" />
</div>
<div class="form-group">
	<span><strong>신고 대상</strong></span><br>
	<input type="text" id="defendant" name="defendantNick" list="comment" style="height: 35px; width: 100%;" />
	<datalist id="comment">
		<option value="${viewExta.NICK }" label="<fmt:formatDate value="${viewExta.EX_DATE }" pattern="yyyy-MM-dd HH:mm"/>     [게시글]   ${viewExta.EX_CONTENT }"></option>
		<c:forEach items="${viewComm }" var="viewComm">
			<option value="${viewComm.NICK }" label="<fmt:formatDate value="${viewComm.EX_COMM_DATE }" pattern="yyyy-MM-dd HH:mm"/>     [댓글]   ${viewComm.EX_COMM }"></option>
		</c:forEach>
	</datalist>
</div>
<div class="form-group">
	<label for="content">신고 사유</label>
	<textarea rows="10" style="width: 100%; resize: none;" id="reportContent" name="reportContent"></textarea>
</div>


<div class="text-center">
	<button class="btn" id="btnWrite">제출</button>
	<input type="reset" id="btnCancel" class="btn" value="취소"/>
</div>
</form>

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "reportContent",
	sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
});
</script>

</div><!-- .container -->




<c:import url="/WEB-INF/views/layout/footer.jsp" />