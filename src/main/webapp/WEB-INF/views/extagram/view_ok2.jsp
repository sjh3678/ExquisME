<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<img id="btnHeart" onclick=heartClick(); src="/resources/img/heart/heartEmpty2.png" 
	 style="width: 20px; cursor: pointer; height: auto;" /> ${viewExta.HEART}&nbsp;&nbsp;&nbsp;
<img style="width: 20px; height: auto;" src="/resources/img/heart/balloon.png"/> ${viewExta.COMM }