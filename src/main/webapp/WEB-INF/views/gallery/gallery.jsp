<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/topMenuHead.jsp"%>
	<section id="hero">
	    <div class="hero-container middle" data-aos="zoom-in" data-aos-delay="100">

	   
	    <div class="d-none" style="width: 600px; background-color: rgba(0,0,0,0.8)" id="divTest">
		  <img class="card-img-top" src="" alt="Card image cap" id="imgInfo">
		  <div class="card-body">
		    <p class="card-text" id="imgTitle">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
		    <div id="btn_back" class="btn btn-dark text-white">Back</div>
		  </div>
		</div>
	   </div>
	 </section>
	  <!-- End Hero Section -->
	<div id="userGalleryList" class="d-none">
		<c:forEach items="${galleryList}" var="item" varStatus="status">
			<div id="Cube003_${item.imgOrder}"
				data-title="${item.title}"
				data-content="${item.content}"
				data-path="${item.path}">
			</div>
		</c:forEach>
	</div>
	
	<script src="https://threejs.org/build/three.min.js"></script>
	<script src="${context}/resources/js/gallery/OrbitControls.js"></script>
	<script src="${context}/resources/js/gallery/GLTFLoader.js"></script>
	<script src="${context}/resources/js/gallery/load-image.all.min.js"></script>
	<script src="${context}/resources/js/gallery/rotationImg.js"></script>
	<script type='module' src="${context}/resources/js/gallery/ShowGallery.js"></script>
</body>
</html>