<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<th class="tg-c3ow">
    <h4>Like</h4>
    	<div id="perfLikeCnt">
    	${perfLike.CNT }
   		</div>
   		<br>
   		<c:if test="${userLikeCnt eq 0 && not empty login }">	
    	<button id="perfLike">좋아요</button>
    	</c:if>
    	<c:if test="${userLikeCnt eq 1 && not empty login }">
    	<button id="perfLikeCancel">좋아요 취소</button>
    	</c:if>
    </th>
    <th class="tg-c3ow">
    <h4>Dislike</h4>
    	<div>
    	${perfDislike.CNT }
    	</div>
    	<br>
    	<c:if test="${userDislikeCnt eq 0 && not empty login }">
    	<button id="perfDislike">싫어요</button>
    	</c:if>
    	<c:if test="${userDislikeCnt eq 1 && not empty login }">
    	<button id="perfDislikeCancel">실어요 취소</button>
    	</c:if>
    
    </th>