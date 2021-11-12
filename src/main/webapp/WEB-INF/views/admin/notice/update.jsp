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
	$("#cancel").click(function(){
		history.go(-1);
	})
})
</script>

<%-- ################################################## --%>

<style type="text/css">
table{
	table-layout: fixed;
}
table, th{
	text-align: center;
}
td:nth-child(2){/*제목은 왼쪽 정렬*/
	text-align: left;
}
</style>

<div class="container">

<h1>admin notice list</h1>
<hr>

<table class="table table-striped table-hover">
<tr>
	<th>게시글번호</th>
	<th>제목</th>
	<th>작성자</th>
	<th>내용</th>
	<th>작성일</th>
	<th>orginname</th>
	<th>storedname</th>
	<th>수정</th>
	<th>삭제</th>
</tr>
<tr>
	<td>${i.NOTICE_NO}</td>
	<td>${i.NOTICE_TITLE}</td>
	<td>${nick }</td>
	<td>${i.NOTICE_CONTENT}</td>
	<td><fmt:formatDate value="${i.NOTICE_DATE}" pattern="YY-MM-dd"/></td>
	<td>${i.ORIGIN_NAME}</td>
	<td><img width="50" height="50" src="/resources/img/empty"></td>
</tr>
</table>

<form action="/admin/notice/write" method="post" enctype="multipart/form-data">

<div class="form-group">
	<label for="title">공지번호</label>
	<input type="text" id="title" name="noticeTitle" class="form-control" value="${i.NOTICE_NO}"/>
</div>

<div class="form-group">
	<label for="title">제목</label>
	<input type="text" id="title" name="noticeTitle" class="form-control" value="${i.NOTICE_TITLE}"/>
</div>

<div class="form-group">
	<label for="content">본문</label>
	<textarea rows="10" style="width: 100%;" id="content" name="noticeContent">${i.NOTICE_CONTENT}</textarea>
</div>

<div class="form-group">
	<label for="curFile">현재 등록된 이미지</label>
	<img class="curFile" src="#">
</div>

<div class="form-group">
	<label for="file">첨부파일</label>
	<input type="file" id="file" name="file" />
</div>

<div class="text-center">
	<button class="btn btn-primary" id="btnWrite">작성</button>
	<input type="reset" id="cancel" class="btn btn-danger" value="취소"/>
</div>

</form>

<a href="/admin/notice/update?noticeNo=${i.NOTICE_NO }"><button id="btnUpdate" class="btn btn-primary">확인</button></a>
<a href="/admin/notice/delete?noticeNo=${i.NOTICE_NO }"><button id="btnUpdate" class="btn btn-danger">삭제</button></a>

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