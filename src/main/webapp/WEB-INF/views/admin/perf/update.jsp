<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />


<script type="text/javascript">
$(document).ready(function(){
	$("#btnWrite").click(function(){
		console.log("등록 클릭");
			
		if (confirm("수정 하시겠습니까?")) {
			var p2 = document.getElementById('perfName').value;
			var p3 = document.getElementById('brandNo').value;
			var p4 = document.getElementById('perfumeGender').value;
			var p5 = document.getElementById('perfumeVitality').value;
			var p6 = $("input:checkbox[name=noteNo]").is(":checked");
			if (p2 == ""|| p3 == 0 || p4 == 0 || p5 == 0 || p6 == false) {
		         alert('필수항목 누락')
		         return false;
			}else{
				alert('수정 되었습니다.')
				$("form").submit();
			}
		}else{
			return false;
		}
	})
	$("#btnCancel").click(function(){
		location.href="/admin/perf/list";
	})
})

</script>





<style type="text/css">

.filter-container{
	display: flex;
	flex-direction: row;
	margin: 0 auto;
	text-align: center;
}

.tg  {border-collapse:collapse;border-spacing:0;}
.tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  overflow:hidden;padding:10px 5px;word-break:normal;}
.tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
.tg .tg-baqh{text-align:center;vertical-align:top}
.tg .tg-0lax{text-align:left;vertical-align:top}

</style>



<div class="container" style="text-align: center;">
<h1>향수 정보 수정</h1>

<hr>

<form action="/admin/perf/update" method="post" enctype="multipart/form-data" class="form-horizontal">
	
	
	<table class="tg" style="undefined;table-layout: fixed; width: 400px; margin: 0 auto;">
		<colgroup>
		<col style="width: 100px">
		<col style="width: 300px">
		</colgroup>
		<thead>
		  <tr>
		    <th class="tg-baqh">사진 등록</th>
		    <th class="tg-baqh"><input type="file" id="file" name="file"/><span>기존 파일 : ${perf.ORIGIN_NAME }</span>
		    </th>
		  </tr>
		</thead>
		<tbody>
		  <tr>
		    <td class="tg-baqh">향수 이름</td>
		    <td class="tg-baqh"><input type="text" id="perfName" name="perfumeName" value="${perf.PERFUME_NAME }" style="width:280px;"/></td>
		  </tr>
		  <tr>
		    <td class="tg-baqh">브랜드</td>
		    <td class="tg-baqh">
			    <select id="brandNo" name="brandNo">      
					<option value=1 <c:if test="${perf.BRAND_NAME eq 'CHANEL'}"> selected </c:if>>CHANEL</option>
					<option value=2 <c:if test="${perf.BRAND_NAME eq 'JOMALONE'}"> selected </c:if>>JOMALONE</option>
					<option value=3 <c:if test="${perf.BRAND_NAME eq 'GUCCI'}"> selected </c:if>>GUCCI</option>
					<option value=4 <c:if test="${perf.BRAND_NAME eq 'diptyque'}"> selected </c:if>>diptyque</option>
					<option value=5 <c:if test="${perf.BRAND_NAME eq 'KENZO'}"> selected </c:if>>KENZO</option>
					<option value=6 <c:if test="${perf.BRAND_NAME eq 'MONTBLANC'}"> selected </c:if>>MONTBLANC</option>
					<option value=7 <c:if test="${perf.BRAND_NAME eq 'BURBERRY'}"> selected </c:if>>BURBERRY</option>
					<option value=8 <c:if test="${perf.BRAND_NAME eq 'DIOR'}"> selected </c:if>>DIOR</option>
					<option value=9 <c:if test="${perf.BRAND_NAME eq 'BVLGARI'}"> selected </c:if>>BVLGARI</option>
				</select>
			</td>
		  </tr>
		  <tr>
		    <td class="tg-baqh">대상 성별</td>
		    <td class="tg-baqh">
			    <select id="perfumeGender" name="perfumeGender">      
					<option value=1 <c:if test="${perf.PERFUME_GENDER eq 1}"> selected </c:if>>female</option>
					<option value=2 <c:if test="${perf.PERFUME_GENDER eq 2}"> selected </c:if>>male</option>
					<option value=3 <c:if test="${perf.PERFUME_GENDER eq 3}"> selected </c:if>>unisex</option>
				</select>
			</td>
		  </tr>
		  <tr>
		    <td class="tg-baqh">지속력</td>
		    <td class="tg-baqh">
			    <select id="perfumeVitality" name="perfumeVitality" style="text-align:left;">      
					<option value="parfum" <c:if test="${perf.PERFUME_VITALITY eq 'parfum'}"> selected </c:if>>parfum</option>
					<option value="eau de parfum" <c:if test="${perf.PERFUME_VITALITY eq 'eau de parfum'}"> selected </c:if>>eau de parfum</option>
					<option value="eau de toilette" <c:if test="${perf.PERFUME_VITALITY eq 'eau de toilette'}"> selected </c:if>>eau de toilette</option>
					<option value="eau de cologne" <c:if test="${perf.PERFUME_VITALITY eq 'eau de cologne'}"> selected </c:if>>eau de cologne</option>
					<option value="shower cologne" <c:if test="${perf.PERFUME_VITALITY eq 'shower cologne'}"> selected </c:if>>shower cologne</option>
				</select></td>
		  </tr>
		</tbody>
