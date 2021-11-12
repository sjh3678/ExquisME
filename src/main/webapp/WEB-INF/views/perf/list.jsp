<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function(){
	$("#search").click(function(){
		console.log("#ajax clicked")
		
		$.ajax({
			type: "get"
			, url: "/perf/list_ok"
			, data: {
				search: $("input[name=search]").val()
			}
			, dataType: "html"
			, success: function(res){
				console.log("AJAX 성공")
				
				$(".flex-container").html(res)
			}
			, error: function(){
				console.log("AJAX 실패")
			}
		})
	})
});
</script>


<style type="text/css">
table {
	table-layout: fixed;
}

table, th {
	text-align: center;
}

td:nth-child(2) {
	text-align: left;
}

.flex-container {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	width: 90%;
	min-width: 1080px;
}
.flex-items {
	min-width: 260px;
	width: 260px;
	height: 400px;
	border: 1px solid;
	border-radius: 3px; 
	margin:4px;
}
.perf_pic {
	border: 1px solid #ccc;
	margin: 10px;
	height: 250px;
}

.perf_name {
	border: 1px solid #ccc;
	margin: 10px;
	text-align: center;
}
.brand_name {
	border: 1px solid #ccc;
	margin: 10px;
	text-align: center;
}


}
</style>


<div class="container">

<div class="search">
	<form style="text-align: center;"> 
		<input type="text" name="search" size="50" maxlength="30" placeholder="상품을 검색해보세요." /><input id="search" type="button" value="검색" />
	</form>
</div>


<div class="flex-container">
<c:forEach items="${list }" var="perf">
    <div class="flex-items">
		<div class="perf_pic"><img class="perf_img" style="width:230px; height:240px; display: block; margin: auto;"
					src="/resources/img/perf/${perf.STORED_NAME }"></div>
		<div class="perf_name">${perf.PERFUME_NAME }</div>
		<div class="brand_name">${perf.BRAND_NAME }</div>
    </div>
</c:forEach>
</div>


<!-- ----------------------------------------------------------------------------------- -->
<c:import url="/WEB-INF/views/layout/paging.jsp" />

</div><!-- .container -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />











