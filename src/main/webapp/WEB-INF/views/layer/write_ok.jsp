<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="flex-container">
<c:forEach items="${list }" var="perf">
    <div class="flex-items">
		<div class="perf_pic"><img class="perf_img" style="width:70px; height:80px; display: block; margin: auto;"
					src="/resources/img/perf/${perf.STORED_NAME }"></div>
		<div class="perf_name">${perf.PERFUME_NAME }</div>
		<div class="brand_name">${perf.BRAND_NAME }</div>
    </div>
</c:forEach>
<div id="paging">
   <c:import url="/WEB-INF/views/layout/pagingLayer.jsp"/>
</div>
</div>




