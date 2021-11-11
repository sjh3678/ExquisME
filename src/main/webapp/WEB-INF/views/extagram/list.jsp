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
	height: 400px;
	border: 1px solid;
	border-radius: 3px; 
	margin:4px;
}
#a {
	border: 1px solid #ccc;
	margin: 10px;
}
#b {
	border: 1px solid #ccc;
	margin: 10px;
	height: 90px;
}
#c {
	border: 1px solid #ccc;
	margin: 10 0;
	height: 180px;
	width: 260px;
}
#d {
	border: 1px solid #ccc;
	margin: 10px;
}
#e {
	border: 1px solid #ccc;
	margin: 10px;
}

}
</style>

<h1>Extagram</h1>
<hr>

<div class="container">

<div class="flex-container">
<a href="/extagram/list?exNo=${list.exNo }"><button></button></a>
<c:forEach items="${list}" var="list">
    <div id="flex-items">
		<div id="a">프로필사진 닉네임${list.exNo }</div>
		<div id="b">${list.exContent }</div>
		<div id="c">사진</div>
		<div id="d">♡ 0</div>
		<div id="e">${list.exDate }</div>
    </div>
</c:forEach>
</div>
<c:import url="/WEB-INF/views/layout/paging.jsp" />

</div><!-- .container -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />