<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">
table {
	table-layout: fixed;
}

table, th {
	text-align: center;
}

td:nth-child(2) {
	text-align: left;
}

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
#perf_pic {
	border: 1px solid #ccc;
	margin: 10px;
	height: 250px;
}

#perf_name {
	border: 1px solid #ccc;
	margin: 10px;
	text-align: center;
}
#brand_name {
	border: 1px solid #ccc;
	margin: 10px;
	text-align: center;
}


}
</style>


<div class="container">

<div class="flex-container">
<c:forEach items="${list }" var="perf">
    <div id="flex-items">
		<div id="perf_pic"><img class="imgg" style="width:230px; height:240px; display: block; margin: auto;"
					src="/resources/img/perf/${perf.STORED_NAME }"></div>
		<div id="perf_name">${perf.PERFUME_NAME }</div>
		<div id="brand_name">${perf.BRAND_NAME }</div>
    </div>
</c:forEach>
</div>


<!-- ----------------------------------------------------------------------------------- -->
<c:import url="/WEB-INF/views/layout/paging.jsp" />

</div><!-- .container -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />











