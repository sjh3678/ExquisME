<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">
.flex-container {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	width: 90%;
	min-width: 1080px;
}
#flex-items {
	min-width: 260px;
	width: 260px;
	height: 380px;
	border-radius: 3px; 
	margin: 4px;
	border: 1px solid #ddd;
}
#a {
	margin: 10px;
}
#b {
	margin: 10px;
	height: 80px;
	display: block;
	text-overflow: ellipsis;
}
#c {
	margin: 10 0;
	height: 180px;
	width: 258px;
}
#d {
	margin: 10px;
}
#e {
	margin: 10px;
}
a:link { color: black; text-decoration: none;}
a:visited { color: black; text-decoration: none;}
a:hover { color: black; text-decoration: none;}
</style>

<h1>Extagram</h1>
<hr>

<div class="container">

<a href="/extagram/write"><button class="btn">WRITE</button></a><br><br>
<div class="flex-container">
<c:forEach items="${list}" var="list">
    <a href="/extagram/view?exNo=${list.EX_NO }">
	<div id="flex-items">
		<div id="a"><img style="width: 20; height: 20px;" src="/resources/img/perf/${list.PROFILE}">&nbsp;&nbsp;&nbsp;${list.NICK }</div>
		<div id="b">${list.EX_CONTENT }</div>
		<div id="c"><img style="width:auto; height: 180px; display: block; margin: auto;"
					src="/resources/img/perf/${list.PICTURE}"></div><!-- width: 258px -->
		<div id="d">하트 ${list.HEART }&nbsp;&nbsp;&nbsp;댓글 ${list.COMM }</div>
		<div id="e">${list.EX_DATE }</div>
    </div>
    </a>
</c:forEach>
</div>


<c:import url="/WEB-INF/views/layout/paging.jsp" />

</div><!-- .container -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />