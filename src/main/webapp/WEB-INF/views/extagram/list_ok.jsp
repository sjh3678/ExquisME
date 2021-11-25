<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="flex-container">
<c:forEach items="${list}" var="list">
	<div id="flex-items" onclick="location.href='/extagram/view?exNo=${list.EX_NO}';" style="cursor: pointer;">
		<div id="a">
			<img style="width: 30px; height: 30px; border-radius: 70%;" src="/upload/${list.PROFILE}">&nbsp;&nbsp;&nbsp;${list.NICK }
			<c:if test="${admin eq 'S' || admin eq 'M' }">
			<div id="aDelete"><a href="/admin/extagram/delete?exNo=${list.EX_NO }"><button class="btn">삭제</button></a></div>
			</c:if>
		</div>
		<div id="b" style="width: 251px;">${list.EX_CONTENT }</div>
		<div id="c" style="display:table;">
			<div id="cCenter" style="display:table-cell; vertical-align:middle;">
			<img style="max-width: 240px; max-height: 240px; display: block; margin: 0 auto;" src="/upload/${list.PICTURE}">
			</div>
		</div><!-- width: 258px -->
		<div id="d">
			<img style="width: 20px; height: auto;" src="/resources/img/heart/heartEmpty2.png"/> ${list.HEART }&nbsp;&nbsp;
			<img style="width: 20px; height: auto;" src="/resources/img/heart/balloon.png"/> ${list.COMM }
		</div>
		<div id="e"><fmt:formatDate value="${list.EX_DATE }" pattern="yyyy.MM.dd HH:mm"/> </div>
    </div>
</c:forEach>
</div>