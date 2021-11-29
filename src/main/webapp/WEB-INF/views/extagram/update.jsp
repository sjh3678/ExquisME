<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/header.jsp" />

<!-- 스마트 에디터 2 라이브러리 로드 -->
<!-- <script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script> -->

<script type="text/javascript">
$(document).ready(function() {
	//작성버튼 동작
	$("#btnUpdate").click(function() {
		var answer = confirm("게시글을 수정하시겠습니까?")
		if( answer == true ){
			$("form").submit();
		} else {
			return false;
		}
	});
	
	$("#btnCancel").click(function() {
		var answer = confirm("게시글 수정을 취소하시겠습니까?")		
		if(answer == true) {
			history.go(-1);
		} else {
			return false;
		}
	})
})
</script>

<div class="container">

<h1><strong>Edit Extagram</strong></h1><br>

<form action="/extagram/update" method="post" enctype="multipart/form-data">
<div class="form-group">
	<span><strong>작성자</strong><br>${nick }</span><br><br>
	<input type="hidden" id="nick" name="nick" value="${nick }" />
	<input type="hidden" id="userNo" name="userNo" value="${userNo }" />
</div>
<div class="form-group">
	<label for="content">본문</label>
	<input type="hidden" name="exNo" value="${viewExta.EX_NO }" />
	<input type="hidden" name="fileNo" value="${fileUpload.fileNo }" />
	<textarea rows="10" style="width: 100%;" id="exContent" name="exContent">${viewExta.EX_CONTENT }</textarea>
</div>

<div class="form-group">
	기존 사진 : <a href="/upload/${viewExta.PICTURE}">${viewExta.PIC}</a><br><br>
	<input type="file" id="file" name="file"/>
	<small>** 새로운 사진을 업로드하면 기존 사진이 삭제됩니다 **</small>
</div>

<div class="text-center">
	<button class="btn" id="btnUpdate">작성</button>
	<button class="btn" id="btnCancel">취소</button>
</div>
</form>

</div><!-- .container -->




<c:import url="/WEB-INF/views/layout/footer.jsp" />