<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/header.jsp"/>

<div class="container">
<div class="text-center" id="pageName">
<h1>메인 페이지</h1>
<hr>
<c:if test=${empty login }>
비회원 접속중
</c:if>
<c:if test="${not empty login }">
${nick } 님 접속중
</c:if>
</div>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>