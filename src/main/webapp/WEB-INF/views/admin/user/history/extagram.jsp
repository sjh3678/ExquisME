<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />


<div class="container">
<h1>회원 작성물</h1>
<hr>
<div style="text-align: center;">

</div>
<br>
<table class="table table-striped table-hover">
<thead>
	<tr>
		<th style="width: 15%; text-align: center;">프로필사진</th>
		<th style="width: 15%; text-align: center;">닉네임</th>
		<th style="width: 15%; text-align: center;">exta사진</th>
		<th style="width: 35%; text-align: center;">내용</th>
		<th style="width: 10%; text-align: center;">상세보기</th>
		<th style="width: 10%; text-align: center;">삭제</th>
		
	</tr>
</thead>
<tbody>
<c:forEach items="${extaList }" var="exta">
	<tr>
		<td style="text-align: center;"><img class="user_img" style="width:50px; height:50px; display: block; margin: auto;"
					src="/upload/${exta.PROFILE }"></td>
		<td style="text-align: center;">${exta.NICK }</td>
		<td style="text-align: center;"><img class="user_img" style="width:50px; height:50px; display: block; margin: auto;"
					src="/upload/${exta.UPFILE }"></td>
		<td style="text-align: center;">${exta.EX_CONTENT }</td>
		<td style="text-align: center;"><a href="/extagram/view?exNo=${exta.EX_NO }"><button>상세보기</button></a></td>
		<td style="text-align: center;"><a href="/admin/user/history/extagram/delete?exNo=${exta.EX_NO }&userNo=${exta.POSTOWNER }"><button>삭제</button></a></td>
	</tr>	
</c:forEach>
</tbody>
</table>

<c:import url="/WEB-INF/views/layout/paging.jsp" />
</div><%-- .container --%>
<c:import url="/WEB-INF/views/layout/footer.jsp" />