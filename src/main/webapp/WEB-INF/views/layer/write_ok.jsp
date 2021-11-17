<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="flex-container">
<c:forEach items="${list }" var="perf" varStatus="i">
    <div class="flex-items">
<%-- 		<div class="perf_pic" data-div="${i.index }" ondrop="drop(event)" ondragover="dragEnter(event)"> --%>
		<div class="perf_pic" data-div="${i.index }" ondragover="dragEnter(event)">
			<img class="perf_img" data-img="${i.index }" id="${perf.STORED_NAME }" style="width:70px; height:80px; display: block; margin: auto;"
			src="/resources/img/perf/${perf.STORED_NAME }" draggable="true" ondragstart="drag(event)">
		</div>
		<div class="perf_name">${perf.PERFUME_NAME }</div>
		<div class="brand_name">${perf.BRAND_NAME }</div>
    </div>
</c:forEach>
<div id="paging" style="width: 100%;">
	<c:import url="/WEB-INF/views/layout/pagingLayer.jsp"/>
</div>
</div>




