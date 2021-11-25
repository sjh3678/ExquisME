<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<div class="flex-container">
<c:forEach items="${list }" var="perf">
    <div class="flex-items">
		<div class="perf_pic">
			<a href="/perf/view?perfumeNo=${perf.PERFUME_NO }">
				<img class="perf_img" style="max-width:240px; height:240px; display: block; margin: auto;"
					src="/upload/${perf.STORED_NAME }">
			</a>
		</div>
		<div class="perf_name">${perf.PERFUME_NAME }</div>
		<div class="brand_name">${perf.BRAND_NAME }</div>
    </div>
</c:forEach>
</div>