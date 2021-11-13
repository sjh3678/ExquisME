<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
<div class="flex-container">
<c:forEach items="${list }" var="layer">
    <div id="flex-items">
		<div id="writer">
			<div id="profile">
				<img style="width:20px; height:20px; display: block; margin: auto;" src="/resources/img/perf/${layer.FILES1 }" >
			</div>
			<div id="writer_nick" >
				작성자 :  ${layer.NICK }
			</div>
		</div>
		<div id="content">내용 : ${layer.CONTENT }</div>
		
		<div id="perf_pic" style="cursor: pointer;" onclick="location.href='/layer/view?layeringNo=${layer.LAYERING_NO }'">
			<div class="imgcontainer1" style="background-image: url('/resources/img/perf/${layer.FILES1 }')">
				<%-- <img style="width:230px; height:240px; display: block; margin: auto;" class="img1" src="/resources/img/perf/${layer.FILES1 }"> --%>
			</div>
			<div class="imgcontainer2" style="background-image: url('/resources/img/perf/${layer.FILES2 }')">
				<%-- <img style="width:230px; height:240px; display: block; margin: auto;" class="img2" src="/resources/img/perf/${layer.FILES2 }"> --%>
			</div>
		</div>
		<div id="perf_name1">1 :${layer.PNAME1 }</div>
		<div id="perf_name2">2 :${layer.PNAME2 }</div>
		
		<div id="heart">♡</div>
		<div id="heart_cnt">좋아요 수 : ${layer.SCNT }</div>
    </div>
</c:forEach>
</div>