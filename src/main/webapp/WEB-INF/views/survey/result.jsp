<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/header.jsp" /> 
<div class="container">

<h1>결과창</h1>
<hr>
<h4>닉네임 : ${useName }</h4>

<div class="result-wrap">
	<c:forEach items="${list }" var="list">
		${list.NOTE_NAME }
		${list.NOTE_ATTRIBUTES }
		${list.NOTE_TYPE }
		<img alt="" src="/resources/img/note/${list.NOTE_NAME }.jpg">
	</c:forEach>
</div>
<div class="result-perf">
	<c:forEach items="${perfList }" var="perfList">
		<img alt="" src="/upload/${perfList.STORED_NAME }">
	</c:forEach>
</div>


</div><!-- container end -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />