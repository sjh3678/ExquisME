<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${result}">	 
	<img id="btnHeart" src="/resources/img/heart/heartRed.png" style="width: 20px; cursor: pointer; height: auto;" />
</c:if>
<c:if test="${not result}">	 
	<img id="btnHeart" src="/resources/img/heart/heartEmpty2.png" style="width: 20px; cursor: pointer; height: auto;" />
</c:if>

																				 ${viewExta.HEART}&nbsp;&nbsp;&nbsp;
<img style="width: 20px; height: auto;" src="/resources/img/heart/balloon.png"/> ${viewExta.COMM }
