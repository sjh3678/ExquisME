<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>

<script type="text/javascript">
function submitContents(elClickedObj) {
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
	try {
		elClickedObj.form.submit();
	} catch(e) {}
}

$(document).ready(function(){
	$("#btnWrite").click(function(){
		submitContents($("#btnWrite"));
		$("form").submit();
	})
	$("#btnCancel").click(function(){
		history.go(-1);
	})
})
</script>

<%-- ################################################## --%>

<div class="container">

<h1>admin faq update</h1>
<hr>

<form action="/admin/faq/update" method="post" enctype="multipart/form-data">

<div class="form-group">
	<label for="faqNo">글번호</label>
	<input type="text" id="faqNo" name="faqNo" class="form-control" value="${i.faqNo }" readonly="readonly"/>
</div>

<div class="form-group">
	<label for="title">제목</label>
	<input type="text" id="title" name="faqTitle" class="form-control" value="${i.faqTitle }"/>
</div>

<div class="form-group">
	<label for="content">본문</label>
	<textarea rows="10" style="width: 100%;" id="content" name="faqContent">${i.faqContent }</textarea>
</div>

<div class="text-center">
	<button class="btn" id="btnWrite">작성</button>
	<input type="reset" id="btnCancel" class="btn" value="취소"/>
</div>

</form>

<%-- ################################################## --%>

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "content",
	sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
});
</script>

</div><%-- .container --%>

<c:import url="/WEB-INF/views/layout/footer.jsp" />