<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />


<script type="text/javascript">
$(document).ready(function(){
	$("#btnWrite").click(function(){
		console.log("등록 클릭");
			
		if (confirm("등록 하시겠습니까?")) {
			var p1 = document.getElementById('file').value;
			var p2 = document.getElementById('perfName').value;
			var p3 = document.getElementById('brandNo').value;
			var p4 = document.getElementById('perfumeGender').value;
			var p5 = document.getElementById('perfumeVitality').value;
			var p6 = document.getElementsByName('noteNo').value;
			
			if (p1 == "" || p2 == ""|| p3 == 0 || p4 == 0 || p5 == 0) {
		         alert('필수항목 누락')
		         return false;
			}else{
				$("form").submit();
			}
		}else{
			return false;
		}
	})
	$("#btnCancel").click(function(){
		history.go(-1);
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

</style>



<div class="container" style="text-align: center;">
<h1>신규 향수 등록</h1>

<hr>

<form action="/admin/perf/write" method="post" enctype="multipart/form-data">
	
	<div>
		<label for="file">이미지 등록</label>
		<input type="file" id="file" name="file" />
	</div>
	
	<div>
		<span>향수 이름 : </span></label>
		<input type="text" id="perfName" name="perfumeName" placeholder="향수명을 입력해주세요"/>
	</div>
	<br>
	<div>
		<span>브랜드 : </span>	
		<select id="brandNo" name="brandNo">      
			<option value=0 >선택없음</option>>
			<option value=1 >CHANEL</option>
			<option value=2 >JOMALONE</option>
			<option value=3 >GUCCI</option>
			<option value=4 >diptyque</option>
			<option value=5 >KENZO</option>
			<option value=6 >MONTBLANC</option>
			<option value=7 >BURBERRY</option>
			<option value=8 >DIOR</option>
			<option value=9 >BVLGARI</option>
		</select>
	</div>
	<br>
	<div>
		<span>대상 성별 : </span>	
		<select id="perfumeGender" name="perfumeGender">      
			<option value=0 >선택없음</option>>
			<option value=1 >female</option>
			<option value=2 >male</option>
			<option value=3 >unisex</option>
		</select>
	</div>
	<br>
	<div>
		<span>지속력 : </span>	
		<select id="perfumeVitality" name="perfumeVitality">      
			<option value=0 >선택없음</option>>
			<option value="parfum" >parfum</option>
			<option value="eau de parfum" >eau de parfum</option>
			<option value="eau de toilette" >eau de toilette</option>
			<option value="eau de cologne" >eau de cologne</option>
			<option value="shower cologne" >shower cologne</option>
		</select>
	</div>
	<br>
	<hr>
		<h4> Top Notes </h4>
	<hr style="margin: 5px;">
	<br>
	<div id="noteNo" class="filter-container">
		<div style="margin: 0 auto;">
			<input type="checkbox" id="clean" value= 1 class="filter-item"
			name="noteNo" />
			<br>
			<br>
			<label for="clean"><img style="clip-path: circle(50% at 50% 50%);" alt="clean" src="/resources/img/note/clean.jpg">
			<br> 
			clean
			</label>
		</div>
		<div style="margin: 0 auto;">
			<input type="checkbox" id="citrus" value= 2 class="filter-item"
			name="noteNo" />
			<br>
			<br>
			<label for="citrus"><img style="clip-path: circle(50% at 50% 50%);" alt="citrus" src="/resources/img/note/citrus.jpg">
			<br>
			citrus
			</label>
		</div>
		<div style="margin: 0 auto;">
			<input type="checkbox" id="water" value= 3 class="filter-item"
			name="noteNo" /> 
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
			name="noteNo" />
			<br>
			<br>
			<label for="creamy"><img style="clip-path: circle(50% at 50% 50%);" alt="creamy" src="/resources/img/note/creamy.jpg">
			<br>
			creamy
			</label>
		</div>
		<div style="margin: 0 auto;">
			<input type="checkbox" id="fruit" value= 5 class="filter-item"
			name="noteNo" /> 
			<br>
			<br>
			<label for="fruit"><img style="clip-path: circle(50% at 50% 50%);" alt="fruit" src="/resources/img/note/fruit.jpg">
			<br>
			fruit
			</label>
		</div >
		<div style="margin: 0 auto;">
			<input type="checkbox" id="aroma" value= 6 class="filter-item"
			name="noteNo" />
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
			name="noteNo" /> 
			<br>
			<br>
			<label for="green"><img style="clip-path: circle(50% at 50% 50%);" alt="green" src="/resources/img/note/green.jpg">
			<br>
			green
			</label>
		</div>
		<div style="margin: 0 auto;">
			<input type="checkbox" id="herbal" value= 8 class="filter-item"
			name="noteNo" />
			<br>
			<br>
			<label for="herbal"><img style="clip-path: circle(50% at 50% 50%);" alt="herbal" src="/resources/img/note/herbal.jpg">
			<br> 
			herbal
			</label>
		</div>
		<div style="margin: 0 auto;">
			<input type="checkbox" id="floral" value= 9 class="filter-item"
			name="noteNo" /> 
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
			name="noteNo" /> 
			<br>
			<br>
			<label for="smoke"><img style="clip-path: circle(50% at 50% 50%);" alt="smoke" src="/resources/img/note/smoke.jpg">
			<br>
			smoke
			</label>
		</div>
		<div style="margin: 0 auto;">
			<input type="checkbox" id="rose" value= 11 class="filter-item"
			name="noteNo" /> 
			<br>
			<br>
			<label for="rose"><img style="clip-path: circle(50% at 50% 50%);" alt="rose" src="/resources/img/note/rose.jpg">
			<br>
			rose
			</label>
		</div>
		<div style="margin: 0 auto;">
			<input type="checkbox" id="spice" value= 12 class="filter-item"
			name="noteNo" /> 
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
			name="noteNo" />
			<br>
			<br>
			<label for="leather"><img style="clip-path: circle(50% at 50% 50%);" alt="leather" src="/resources/img/note/leather.jpg">
			<br>
			leather
			</label>
		</div>
		<div style="margin: 0 auto;">
			<input type="checkbox" id="vanilla" value= 14 class="filter-item"
			name="noteNo" />
			<br>
			<br>
			<label for="vanilla"><img style="clip-path: circle(50% at 50% 50%);" alt="vanilla" src="/resources/img/note/vanilla.jpg">
			<br>
			vanilla
			</label>
		</div>
		<div style="margin: 0 auto;">
			<input type="checkbox" id="chocolate" value= 15 class="filter-item"
			name="noteNo" />
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
			name="noteNo" /> 
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
			name="noteNo" /> 
			<br>
			<br>
			<label for="earth"><img style="clip-path: circle(50% at 50% 50%);" alt="earth" src="/resources/img/note/earth.jpg">
			<br>
			earth
			</label>
		</div>
		<div style="margin: 0 auto;">
			<input type="checkbox" id="musk" value= 18 class="filter-item"
			name="noteNo" />
			<br>
			<br>
			<label for="musk"><img style="clip-path: circle(50% at 50% 50%);" alt="musk" src="/resources/img/note/musk.jpg">
			<br>
			musk
			</label>
		</div>
	</div>

	<hr>

	<button id="btnWrite" type="button">향수 등록</button> <button id = "btnCancel" type="button">등록 취소</button>
</form>

</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />