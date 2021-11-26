<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="flex-container">
<c:forEach items="${list }" var="layer">
    <div id="flex-items" data-layering_no="${layer.LAYERING_NO }">
		<div id="writer">
			<div id="profile">
				<img style="width:20px; height:20px; display: block; margin: auto; border-radius: 150px;" 
				src="/upload/${layer.PROFILE }" >
			</div>
			<div id="writer_nick">
				${layer.NICK }
			</div>
		</div>
		<div id="content">${layer.LAYERING_CONTENT }</div>
		
		<div id="perf_pic">
			<div class="imgcontainer1" style="background-image: url('/upload/${layer.FILES1 }')">
				<%-- <img style="width:230px; height:240px; display: block; margin: auto;" class="img1" src="/resources/img/perf/${layer.FILES1 }"> --%>
			</div>
			<div class="imgcontainer2" style="background-image: url('/upload/${layer.FILES2 }')">
				<%-- <img style="width:230px; height:240px; display: block; margin: auto;" class="img2" src="/resources/img/perf/${layer.FILES2 }"> --%>
			</div>
		</div>
		<div id="perf_name1"><span style="font-weight: 700">L</span> ${layer.PNAME1 }</div>
		<div id="perf_name2"><span style="font-weight: 700">R</span> ${layer.PNAME2 }</div>
		
		<div class="perf_per">
			<div class="per1">${layer.PERFUME1_PER }%</div>
			<div class="per2">${100 - layer.PERFUME1_PER }% </div>
		</div>
		<div id="heart">
			<div id="heartInner">
			<img alt="heart" 
				onload="if('true' == '${layer.SLIKE eq 1}') { $(this).addClass('heartRed'); }" 
				src="/resources/img/heart/heartEmpty.png" 
				style="width:20px; height:20px; cursor: pointer;" 
				onclick=loadLike(${layer.LAYERING_NO })>
			<span class="heart_scnt">${layer.SCNT }</span>
			</div>
		</div>
<%-- 		<div id="heart"><img alt="heart" src="/resources/img/heart/ --%>
<%-- 		<c:if test="${layer.SLIKE eq 0}">heartEmpty</c:if> --%>
<%-- 		<c:if test="${layer.SLIKE eq 1}">heartRed</c:if> --%>
<%-- 		.png" style="with:15px; height:15px;" onclick=loadLike(${layer.LAYERING_NO })> --%>
<!-- 		</div> -->
    </div>
</c:forEach>
</div>