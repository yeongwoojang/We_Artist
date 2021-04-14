<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/views/include/common_socket.jsp"%> <!-- Socket 연결 모듈 -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<title>We Artist!</title>
	
	<c:set var="context" value="${pageContext.request.contextPath}"/>
	<script type="text/javascript" src="${context}/resources/js/common/urlEncoder.js"></script>
	<script type="text/javascript" src="${context}/resources/js/common/asyncPageError.js"></script>
	
	
	<!-- Socket CDN추가 -->
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.min.js"></script> <!-- socjJS CDN -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script> <!-- STOMP CDN -->
	
	
	
	<!-- Google Fonts -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet">
  	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Raleway:300,400,500,700,800" rel="stylesheet">
	<!-- Vendor CSS Files -->
  	<link href="${context}/resources/theEvent/assets/vendor/aos/aos.css" rel="stylesheet">
  	<link href="${context}/resources/theEvent/assets/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
  	<link href="${context}/resources/theEvent/assets/vendor/bootstrap/css/bootstrap-icons.css" rel="stylesheet">
  	<link href="${context}/resources/theEvent/assets/vendor/glightbox/css/glightbox.css" rel="stylesheet">
  	<link href="${context}/resources/theEvent/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  	
  	<link href="${context}/resources/common/css/common.css" rel="stylesheet">
  	<!-- Template Main CSS File -->
  	<link href="${context}/resources/theEvent/assets/css/style.css" rel="stylesheet">
  	
  	<!-- Vendor JS Files -->
	<script src="${context}/resources/theEvent/assets/vendor/aos/aos.js"></script>
	<script src="${context}/resources/theEvent/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
	<script src="${context}/resources/theEvent/assets/vendor/glightbox/js/glightbox.js"></script>
	<script src="${context}/resources/theEvent/assets/vendor/swiper/swiper-bundle.min.js"></script>
	
	
	<!-- Template Main JS File -->
	<script src="${context}/resources/theEvent/assets/js/main.js"></script>
	<!-- fontAwsome -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" rel="stylesheet"/>
	
	<!-- 검색 자동완성 js파일 -->
	<script src="${context}/resources/js/common/autoSearch.js"></script>
<style>
/* 	html,body{ */
/* 		width:100%; */
/* 		height:100%; */
/* 	} */
</style>
</head>
<body>
	<!-- ======= Header ======= -->
  	<header id="header" class="d-flex align-items-center">
    	<div class="container-fluid d-flex align-items-center justify-content-around">
	      <div id="logo">
	        <!-- Uncomment below if you prefer to use a text logo -->
	        <!-- <h1><a href="index.html">The<span>Event</span></a></h1>-->
	        <a href="${context}/index" class="scrollto fs-2 text-white" style="text-decoration:none;">We Artist</a>
	      </div>
<!-- <img src="/resources/theEvent/assets/img/logo.png" alt="" title=""> -->
		
	      <nav id="navbar" class="navbar order-last order-lg-0 d-flex justify-content-end" style="width:70%;">
	        <ul>
	          <li><a class="nav-link scrollto active fs-4" href="#" style="font-family: 'Open Sans', sans-serif;">Home</a></li>
	          <li><a class="nav-link scrollto fs-5" href="${context}/gallery" style="font-family: 'Open Sans', sans-serif;">Gallery</a></li>
	          <li><a class="nav-link scrollto fs-5" href="#" style="font-family: 'Open Sans', sans-serif;">Mypage</a></li>
	          <li><a class="nav-link scrollto fs-5" href="${context}/user/profile" style="font-family: 'Open Sans', sans-serif;">프로필</a></li>
	          <li><a class="nav-link scrollto fs-5" href="${context}/user/login" style="font-family: 'Open Sans', sans-serif;">로그인</a></li>
	          <li><a class="nav-link scrollto fs-5" href="${context}/user/join" style="font-family: 'Open Sans', sans-serif;">회원가입</a></li>
	          <li>
	          <div class="input-group border rounded-pill p-2">
	    			<span class="input-group-text bg-transparent border border-0 px-1"><i class="fas fa-search text-muted" style="font-size:1vw;"></i></span>
 					<input type="text" id="inp_search_user" class="form-control border border-0 shadow-none bg-transparent text-muted p-0" placeholder="유저를 검색하세요" 
 					style="outline:none; font-size:1vw;">
			  </div>
			</li>
		
	<!--           <li class="dropdown"><a href="#"><span>Drop Down</span> <i class="bi bi-chevron-down"></i></a>
	          <ul>
	            <li><a href="#">Drop Down 1</a></li>
	            <li class="dropdown"><a href="#"><span>Deep Drop Down</span> <i class="bi bi-chevron-right"></i></a>
	              <ul>
	                <li><a href="#">Deep Drop Down 1</a></li>
	                <li><a href="#">Deep Drop Down 2</a></li>
	                <li><a href="#">Deep Drop Down 3</a></li>
	                <li><a href="#">Deep Drop Down 4</a></li>
	                <li><a href="#">Deep Drop Down 5</a></li>
	              </ul>
	            </li>
	            <li><a href="#">Drop Down 2</a></li>
	            <li><a href="#">Drop Down 3</a></li>
	            <li><a href="#">Drop Down 4</a></li>
	          </ul>
	        </li> -->
	        
	          
	        </ul>
	        <i class="bi bi-list mobile-nav-toggle"></i>
	      </nav>
	      <!-- .navbar -->
	    	
    	</div>
    		
  	</header>
  	<div id="auto_search"class="navbar-nav position-fixed top-10 end-0 card me-5" style="width:20vw; z-index:999; visibility:hidden;"></div>
  			<!-- Toast창  -->
  	<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 5">
		<div id="liveToast" class="toast fade" role="alert" aria-live="assertive" aria-atomic="true">
    		<div class="toast-header bg-light d-flex justify-content-end">
      			<button id="btn_toast_close"type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
    		</div>
    	<div class="toast-body">
      		메세지가 도착했습니다.
    	</div>
  		</div>
	</div>