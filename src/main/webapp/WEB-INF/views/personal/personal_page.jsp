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
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"integrity="sha256-4+XzXVhsDmqanXGHaHvgh1gMQKX40OUvDEBTu8JcmNs="crossorigin="anonymous"></script>
  <script type="text/javascript">
  function overlap(id){
	  console.log(id);
	  let div = document.getElementById(id);
	  let icon = document.createElement("i");
	  icon.setAttribute("class","fas fa-copy position-absolute top-0 end-0 m-3 fs-3 text-white");
	  div.appendChild(icon)
	  console.dir(div);
  }
  </script>
  <style>
  	p{
  		font-family : 'Nanum Gothic', sans-serif';
  		font-style:normal;
  		font-weight: 400;
  	}
  </style>
</head>
<body id="body">
<main id="main">
    <!-- ======= Speaker Details Sectionn ======= -->
    <section id="speakers-details" class="section-with-bg">
      <div class="container">
        <div>
          <div class="details">
          	<div class="d-flex align-items-center flex-column">
          		<div class="mb-3">
	             	<p id="user" class="fs-4 text-center fw-bold my-0"style= "font-family: 'Nanum Gothic', sans-serif;font-style:normal;font-weight: 700;">${personalUserInfo.nickName}</p>	
          		</div>
          		<div>
             	 <c:choose>
          			<c:when test="${pageState eq 'isMine'}">
          			<button type="button" class="btn btn-primary mx-3" onclick="modifyProfile()" style="font-family: 'Nanum Gothic', sans-serif;font-style:normal;font-weight: 400;">프로필 설정</button>
          			</c:when>
          			<c:when test="${pageState eq 'isFollowed'}">
          				<button  type="button" id="btn_about_following" onclick="unfollowing()"class="btn btn-primary btn-sm mx-3" style="font-family: 'Nanum Gothic', sans-serif;font-style:normal;font-weight:400; width:120px; height:40px;">팔로잉 끊기</button>
          				<button type="button" class="btn btn-primary mx-3" onclick="location.href='/chat/direct?sendDirect=${personalUserInfo.nickName}'" style="font-family: 'Nanum Gothic', sans-serif;font-style:normal;font-weight: 400;">메세지 보내기</button>
          			</c:when>
          			<c:when test="${pageState eq 'nothing'}">
          				<button type="button" id="btn_about_following" onclick="following()" class="btn btn-primary mx-3" style="font-family: 'Nanum Gothic', sans-serif;font-style:normal;font-weight: 400; width:120px; height:40px;">팔로잉</button>
          				<button type="button" class="btn btn-primary mx-3" onclick="location.href='/chat/direct?sendDirect=${personalUserInfo.nickName}'" style="font-family: 'Nanum Gothic', sans-serif;font-style:normal;font-weight: 400; width:120px; height:40px;">메세지 보내기</button>
         		 	</c:when>
         		 </c:choose>
         		 
         		 	<button type="button" class="btn btn-primary mx-3" onclick="location.href='/gallery/${personalUserInfo.userId}'" style="font-family: 'Nanum Gothic', sans-serif;font-style:normal;font-weight: 400; width:120px; height:40px;">갤러리</button>
         		 </div>
             </div>
            <div class="d-flex justify-content-center m-3">
            	<div class="d-flex mr-1"><p class="fs-5">게시물</p><p class="fs-5">${personalBoardInfoList.size()}</p></div>
            	<div class="d-flex mx-3"><p class="fs-5" style="cursor: pointer;">팔로잉</p><p id="following_count"class="fs-5">${followingCount}</p></div>
            	<div class="d-flex ml-1"><p class="fs-5" style="cursor: pointer;">팔로워</p><p id="follower_count"class="fs-5">${followerCount}</p></div>
            </div>
            </div>
        </div>
      </div>
      </section>
	<!--사진피드 -->
      <section id="venue" class="section-with-bg">
      <div class="container aos-init aos-animate" data-aos="fade-up">
        <div class="section border-bottom border-top border-2 mb-3">
          <h2 class="text-center fs-1 fw-bold p-5">게시물</h2>
        </div>
         <c:if test="${personalBoardInfoList.size()==0}">
      		<div class="container d-flex justify-content-center align-items-center" style="height:50vh;">
      			<div>
      				<p class="text-center"><i class="fas fa-box-open fs-1"></i></p>
      				<h1 class="fs-1">게시물 없음</h1>
      			</div>
      			
      		</div>
      	</c:if>
      	<c:if test="${personalBoardInfoList.size()!=0}">
        <c:set var="loop_flag" value="false" />
		 	<div class="row g-0 aos-init aos-animate" data-aos="fade-up" data-aos-delay="100">
		 		<c:forEach var ="boardInfo" items ="${personalBoardInfoList}" varStatus="sts">
		 			<c:forEach var ="file" items ="${boardInfo.files}" varStatus="status">
		 			<c:if test="${status.index==0}">
					<div class="col-lg-4 col-md-6">
             				<div class="venue-gallery position-relative mb-0" id="${boardInfo.board.bdNo}" onclick="showModal('${boardInfo.board.bdNo}','${boardInfo}');"style="cursor: pointer;">
                				<img src=<c:url value='/images/${file.fSavePath}/${file.fRename}'/> alt="" class="img-fluid">
              				</div>
          			</div>		
          			<c:if test="${fn:length(boardInfo.files)>1}">
          				<script>overlap("${boardInfo.board.bdNo}");</script>
          			</c:if>
          			</c:if>
		 			</c:forEach>
		 		</c:forEach>
		 	</div>
		 	</c:if>
		</div>
		 <!-- Modal --> 
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<p id="btn_modal_close"class="float-end text-white fs-1 mt-2 mr-1" style="cursor: pointer;"><i class="fas fa-times"></i></p>
  <div class="modal-dialog modal-lg" id="myModal">
    <div class="modal-content">
    	<div class="row g-0">
    		<div class="col col-md-8">
       			<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
       				<div class="carousel-inner">
       					<!-- 비동기로 데이터를 받아서 뿌려줄 부분 -->
  					</div>
  						<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev" style="z-index:9999">
    						<span class="carousel-control-prev-icon primary" aria-hidden="true"></span>
    						<span class="visually-hidden">Previous</span>
  						</button>
  						<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next" style="z-index:9999">
    						<span class="carousel-control-next-icon" aria-hidden="true"></span>
    						<span class="visually-hidden">Next</span>
  						</button>
					</div>
      			</div>
      		<div class="bg-light col col-md-4 d-flex flex-column">
      			<div id="board_title" class="border-bottom mx-1 p-2"style="font-size:1vw;"></div>
            	<div id="board_content"class="p-2 border-bottom mx-1" style="height:90%; overflow:auto; font-size:0.8vw;"></div>
            	<div class="p-2 d-flex align-items-center">
            		<i id="like_icon" onclick="updateLike();" class="fas fa-heart text-dark mx-2 my-1" style="cursor:pointer; font-size:20px;"></i>
            		<div style="font-size:15px;">ㄴㅇㅀㄴㅇㅀㅇㄴㅀ 님 외 5명이 좋아합니다.</div>
            	</div>
      		</div>
            	
    	</div>
      
  	  </div>
  </div>
</div>
      </section>
  </main>
<!-- footer부분 -->
 	<%@include file ="/WEB-INF/views/include/footer.jsp" %>
  
 
  
  <script src="${context}/resources/theEvent/assets/vendor/aos/aos.js"></script>
  <script src="${context}/resources/theEvent/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${context}/resources/theEvent/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="${context}/resources/theEvent/assets/vendor/php-email-form/validate.js"></script>
  <script src="${context}/resources/theEvent/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="${context}/resources/theEvent/assets/js/main.js"></script>
  
  <script src="${context}/resources/js/personal/personal.js">
  
  </script>
</body>
</html>