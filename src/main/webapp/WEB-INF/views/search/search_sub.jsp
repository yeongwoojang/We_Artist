<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/include/topMenuHead.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section id="venue">

      <div class="container-fluid aos-init aos-animate" data-aos="fade-up">

        <div class="section-header">
            <div class="container">
        		<div class="input-group border rounded-pill  p-2">
 					<span class="input-group-text bg-transparent border border-0"><i class="fas fa-search"></i></span>
 						 <input id ="search_box"type="text" class="form-control border border-0 shadow-none" placeholder="태그를 검색하세요"style="outline:none" onKeyPress="if( event.keyCode==13 ){searchByTag();}">
				</div>
        	</div>
        	<div class="p-3">
        		<h2>We are Artist</h2>
        		<p>컷</p>
        	</div>
        	
        </div>
    
		
      </div>

      <div class="container-fluid venue-gallery-container aos-init aos-animate" data-aos="fade-up" data-aos-delay="100">
        <div class="row g-0">
			
			<c:forEach var="image" items="${imageList}" varStatus="status">
				 <div class="col-lg-3 col-md-4">
            		<div class="venue-gallery image_item" data-imagelink ="${image.fSavePath}/${image.fRename}" data-fidx = "${image.fIdx}">
                			<img src=<c:url value="/images/${image.fSavePath}/${image.fRename}"/> alt="" class="img-fluid">
            		</div>
          		</div>	
			</c:forEach>
        </div>
      </div>

    </section>
    <footer id="footer">
    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-3 col-md-6 footer-info">
            <img src="assets/img/logo.png" alt="TheEvenet">
            <p>In alias aperiam. Placeat tempore facere. Officiis voluptate ipsam vel eveniet est dolor et totam porro. Perspiciatis ad omnis fugit molestiae recusandae possimus. Aut consectetur id quis. In inventore consequatur ad voluptate cupiditate debitis accusamus repellat cumque.</p>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>Useful Links</h4>
            <ul>
              <li><i class="bi bi-chevron-right"></i> <a href="#">Home</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="#">About us</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="#">Services</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="#">Terms of service</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="#">Privacy policy</a></li>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>Useful Links</h4>
            <ul>
              <li><i class="bi bi-chevron-right"></i> <a href="#">Home</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="#">About us</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="#">Services</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="#">Terms of service</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="#">Privacy policy</a></li>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-contact">
            <h4>Contact Us</h4>
            <p>
              A108 Adam Street <br>
              New York, NY 535022<br>
              United States <br>
              <strong>Phone:</strong> +1 5589 55488 55<br>
              <strong>Email:</strong> info@example.com<br>
            </p>

            <div class="social-links">
              <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
              <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
              <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
              <a href="#" class="google-plus"><i class="bi bi-instagram"></i></a>
              <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
            </div>

          </div>

        </div>
      </div>
    </div>

    <div class="container">
      <div class="copyright">
        © Copyright <strong>TheEvent</strong>. All Rights Reserved
      </div>
      <div class="credits">
        <!--
        All the links in the footer should remain intact.
        You can delete the links only if you purchased the pro version.
        Licensing information: https://bootstrapmade.com/license/
        Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=TheEvent
      -->
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
    </div>
  </footer>
  		 <!-- Modal --> 
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<p id="btn_modal_close"class="float-end text-white fs-1 mt-2 mr-1" style="cursor: pointer;"><i class="fas fa-times"></i></p>
	<button class="carousel-control-prev position-absolute top-50 start-0 translate-middle-y" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev" style="z-index:9999; height:10vh;">
    	<span class="carousel-control-prev-icon primary" aria-hidden="true"></span>
    	<span class="visually-hidden">Previous</span>
  	</button>
  	<button class="carousel-control-next position-absolute top-50 end-0 translate-middle-y" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next" style="z-index:9999;height:10vh;">
    	<span class="carousel-control-next-icon" aria-hidden="true"></span>
    	<span class="visually-hidden">Next</span>
  	</button>
  <div class="modal-dialog modal-xl" id="myModal">
    <div class="modal-content">
    	<div class="row g-0">
       		<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
       			<div class="carousel-inner">
       					<!-- 동적으로 데이터를 받아서 뿌려줄 부분 -->
  				</div>
			</div>
    	</div>
  	  </div>
  </div>
</div>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center active"><i class="fas fa-arrow-up"></i></a>
  <script>
  
  let imageList = new Array();
  let imageObj
  <c:forEach var="image" items="${imageList}" varStatus="status">
  	imageObj = new Object();
  	imageObj.fIdx =  "${image.fIdx}";
  	imageObj.fOrigin = "${image.fOrigin}";
  	imageObj.fRename = "${image.fRename}";
  	imageObj.fDate = "${image.fDate}";
  	imageObj.userId = "${image.userId}";
  	imageObj.fSavePath = "${image.fSavePath}";
  	imageObj.isDel = "${image.isDel}";
  	imageList.push(imageObj);
  </c:forEach>
  
 

	let imageItemList = document.querySelectorAll('.image_item');
	for(let i=0;i<imageItemList.length; i++){
		imageItemList[i].addEventListener('click',(e)=>{
			console.dir(imageItemList[i].dataset.fidx);
			showModal(imageItemList[i].dataset.imagelink,imageItemList[i].dataset.fidx);
		});
	}
	
 	 function showModal(imageLink,fIdx){
 	  let index = 0;
 	  let slideSequence = new Array();
 	  let carouselInne;
 	  carouselInner = document.querySelector(".carousel-inner");
	  for(let i = 0; i< imageList.length; i++){
		  let carouselItem = document.createElement("div");
		  let img = document.createElement("img");
		  img.setAttribute("class","d-block w-100 img-fluid");
		  img.src = "/images/"+imageList[i].fSavePath+"/"+imageList[i].fRename;
//		  img.style="width:100%;height:100%;object-fit:cover;";
		  carouselItem.appendChild(img);
		  
		  if(fIdx==imageList[i].fIdx){
				carouselItem.setAttribute("class","carousel-item active");
			  slideSequence[index] = carouselItem;
			  index++;
		  }else{
				carouselItem.setAttribute("class","carousel-item");
				if(i==0){
				  slideSequence[imageList.length-1] = carouselItem;
				}else{
					
				}
		  }
		  
				
	  }
	  	for(let i = 0; i <slideSequence.length; i++){
	  		carouselInner.appendChild(slideSequence[i]);
	  	}
	  
		$('#exampleModal').modal("show");
	}


  </script>
  
  
  
  
  <script src="${context}/resources/js/search/search_main.js"></script>
    <script src="${context}/resources/theEvent/assets/vendor/aos/aos.js"></script>
  <script src="${context}/resources/theEvent/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${context}/resources/theEvent/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="${context}/resources/theEvent/assets/vendor/php-email-form/validate.js"></script>
  <script src="${context}/resources/theEvent/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="${context}/resources/theEvent/assets/js/main.js"></script>
</body>
</html>