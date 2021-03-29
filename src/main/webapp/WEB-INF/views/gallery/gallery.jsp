<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/topMenuHead.jsp"%>
	<section id="hero">
	    <div class="hero-container middle" data-aos="zoom-in" data-aos-delay="100">
	    	<div class="d-none" id="divTest">
	    		<h1 id="imgID"></h1>
	    		<img alt="" src="" id="imgInfo"style="width: 500px; height: 400px;">
	    		<button id="btn_back">Back</button>
	    	</div>
	    </div>
	 </section>
	  <!-- End Hero Section -->
	<script src="https://threejs.org/build/three.min.js"></script>
	<script src="/resources/js/gallery/OrbitControls.js"></script>
	<script src="/resources/js/gallery/GLTFLoader.js"></script>
	<script type='module' src="/resources/js/gallery/ShowGallery.js"></script>
</body>
</html>