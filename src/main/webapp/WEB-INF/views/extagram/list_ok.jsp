<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="flex-container">
<c:forEach items="${list}" var="list">
	<div id="flex-items" onclick="location.href='/extagram/view?exNo=${list.EX_NO}';" style="cursor: pointer;">
		<div id="a"><img style="width: 30px; height: 30px; border-radius: 70%;" src="/resources/img/perf/${list.PROFILE}">&nbsp;&nbsp;&nbsp;${list.NICK }</div>
		<div id="b">${list.EX_CONTENT }</div>
		<div id="c"><img style="max-width: 100%; height: auto; max-height: 180px; display: block; margin: auto;"
					src="/upload/${list.PICTURE}"></div><!-- width: 258px -->
		<div id="d">
			<img style="width: 20px; height: auto;" src="/resources/img/heart/heartEmpty2.png"/> ${list.HEART }&nbsp;&nbsp;
			<img style="width: 20px; height: auto;" src="/resources/img/heart/balloon.png"/> ${list.COMM }
		</div>
		<div id="e"><fmt:formatDate value="${list.EX_DATE }" pattern="yyyy.MM.dd HH:mm"/> </div>
    </div>
</c:forEach>
</div>