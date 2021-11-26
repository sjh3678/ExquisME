<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />


<div class="container">

<img class="user_img" style="clip-path: circle(50% at 50% 50%); width:150px; height:150px; display: block; margin: auto;"
					src="/upload/${file.storedName }">
					<br>


<h1 style="text-align: center;"> ${user.nick } 님의 Layering</h1>
<hr>
<div style="text-align: center;">
<a href="/admin/user/history/extagram?userNo=${user.userNo }"><button>extagram</button></a>
<a href="/admin/user/history/extagramComment?userNo=${user.userNo }"><button>extagram comment</button></a>
<a href="/admin/user/history/layer?userNo=${user.userNo }"><button>layering</button></a>
</div>
<br>
<table class="table table-striped table-hover">
<thead>
	<tr>		
		<th style="width: 15%; text-align: center;">Layering 번호</th>
		<th style="width: 20%; text-align: center;">향수 1</th>
		<th style="width: 20%; text-align: center;">향수 2</th>
		<th style="width: 10%; text-align: center;">비율</th>
		<th style="width: 20%; text-align: center;">작성일</th>
		<th style="width: 15%; text-align: center;">삭제</th>
		
	</tr>
</thead>
<tbody>
<c:forEach items="${layerList }" var="list">
	<tr>
		<td style="text-align: center;">${list.LAYERING_NO }</td>
		<td style="text-align: center;"><img class="user_img" style=" width:50px; height:50px; display: block; margin: auto;"
					src="/upload/${list.PERFUME1 }"></td>
		<td style="text-align: center;"><img class="user_img" style=" width:50px; height:50px; display: block; margin: auto;"
					src="/upload/${list.PERFUME2 }"></td>
		<td style="text-align: center;">${list.PERFUME1_PER } / ${100 - list.PERFUME1_PER }</td>
		<td style="text-align: center;">${list.LAYERING_DATE }</td>
		<td style="text-align: center;"><a href="/admin/user/history/layer/delete?layeringNo=${list.LAYERING_NO }&userNo=${list.USER_NO }" onclick="return confirm('레이어링을 삭제하시겠습니까? 삭제된 레이어링은 원상복구 할 수 없습니다.');"><button>레이어링 삭제</button></a></td>
	</tr>	
</c:forEach>
</tbody>
</table>

<c:import url="/WEB-INF/views/layout/paging3.jsp" />
</div><%-- .container --%>
<c:import url="/WEB-INF/views/layout/footer.jsp" />