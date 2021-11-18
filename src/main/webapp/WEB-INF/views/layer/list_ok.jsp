<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="flex-container">
<c:forEach items="${list }" var="layer">
    <div id="flex-items" data-layering_no="${layer.LAYERING_NO }">
		<div id="writer">
			<div id="profile">
				<img style="width:20px; height:20px; display: block; margin: auto; border-radius: 150px;" 
				src="/resources/img/profile/${layer.PROFILE }" >
			</div>
			<div id="writer_nick" >
				작성자 :  ${layer.NICK }
			</div>
		</div>
		<div id="content">내용 : ${layer.CONTENT }</div>
		
		<div id="perf_pic">
			<div class="imgcontainer1" style="background-image: url('/resources/img/perf/${layer.FILES1 }')">
				<%-- <img style="width:230px; height:240px; display: block; margin: auto;" class="img1" src="/resources/img/perf/${layer.FILES1 }"> --%>
			</div>
			<div class="imgcontainer2" style="background-image: url('/resources/img/perf/${layer.FILES2 }')">
				<%-- <img style="width:230px; height:240px; display: block; margin: auto;" class="img2" src="/resources/img/perf/${layer.FILES2 }"> --%>
			</div>
		</div>
		<div id="perf_name1">1 :${layer.PNAME1 }</div>
		<div id="perf_name2">2 :${layer.PNAME2 }</div>
		
		<div class="perf_per">
			<div class="per1">향수1 :${layer.PERFUME1_PER }%</div>
			<div class="per2">향수2 : ${100 - layer.PERFUME1_PER } % </div>
		</div>
		<div id="heart">
			<img alt="heart" 
				onload="if('true' == '${layer.SLIKE eq 1}') { $(this).addClass('heartRed'); }" 
				src="/resources/img/heart/heartEmpty.png" 
				style="with:15px; height:15px; cursor: pointer;" 
				onclick=loadLike(${layer.LAYERING_NO })>
		</div>
<%-- 		<div id="heart"><img alt="heart" src="/resources/img/heart/ --%>
<%-- 		<c:if test="${layer.SLIKE eq 0}">heartEmpty</c:if> --%>
<%-- 		<c:if test="${layer.SLIKE eq 1}">heartRed</c:if> --%>
<%-- 		.png" style="with:15px; height:15px;" onclick=loadLike(${layer.LAYERING_NO })> --%>
<!-- 		</div> -->
		<div id="heart_cnt">좋아요 수 : <span class="heart_scnt">${layer.SCNT }</span></div>
    </div>
</c:forEach>
</div>