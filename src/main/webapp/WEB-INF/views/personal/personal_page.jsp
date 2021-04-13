<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/topMenuHead.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.min.js"></script> <!-- socjJS CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script> <!-- STOMP CDN -->

<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Montserrat:300,400,500,600,700" rel="stylesheet">
</head>

<body id="body">
<main id="main" class="main-page">

    <!-- ======= Speaker Details Sectionn ======= -->
    <section id="speakers-details">
      <div class="container">
        <div class="section-header">
          <h2>Speaker Details</h2>
          <p>Praesentium ut qui possimus sapiente nulla.</p>
        </div>

        <div class="row">
          <div class="col-md-6">
            <img src="${context}/resources/img/dummy_img.png" alt="Speaker 1" class="img-fluid">
          </div>

          <div class="col-md-6">
            <div class="details">
              <h2>${personalUserInfo.nickName}</h2>
              <div class="social">
                <a href="/personal/personalprivate"><i class="fas fa-user-circle fs-3"></i></a>
                <a href=""><i class="fas fa-sms fs-3"></i></a>
                <a href=""><i class="fas fa-heart fs-3"></i></a>
              </div>
            </div>
          </div>

        </div>
      </div>
      
      </section>
      <section id="hotels" class="section-with-bg">
      <div class="container aos-init aos-animate" data-aos="fade-up">
        <div class="section-header">
          <h2>Hotels</h2>
          <p>Her are some nearby hotels</p>
        </div>

        <div class="row aos-init aos-animate" data-aos="fade-up" data-aos-delay="100">

          <div class="col-lg-4 col-md-6">
            <div class="hotel">
              <div class="hotel-img">
               <a href="/resources/theEvent/assets/img/venue-gallery/1.jpg" class="glightbox" data-gall="venue-gallery">
                <img src="/resources/theEvent/assets/img/venue-gallery/1.jpg" alt="" class="img-fluid">
              </a>
              </div>
                <h3 class="mt-3"><a href="#">게시물 이름</a></h3>
              <p>게시물 설명</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6">
            <div class="hotel">
              <div class="hotel-img">
               <a href="/resources/theEvent/assets/img/venue-gallery/1.jpg" class="glightbox" data-gall="venue-gallery">
                <img src="/resources/theEvent/assets/img/venue-gallery/1.jpg" alt="" class="img-fluid">
              </a>
              </div>
               <h3 class="mt-3"><a href="#">게시물 이름</a></h3>
              <p>게시물 설명</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6">
            <div class="hotel">
              <div class="hotel-img">
                <a href="/resources/theEvent/assets/img/venue-gallery/1.jpg" class="glightbox" data-gall="venue-gallery">
                <img src="/resources/theEvent/assets/img/venue-gallery/1.jpg" alt="" class="img-fluid">
              </a>
              </div>
               <h3 class="mt-3"><a href="#">게시물 이름</a></h3>
              <p>게시물 설명</p>
            </div>
          </div>

        </div>
           <div class="row aos-init aos-animate" data-aos="fade-up" data-aos-delay="100">

          <div class="col-lg-4 col-md-6">
            <div class="hotel">
              <div class="hotel-img">
               <a href="/resources/theEvent/assets/img/venue-gallery/1.jpg" class="glightbox" data-gall="venue-gallery">
                <img src="/resources/theEvent/assets/img/venue-gallery/1.jpg" alt="" class="img-fluid">
              </a>
              </div>
               <h3 class="mt-3"><a href="#">게시물 이름</a></h3>
              <p>게시물 설명</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6">
            <div class="hotel">
              <div class="hotel-img">
                 <a href="/resources/theEvent/assets/img/venue-gallery/1.jpg" class="glightbox" data-gall="venue-gallery">
                <img src="/resources/theEvent/assets/img/venue-gallery/1.jpg" alt="" class="img-fluid">
              </a>
              </div>
               <h3 class="mt-3"><a href="#">게시물 이름</a></h3>
              <p>게시물 설명</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6">
            <div class="hotel">
              <div class="hotel-img">
                <a href="/resources/theEvent/assets/img/venue-gallery/1.jpg" class="glightbox" data-gall="venue-gallery">
                <img src="/resources/theEvent/assets/img/venue-gallery/1.jpg" alt="" class="img-fluid">
              </a>
              </div>
               <h3 class="mt-3"><a href="#">게시물 이름</a></h3>
              <p>게시물 설명</p>
            </div>
          </div>

        </div>
           <div class="row aos-init aos-animate" data-aos="fade-up" data-aos-delay="100">

          <div class="col-lg-4 col-md-6">
            <div class="hotel">
              <div class="hotel-img">
                <a href="/resources/theEvent/assets/img/venue-gallery/1.jpg" class="glightbox" data-gall="venue-gallery">
                <img src="/resources/theEvent/assets/img/venue-gallery/1.jpg" alt="" class="img-fluid">
              </a>
              </div>
               <h3 class="mt-3"><a href="#">게시물 이름</a></h3>
              <p>게시물 설명</p>
            </div>
          </div>

         <div class="col-lg-4 col-md-6">
            <div class="hotel">
              <div class="hotel-img">
               <a href="/resources/theEvent/assets/img/venue-gallery/1.jpg" class="glightbox" data-gall="venue-gallery">
                <img src="/resources/theEvent/assets/img/venue-gallery/1.jpg" alt="" class="img-fluid">
              </a>
              </div>
               <h3 class="mt-3"><a href="#">게시물 이름</a></h3>
              <p>게시물 설명</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6">
            <div class="hotel">
              <div class="hotel-img">
                <a href="/resources/theEvent/assets/img/venue-gallery/1.jpg" class="glightbox" data-gall="venue-gallery">
                <img src="/resources/theEvent/assets/img/venue-gallery/1.jpg" alt="" class="img-fluid">
              </a>
              </div>
               <h3 class="mt-3"><a href="#">게시물 이름</a></h3>
              <p>게시물 설명</p>
            </div>
          </div>

        </div>
           <div class="row aos-init aos-animate" data-aos="fade-up" data-aos-delay="100">

          <div class="col-lg-4 col-md-6">
            <div class="hotel">
              <div class="hotel-img">
                 <a href="/resources/theEvent/assets/img/venue-gallery/1.jpg" class="glightbox" data-gall="venue-gallery">
                <img src="/resources/theEvent/assets/img/venue-gallery/1.jpg" alt="" class="img-fluid">
              </a>
              </div>
               <h3 class="mt-3"><a href="#">게시물 이름</a></h3>
              <p>게시물 설명</p>
            </div>
          </div>

         <div class="col-lg-4 col-md-6">
            <div class="hotel">
              <div class="hotel-img">
                 <a href="/resources/theEvent/assets/img/venue-gallery/1.jpg" class="glightbox" data-gall="venue-gallery">
                <img src="/resources/theEvent/assets/img/venue-gallery/1.jpg" alt="" class="img-fluid">
              </a>
              </div>
               <h3 class="mt-3"><a href="#">게시물 이름</a></h3>
              <p>게시물 설명</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6">
            <div class="hotel">
              <div class="hotel-img">
                <a href="/resources/theEvent/assets/img/venue-gallery/1.jpg" class="glightbox" data-gall="venue-gallery">
                <img src="/resources/theEvent/assets/img/venue-gallery/1.jpg" alt="" class="img-fluid">
              </a>
              </div>
               <h3 class="mt-3"><a href="#">게시물 이름</a></h3>
              <p>게시물 설명</p>
            </div>
          </div>

        </div>
           <div class="row aos-init aos-animate" data-aos="fade-up" data-aos-delay="100">

         <div class="col-lg-4 col-md-6">
            <div class="hotel">
              <div class="hotel-img">
                <a href="/resources/theEvent/assets/img/venue-gallery/1.jpg" class="glightbox" data-gall="venue-gallery">
                <img src="/resources/theEvent/assets/img/venue-gallery/1.jpg" alt="" class="img-fluid">
              </a>
              </div>
               <h3 class="mt-3"><a href="#">게시물 이름</a></h3>
              <p>게시물 설명</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6">
            <div class="hotel">
              <div class="hotel-img">
                <a href="/resources/theEvent/assets/img/venue-gallery/1.jpg" class="glightbox" data-gall="venue-gallery">
                <img src="/resources/theEvent/assets/img/venue-gallery/1.jpg" alt="" class="img-fluid">
              </a>
              </div>
               <h3 class="mt-3"><a href="#">게시물 이름</a></h3>
              <p>게시물 설명</p>
            </div>
          </div>

         <div class="col-lg-4 col-md-6">
            <div class="hotel">
              <div class="venue-gallery">
                <a href="/resources/theEvent/assets/img/venue-gallery/1.jpg" class="glightbox" data-gall="venue-gallery">
                <img src="/resources/theEvent/assets/img/venue-gallery/1.jpg" alt="" class="img-fluid">
              </a>
              </div>
               <h3 class="mt-3"><a href="#">게시물 이름</a></h3>
              <p>게시물 설명</p>
            </div>
          </div>

        </div>
           <div class="row aos-init aos-animate" data-aos="fade-up" data-aos-delay="100">

         <div class="col-lg-4 col-md-6">
            <div class="hotel">
              <div class="venue-gallery">
                <a href="/resources/theEvent/assets/img/venue-gallery/1.jpg" class="glightbox" data-gall="venue-gallery">
                <img src="/resources/theEvent/assets/img/venue-gallery/1.jpg" alt="" class="img-fluid">
              </a>
              </div>
               <h3 class="mt-3"><a href="#">게시물 이름</a></h3>
              <p>게시물 설명</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6">
            <div class="hotel">
              <div class="venue-gallery">
               <a href="/resources/theEvent/assets/img/venue-gallery/1.jpg" class="glightbox" data-gall="venue-gallery">
                <img src="/resources/theEvent/assets/img/venue-gallery/1.jpg" alt="" class="img-fluid">
              </a>
              </div>
               <h3 class="mt-3"><a href="#">게시물 이름</a></h3>
              <p>게시물 설명</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6">
            <div class="hotel">
              <div class="hotel-img">
                 <a href="/resources/theEvent/assets/img/venue-gallery/1.jpg" class="glightbox" data-gall="venue-gallery">
                <img src="/resources/theEvent/assets/img/venue-gallery/1.jpg" alt="" class="img-fluid">
              </a>
              </div>
               <h3 class="mt-3"><a href="#">게시물 이름</a></h3>
              <p>게시물 설명</p>
            </div>
          </div>
        </div>
      </div>
      </section>
      
  </main>
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
    	<button type="btn" class="btn btn-primary" onclick="onOff();">onOff</button>
  </footer>
  
  
<!-- 	  	<div data-aos-easing="ease-in-out" class="card position-fixed top-50 start-50 translate-middle gscrollbar-fixer glightbox-open" data-aos-delay="0" data-aos-duration="1000"> -->
<!-- 	  		<img src="/resources/theEvent/assets/img/venue-gallery/1.jpg" class="card-img-top" alt="..."> -->
<!-- 	  		<div class="card-body"> -->
<!-- 	  			<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p> -->
<!-- 	  		</div> -->
<!-- 	  	</div> -->
  
  
  
  <script src="${context}/resources/theEvent/assets/vendor/aos/aos.js"></script>
  <script src="${context}/resources/theEvent/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${context}/resources/theEvent/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="${context}/resources/theEvent/assets/vendor/php-email-form/validate.js"></script>
  <script src="${context}/resources/theEvent/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="${context}/resources/theEvent/assets/js/main.js"></script>
  
  
  <script type="text/javascript">
  	function onOff(){
  	}
  </script>
</body>
</html>