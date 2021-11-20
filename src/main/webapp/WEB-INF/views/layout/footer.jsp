<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<footer class="footer">
<hr class="hrMenu">
<c:if test="true"><%-- 관리자 로그인 상태일 때 --%>
<div class="logo"><span style="vertical-align: middle; cursor: pointer;" onclick="location.href='/admin';"><small>관리자 로그인 상태</small></span></div>
<div class="menu">
	<a href="/admin/notice/list"><button class="btn btnHeader">NOTICE</button></a>
	<a href="/admin/faq/list"><button class="btn btnHeader">FAQ</button></a>
	<a href="/admin/extagram/list"><button class="btn btnHeader">EXTAGRAM</button></a>
	<a href="/admin/perf/list"><button class="btn btnHeader">PERFUME</button></a>
	<a href="/admin/layer/list"><button class="btn btnHeader">LAYER</button></a>
	<a href="#"><button class="btn btnHeader">REPORT</button></a>
</div>
</c:if>
<c:if test="false"><%-- 관리자 로그인 상태가 아닐 때 --%>
<div style="font-size: 15px; margin: 5px;">
	이용약관 | 위치기반서비스이용약관 | 개인정보처리방침 | 운영정책 | Contact us<br>
	&copy; 2021 향기좋조 all rights reserved.
</div>
</c:if>
</footer>

</div><%-- .wrap --%>
</body>
</html>