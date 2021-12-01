<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<th class="tg-c3ow">
    <div style="font-size: 21px; font-weight: 300;">Like</div>
    	<div id="perfLikeCnt">
    	${perfLike.CNT }
   		</div>
   		<br>
   		<c:if test="${userLikeCnt eq 0 && not empty login }">
    		<img id="perfLike" src="/resources/img/like/like_empty.png">
    	</c:if>
    	<c:if test="${userLikeCnt eq 1 && not empty login }">
    		<img id="perfLikeCancel" src="/resources/img/like/like_filled.png">
    	</c:if>
    	<br>
</th>
<th class="tg-c3ow">
    <div style="font-size: 21px; font-weight: 300;">Dislike</div>
    
    	<div>
    	${perfDislike.CNT }
    	</div>
    	<br>
    	<c:if test="${userDislikeCnt eq 0 && not empty login }">
    		<img id="perfDislike" src="/resources/img/like/dislike_empty.png">
    	</c:if>
    	<c:if test="${userDislikeCnt eq 1 && not empty login }">
    		<img id="perfDislikeCancel" src="/resources/img/like/dislike_filled.png">
    	</c:if>
    	<br>
</th>