<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/topMenuHead.jsp"%>

<section id="speakers">
	<input type="file" id="upload">
	<button onclick="imgToBlob('#preview','#preview2')">전환</button>
	<img alt="" src="" id="preview" style="width: 300px; height: 300px;">
	<img alt="" src="" id="preview2" style="width: 300px; height: 300px;">
</section>

<script type="text/javascript" src="/resources/js/gallery/load-image.all.min.js"></script>
<script type="text/javascript" src="/resources/js/gallery/rotationImg.js"></script>
</body>
</html>