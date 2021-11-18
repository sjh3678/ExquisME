<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<th class="tg-c3ow">
    <h4>Like</h4>
    	<div id="perfLikeCnt">
    	${perfLike.CNT }
   		</div>
   		<br>
   		<c:if test="${userLikeCnt eq 0 && not empty login }">	
    	<i id="perfLike" class="far fa-thumbs-up" style="font-size: 30px; color: blue;"></i>
    	</c:if>
    	<c:if test="${userLikeCnt eq 1 && not empty login }">
    	<i id="perfLikeCancel" class="fas fa-thumbs-up" style="font-size: 30px; color: blue;"></i>
    	</c:if>
    	<br>
    </th>
    <th class="tg-c3ow">
    <h4>Dislike</h4>
    
    	<div>
    	${perfDislike.CNT }
    	</div>
    	<br>
    	<c:if test="${userDislikeCnt eq 0 && not empty login }">
    	<i id="perfDislike" class="far fa-thumbs-down" style="font-size: 30px; color: red;"></i>
    	</c:if>
    	<c:if test="${userDislikeCnt eq 1 && not empty login }">
    	<i id="perfDislikeCancel" class="fas fa-thumbs-down" style="font-size: 30px; color: red;"></i>
    	</c:if>
    	<br>
    </th>