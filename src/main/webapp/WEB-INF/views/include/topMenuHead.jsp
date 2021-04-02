<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<title>We Artist!</title>
	
	<c:set var="context" value="${pageContext.request.contextPath}"/>
	<script type="text/javascript" src="${context}/resources/js/common/urlEncoder.js"></script>
	<script type="text/javascript" src="${context}/resources/js/common/asyncPageError.js"></script>
	
	<!-- Google Fonts -->
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
<style>
	html,body{
		width:100%;
		height:100%;
	}
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
		
	      <nav id="navbar" class="navbar order-last order-lg-0">
	        <ul>
<<<<<<< HEAD
	          <li><a class="nav-link scrollto active fs-4" href="#" style="font-family: 'Open Sans', sans-serif;">Home</a></li>
	          <li><a class="nav-link scrollto fs-4" href="#" style="font-family: 'Open Sans', sans-serif;">Gallery</a></li>
	          <li><a class="nav-link scrollto fs-4" href="#" style="font-family: 'Open Sans', sans-serif;">Mypage</a></li>
	          <li><a class="nav-link scrollto fs-4" href="#" style="font-family: 'Open Sans', sans-serif;">Mypage</a></li>
	          <li><a class="nav-link scrollto fs-4" href="#" style="font-family: 'Open Sans', sans-serif;">로그인</a></li>
	          <li><a class="nav-link scrollto fs-4" href="#" style="font-family: 'Open Sans', sans-serif;">회원가입</a></li>
=======
	          <li><a class="nav-link scrollto fs-3"href="#">Home</a></li>
	          <li><a class="nav-link scrollto fs-3" href="#">Gallery</a></li>
	          <li><a class="nav-link scrollto fs-3" href="#">MyPage</a></li>
	          <li><a class="nav-link scrollto fs-4" href="${context}/join">회원가입</a></li>
>>>>>>> ef3009132f2e65d13aacb8ae07e875456318bef2
	          <!--
	          <li class="dropdown"><a href="#"><span>Drop Down</span> <i class="bi bi-chevron-down"></i></a>
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
	        </li>
	         -->
	          
	        </ul>
	        <i class="bi bi-list mobile-nav-toggle"></i>
	      </nav>
	      <!-- .navbar -->
    	</div>
  	</header>