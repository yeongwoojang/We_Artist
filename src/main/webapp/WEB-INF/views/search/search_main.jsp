<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/include/topMenuHead.jsp"%>
<!DOCTYPE html>
<html>
    
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Montserrat:300,400,500,600,700" rel="stylesheet">
<link href="/resources/Rapid/assets/vendor/aos/aos.css" rel="stylesheet">
<link href="/resources/Rapid/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
<link href="/resources/Rapid/assets/vendor/aos/aos.css" rel="stylesheet">
<link href="/resources/Rapid/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/Rapid/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="/resources/Rapid/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">

 

<link href="/resources/Rapid/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
<style>

</style>
</head>
<body>
<section id="portfolio" class="portfolio section-bg">
      <div class="container aos-init aos-animate" data-aos="fade-up">
      	<div class="input-group border rounded-pill  p-2">
 		 <span class="input-group-text bg-transparent border border-0"><i class="fas fa-search"></i></span>
 			 <input type="text" class="form-control border border-0 shadow-none" style="outline:none">
		</div>

        <div class="row aos-init aos-animate" data-aos="fade-up" data-aos-delay="100">
          <div class="col-lg-12">
            <ul id="portfolio-flters">
              <li data-filter="*" class="filter-active fs-4">All</li>
              <li data-filter=".filter-app" class="fs-4">App</li>
              <li data-filter=".filter-card" class="fs-4">Card</li>
              <li data-filter=".filter-web" class="fs-4">Web</li>
            </ul>
          </div>
        </div>

        <div class="row portfolio-container aos-init aos-animate" data-aos="fade-up" data-aos-delay="200" style="position: relative; height: 1267.89px;">

          <div class="col-lg-4 col-md-6 portfolio-item filter-app" style="position: absolute; left: 0px; top: 0px;">
            <div class="portfolio-wrap">
              <img src="/resources/Rapid/assets/img/portfolio/app1.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4><a href="portfolio-details.html">App 1</a></h4>
                <p>App</p>
                <div>
                  <a href="/resources/Rapid/assets/img/portfolio/app1.jpg" data-gallery="portfolioGallery" title="App 1" class="link-preview portfolio-lightbox"><i class="bi bi-plus"></i></a>
                  <a href="portfolio-details.html" class="link-details" title="More Details"><i class="bi bi-link"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-web" data-wow-delay="0.1s" style="position: absolute; left: 439.987px; top: 0px;">
            <div class="portfolio-wrap">
              <img src="/resources/Rapid/assets/img/portfolio/web3.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4><a href="portfolio-details.html">Web 3</a></h4>
                <p>Web</p>
                <div>
                  <a href="/resources/Rapid/assets/img/portfolio/web3.jpg" class="link-preview portfolio-lightbox" data-gallery="portfolioGallery" title="Web 3"><i class="bi bi-plus"></i></a>
                  <a href="portfolio-details.html" class="link-details" title="More Details"><i class="bi bi-link"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-app" data-wow-delay="0.2s" style="position: absolute; left: 879.974px; top: 0px;">
            <div class="portfolio-wrap">
              <img src="/resources/Rapid/assets/img/portfolio/app2.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4><a href="portfolio-details.html">App 2</a></h4>
                <p>App</p>
                <div>
                  <a href="/resources/Rapid/assets/img/portfolio/app2.jpg" class="link-preview portfolio-lightbox" data-gallery="portfolioGallery" title="App 2"><i class="bi bi-plus"></i></a>
                  <a href="portfolio-details.html" class="link-details" title="More Details"><i class="bi bi-link"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-card" style="position: absolute; left: 879.974px; top: 263.988px;">
            <div class="portfolio-wrap">
              <img src="/resources/Rapid/assets/img/portfolio/card2.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4><a href="portfolio-details.html">Card 2</a></h4>
                <p>Card</p>
                <div>
                  <a href="/resources/Rapid/assets/img/portfolio/card2.jpg" class="link-preview portfolio-lightbox" data-gallery="portfolioGallery" title="Card 2"><i class="bi bi-plus"></i></a>
                  <a href="portfolio-details.html" class="link-details" title="More Details"><i class="bi bi-link"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-web" data-wow-delay="0.1s" style="position: absolute; left: 439.987px; top: 308.913px;">
            <div class="portfolio-wrap">
              <img src="/resources/Rapid/assets/img/portfolio/web2.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4><a href="portfolio-details.html">Web 2</a></h4>
                <p>Web</p>
                <div>
                  <a href="/resources/Rapid/assets/img/portfolio/web2.jpg" class="link-preview portfolio-lightbox" data-gallery="portfolioGallery" title="Web 2"><i class="bi bi-plus"></i></a>
                  <a href="portfolio-details.html" class="link-details" title="More Details"><i class="bi bi-link"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-app" data-wow-delay="0.2s" style="position: absolute; left: 0px; top: 451.7px;">
            <div class="portfolio-wrap">
              <img src="/resources/Rapid/assets/img/portfolio/app3.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4><a href="portfolio-details.html">App 3</a></h4>
                <p>App</p>
                <div>
                  <a href="/resources/Rapid/assets/img/portfolio/app3.jpg" class="link-preview portfolio-lightbox" data-gallery="portfolioGallery" title="App 3"><i class="bi bi-plus"></i></a>
                  <a href="portfolio-details.html" class="link-details" title="More Details"><i class="bi bi-link"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-card" style="position: absolute; left: 0px; top: 756.762px;">
            <div class="portfolio-wrap">
              <img src="/resources/Rapid/assets/img/portfolio/card1.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4><a href="portfolio-details.html">Card 1</a></h4>
                <p>Card</p>
                <div>
                  <a href="/resources/Rapid/assets/img/portfolio/card1.jpg" class="link-preview portfolio-lightbox" data-gallery="portfolioGallery" title="Card 1"><i class="bi bi-plus"></i></a>
                  <a href="portfolio-details.html" class="link-details" title="More Details"><i class="bi bi-link"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-card" data-wow-delay="0.1s" style="position: absolute; left: 879.974px; top: 912.576px;">
            <div class="portfolio-wrap">
              <img src="/resources/Rapid/assets/img/portfolio/card3.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4><a href="portfolio-details.html">Card 3</a></h4>
                <p>Card</p>
                <div>
                  <a href="/resources/Rapid/assets/img/portfolio/card3.jpg" class="link-preview portfolio-lightbox" data-gallery="portfolioGallery" title="Card 3"><i class="bi bi-plus"></i></a>
                  <a href="portfolio-details.html" class="link-details" title="More Details"><i class="bi bi-link"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-web" data-wow-delay="0.2s" style="position: absolute; left: 439.987px; top: 960.738px;">
            <div class="portfolio-wrap">
              <img src="/resources/Rapid/assets/img/portfolio/web1.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4><a href="portfolio-details.html">Web 1</a></h4>
                <p>Web</p>
                <div>
                  <a href="/resources/Rapid/assets/img/portfolio/web1.jpg" class="link-preview portfolio-lightbox" data-gallery="portfolioGallery" title="Web 1"><i class="bi bi-plus"></i></a>
                  <a href="portfolio-details.html" class="link-details" title="More Details"><i class="bi bi-link"></i></a>
                </div>
              </div>
            </div>
          </div>

        </div>

      </div>
    </section>
    <script src="/resources/Rapid/assets/vendor/aos/aos.js"></script>
    <script src="/resources/Rapid/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/Rapid/assets/vendor/glightbox/js/glightbox.min.js"></script>
    <script src="/resources/Rapid/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
    <script src="/resources/Rapid/assets/vendor/php-email-form/validate.js"></script>
    <script src="/resources/Rapid/assets/vendor/purecounter/purecounter.js"></script>
    <script src="/resources/Rapid/assets/vendor/swiper/swiper-bundle.min.js"></script>
    <script src="/resources/Rapid/assets/js/main.js"></script>
</body>
</html>