</table>
	
	
	
	
	
	<hr>
		<h4> Top Notes </h4>
	<hr style="margin: 5px;">
	<br>
	<div id="noteNo" class="filter-container">
		<div style="margin: 0 auto;">
			<input type="checkbox" id="clean" value= 1 class="filter-item"
			name="noteNo" <c:forEach items="${topNote }" var="topNote"> <c:if test="${topNote.NOTE_NO eq 1}"> checked </c:if> </c:forEach> />
			<br>
			<br>
			<label for="clean"><img style="clip-path: circle(50% at 50% 50%);" alt="clean" src="/resources/img/note/clean.jpg">
			<br> 
			clean
			</label>
		</div>
		<div style="margin: 0 auto;">
			<input type="checkbox" id="citrus" value= 2 class="filter-item"
			name="noteNo" <c:forEach items="${topNote }" var="topNote"> <c:if test="${topNote.NOTE_NO eq 2}"> checked </c:if> </c:forEach>/>
			<br>
			<br>
			<label for="citrus"><img style="clip-path: circle(50% at 50% 50%);" alt="citrus" src="/resources/img/note/citrus.jpg">
			<br>
			citrus
			</label>
		</div>
		<div style="margin: 0 auto;">
			<input type="checkbox" id="water" value= 3 class="filter-item"
			name="noteNo" <c:forEach items="${topNote }" var="topNote"> <c:if test="${topNote.NOTE_NO eq 3}"> checked </c:if> </c:forEach>/> 
			<br>
			<br>
			<label for="water"><img style="clip-path: circle(50% at 50% 50%);" alt="water" src="/resources/img/note/water.jpg">
			<br>
			water
			</label>
		</div>
	</div>
	<br>
	<br>
	<div class="filter-container">
		<div style="margin: 0 auto;">
			<input type="checkbox" id="creamy" value= 4 class="filter-item"
			name="noteNo" <c:forEach items="${topNote }" var="topNote"> <c:if test="${topNote.NOTE_NO eq 4}"> checked </c:if> </c:forEach>/>
			<br>
			<br>
			<label for="creamy"><img style="clip-path: circle(50% at 50% 50%);" alt="creamy" src="/resources/img/note/creamy.jpg">
			<br>
			creamy
			</label>
		</div>
		<div style="margin: 0 auto;">
			<input type="checkbox" id="fruit" value= 5 class="filter-item"
			name="noteNo" <c:forEach items="${topNote }" var="topNote"> <c:if test="${topNote.NOTE_NO eq 5}"> checked </c:if> </c:forEach>/> 
			<br>
			<br>
			<label for="fruit"><img style="clip-path: circle(50% at 50% 50%);" alt="fruit" src="/resources/img/note/fruit.jpg">
			<br>
			fruit
			</label>
		</div >
		<div style="margin: 0 auto;">
			<input type="checkbox" id="aroma" value= 6 class="filter-item"
			name="noteNo" <c:forEach items="${topNote }" var="topNote"> <c:if test="${topNote.NOTE_NO eq 6}"> checked </c:if> </c:forEach>/>
			<br>
			<br>
			<label for="aroma"><img style="clip-path: circle(50% at 50% 50%);" alt="aroma" src="/resources/img/note/aroma.jpg">
			<br>
			aroma
			</label>
		</div>
	</div>
	
	<hr>
		
	<h4> Middle Notes </h4>
	<hr style="margin: 5px;">
	<br>
	<div class="filter-container">
		<div style="margin: 0 auto;">
			<input type="checkbox" id="green" value= 7 class="filter-item"
			name="noteNo" <c:forEach items="${middleNote }" var="middleNote"> <c:if test="${middleNote.NOTE_NO eq 7}"> checked </c:if> </c:forEach>/> 
			<br>
			<br>
			<label for="green"><img style="clip-path: circle(50% at 50% 50%);" alt="green" src="/resources/img/note/green.jpg">
			<br>
			green
			</label>
		</div>
		<div style="margin: 0 auto;">
			<input type="checkbox" id="herbal" value= 8 class="filter-item"
			name="noteNo" <c:forEach items="${middleNote }" var="middleNote"> <c:if test="${middleNote.NOTE_NO eq 8}"> checked </c:if> </c:forEach>/>
			<br>
			<br>
			<label for="herbal"><img style="clip-path: circle(50% at 50% 50%);" alt="herbal" src="/resources/img/note/herbal.jpg">
			<br> 
			herbal
			</label>
		</div>
		<div style="margin: 0 auto;">
			<input type="checkbox" id="floral" value= 9 class="filter-item"
			name="noteNo" <c:forEach items="${middleNote }" var="middleNote"> <c:if test="${middleNote.NOTE_NO eq 9}"> checked </c:if> </c:forEach>/> 
			<br>
			<br>
			<label for="floral"><img style="clip-path: circle(50% at 50% 50%);" alt="floral" src="/resources/img/note/floral.jpg">
			<br>
			floral
			</label>
		</div>
	</div>
	<br>
	<br>
	<div class="filter-container">
		<div style="margin: 0 auto;">
			<input type="checkbox" id="smoke" value= 10 class="filter-item"
			name="noteNo" <c:forEach items="${middleNote }" var="middleNote"> <c:if test="${middleNote.NOTE_NO eq 10}"> checked </c:if> </c:forEach>/> 
			<br>
			<br>
			<label for="smoke"><img style="clip-path: circle(50% at 50% 50%);" alt="smoke" src="/resources/img/note/smoke.jpg">
			<br>
			smoke
			</label>
		</div>
		<div style="margin: 0 auto;">
			<input type="checkbox" id="rose" value= 11 class="filter-item"
			name="noteNo" <c:forEach items="${middleNote }" var="middleNote"> <c:if test="${middleNote.NOTE_NO eq 11}"> checked </c:if> </c:forEach>/> 
			<br>
			<br>
			<label for="rose"><img style="clip-path: circle(50% at 50% 50%);" alt="rose" src="/resources/img/note/rose.jpg">
			<br>
			rose
			</label>
		</div>
		<div style="margin: 0 auto;">
			<input type="checkbox" id="spice" value= 12 class="filter-item"
			name="noteNo" <c:forEach items="${middleNote }" var="middleNote"> <c:if test="${middleNote.NOTE_NO eq 12}"> checked </c:if> </c:forEach>/> 
			<br>
			<br>
			<label for="spice"><img style="clip-path: circle(50% at 50% 50%);" alt="spice" src="/resources/img/note/spice.jpg"> 
			<br>
			spice
			</label>
		</div>
	</div>
	
	<hr>
	
	<h4>Base Notes</h4>
	<hr style="margin: 5px;">
	<br>
	<div class="filter-container">
		<div style="margin: 0 auto;">
			<input type="checkbox" id="leather" value= 13 class="filter-item"
			name="noteNo" <c:forEach items="${baseNote }" var="baseNote"> <c:if test="${baseNote.NOTE_NO eq 13}"> checked </c:if> </c:forEach>/>
			<br>
			<br>
			<label for="leather"><img style="clip-path: circle(50% at 50% 50%);" alt="leather" src="/resources/img/note/leather.jpg">
			<br>
			leather
			</label>
		</div>
		<div style="margin: 0 auto;">
			<input type="checkbox" id="vanilla" value= 14 class="filter-item"
			name="noteNo" <c:forEach items="${baseNote }" var="baseNote"> <c:if test="${baseNote.NOTE_NO eq 14}"> checked </c:if> </c:forEach>/>
			<br>
			<br>
			<label for="vanilla"><img style="clip-path: circle(50% at 50% 50%);" alt="vanilla" src="/resources/img/note/vanilla.jpg">
			<br>
			vanilla
			</label>
		</div>
		<div style="margin: 0 auto;">
			<input type="checkbox" id="chocolate" value= 15 class="filter-item"
			name="noteNo" <c:forEach items="${baseNote }" var="baseNote"> <c:if test="${baseNote.NOTE_NO eq 15}"> checked </c:if> </c:forEach>/>
			<br>
			<br>
			<label for="chocolate"><img style="clip-path: circle(50% at 50% 50%);" alt="chocolate" src="/resources/img/note/chocolate.jpg">
			<br>
			chocolate
			</label>
		</div>
	</div>
	<br>
	<br>
	<div class="filter-container">
		<div style="margin: 0 auto;">
			<input type="checkbox" id="wood" value= 16 class="filter-item"
			name="noteNo" <c:forEach items="${baseNote }" var="baseNote"> <c:if test="${baseNote.NOTE_NO eq 16}"> checked </c:if> </c:forEach>/> 
			<br>
			<br>
			<label for="wood">
			<img style="clip-path: circle(50% at 50% 50%);" alt="wood" src="/resources/img/note/wood.jpg">
			<br>
			wood
			</label>
		</div>
		<div style="margin: 0 auto;">
			<input type="checkbox" id="earth" value= 17 class="filter-item"
			name="noteNo" <c:forEach items="${baseNote }" var="baseNote"> <c:if test="${baseNote.NOTE_NO eq 17}"> checked </c:if> </c:forEach>/> 
			<br>
			<br>
			<label for="earth"><img style="clip-path: circle(50% at 50% 50%);" alt="earth" src="/resources/img/note/earth.jpg">
			<br>
			earth
			</label>
		</div>
		<div style="margin: 0 auto;">
			<input type="checkbox" id="musk" value= 18 class="filter-item"
			name="noteNo" <c:forEach items="${baseNote }" var="baseNote"> <c:if test="${baseNote.NOTE_NO eq 18}"> checked </c:if> </c:forEach>/>
			<br>
			<br>
			<label for="musk"><img style="clip-path: circle(50% at 50% 50%);" alt="musk" src="/resources/img/note/musk.jpg">
			<br>
			musk
			</label>
		</div>
	</div>

	<hr>
	<input type="text" name = "perfumeNo" value = ${perf.PERFUME_NO } readonly style="display: none;"/>
	<input type="text" name = "fileNo" value = ${perf.FILE_NO } readonly style="display: none;"/>
	<button id="btnWrite" type="button">향수 수정</button> <button id = "btnCancel" type="button">수정 취소</button>
</form>

</div>
<br>
<c:import url="/WEB-INF/views/layout/footer.jsp" />