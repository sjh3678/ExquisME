<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/header.jsp" />

<!-- 스마트 에디터 2 라이브러리 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>

<script type="text/javascript">
function submitContents(elClickedObj) {
	oEditors.getById["why"].exec("UPDATE_CONTENTS_FIELD", []);
	
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
			var whoCheck = document.getElementById("whoCheck").value;
			var contentCheck = document.getElementById("contentCheck").value;
			var whyCheck = document.getElementById("why").value;
			
			if( whoCheck == '선택' ) {
				alert("신고 대상을 선택해 주시기 바랍니다.");
				return false;
			} else if( !contentCheck ) {
				alert("해당 내용을 선택해 주기시 바랍니다.");
				return false;
			} else if( !whyCheck ) {
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
	<input type="hidden" id="nick" name="nick" value="${nick }" />
	<input type="hidden" id="userNo" name="userNo" value="${userNo }" />
</div>
<div class="form-group">
	<span><strong>신고 대상</strong></span><br>
	<select class="select" id="whoCheck" style="height: 35px; width: 100%;" >
		<option>선택</option>
		<option value="${viewExta.NICK }">${viewExta.NICK }</option>
		<c:forEach items="${viewComm }" var="viewComm">
			<option value="${viewComm.NICK }">${viewComm.NICK }</option>
		</c:forEach>
	</select>
</div>
<div class="form-group">
	<span><strong>해당 내용</strong></span><br>
	<input type="text" id="contentCheck" list="comment" style="height: 35px; width: 100%;" />
	<datalist id="comment">
		<option value="게시글">게시글</option>
		<c:forEach items="${viewComm }" var="viewComm">
			<option value="${viewComm.EX_COMM }" label="${viewComm.NICK }     <fmt:formatDate value="${viewComm.EX_COMM_DATE }" pattern="yyyy-MM-dd HH:mm"/>"></option>
		</c:forEach>
	</datalist>
</div>
<div class="form-group">
	<label for="content">신고 사유</label>
	<textarea rows="10" style="width: 100%;" id="why" name="why"></textarea>
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
	elPlaceHolder: "why",
	sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
});
</script>

</div><!-- .container -->




<c:import url="/WEB-INF/views/layout/footer.jsp" />