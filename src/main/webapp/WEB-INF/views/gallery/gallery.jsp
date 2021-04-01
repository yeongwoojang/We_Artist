<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/topMenuHead.jsp"%>
	<button onclick="sendImageTest()">click</button>
	<section id="hero">
	    <div class="hero-container middle" data-aos="zoom-in" data-aos-delay="100">
	    	<div class="d-none" id="divTest" style="background-color: rgba(0,0,0,0.8)">
	    		<div class="leftBox">
	    			<img alt="loading..." src="" id="imgInfo"style="width: 500px; height: 400px;">
	    		</div>
	    		<div class="rightBox d-inline-flex flex-column justify-content-between">
	    			<h1 class="title">TITLE</h1>
	    			<span>
	    				이곳은 내용이 들어갈곳
	    			</span>
	    			<span id="btn_back">Back</span>
	    		</div>
	    	</div>
	    </div>
	 </section>
	  <!-- End Hero Section -->
	
	<script src="https://threejs.org/build/three.min.js"></script>
	<script src="${context}/resources/js/gallery/OrbitControls.js"></script>
	<script src="${context}/resources/js/gallery/GLTFLoader.js"></script>
	<script src="${context}/resources/js/gallery/load-image.all.min.js"></script>
	<script src="${context}/resources/js/gallery/rotationImg.js"></script>
	<script type='module' src="${context}/resources/js/gallery/ShowGallery.js"></script>
</body>
</html>