<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach items="${viewComm }" var="viewComm">
<div class="commentBox">
	<div><img style="width:30px; height:30px; border-radius: 70%;" src="/resources/img/perf/${viewComm.STORED_NAME}">&nbsp;&nbsp;&nbsp;</div>
	<div style="padding: 5px;">${viewComm.NICK}&nbsp;&nbsp;&nbsp;</div>
	<div style="padding: 5px;">${viewComm.EX_COMM }</div>
	<div style="font-size: 10px; padding: 5px; margin: 5px;"><fmt:formatDate value="${viewComm.EX_COMM_DATE}" pattern="yyyy-MM-dd HH:mm"/></div>
	<c:if test="${sessionScope.nick eq viewComm.NICK}">
		<a href="/extagram/deleteComment?exCommNo=${viewComm.EX_COMM_NO }"><button type="button" id="btnCommDelete" class="btn btn-xs">삭제</button></a>
	</c:if>
</div>
</c:forEach>
