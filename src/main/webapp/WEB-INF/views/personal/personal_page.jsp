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
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Montserrat:300,400,500,600,700" rel="stylesheet">
  <script type="text/javascript">
  function overlap(id){
	  console.log(id);
	  let div = document.getElementById(id);
	  let icon = document.createElement("i")
	  icon.setAttribute("class","fas fa-copy position-absolute top-0 end-0 m-3 fs-3 text-white");
	  div.appendChild(icon)
	  console.dir(div);
  }
  </script>
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
	<!--사진피드 -->
      <section id="hotels" class="section-with-bg">
      <div class="container aos-init aos-animate" data-aos="fade-up">
        <div class="section-header">
          <h2>Hotels</h2>
          <p>Her are some nearby hotels</p>
        </div>
        <c:set var="loop_flag" value="false" />
		 	<div class="row aos-init aos-animate" data-aos="fade-up" data-aos-delay="100">
		 		<c:forEach var ="boardInfo" items ="${personalBoardInfoList}" varStatus="sts">
		 			<c:forEach var ="file" items ="${boardInfo.files}" varStatus="status">
		 			<c:if test="${status.index==0}">
					<div class="col-lg-4 col-md-6">
            			<div class="hotel">
             				<div class="hotel-img position-relative" id="${boardInfo.board.bdNo}">
               					<a href='#' onclick="showModal('${boardInfo.board.bdNo}','${boardInfo}');">
                				<img src=<c:url value='/images/${file.fSavePath}/${file.fRename}'/> alt="" class="img-fluid" >
              					</a>
              				</div>
                			<h3 class="mt-3"><a href="#">${boardInfo.board.bdTitle}</a></h3>
              				<p>${boardInfo.board.bdContent}</p>
           			 	</div>
          			</div>	
          			<c:if test="${fn:length(boardInfo.files)>1}">
          				<script>overlap("${boardInfo.board.bdNo}");</script>
          			</c:if>
          			</c:if>
		 			</c:forEach>
		 		</c:forEach>
		 	</div>
		</div>
      </section>
  </main>
<!-- footer부분 -->
 	<%@include file ="/WEB-INF/views/include/footer.jsp" %>
  
  <!-- Modal --> 
<div class="modal fade position-fixed top-50 start-50 translate-middle" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog  modal-lg" id="myModal">
    <div class="modal-content">
    	<div class="modal-header">
        	<h5 class="modal-title" id="exampleModalLabel">게시물 이름</h5>
       		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      	</div>
      	<div class="modal-body">
       		<div id="carouselExampleControls" class="carousel carousel-dark slide d-flex " data-bs-ride="carousel">
       			<div class="carousel-inner">
  				</div>
  					<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
    					<span class="carousel-control-prev-icon primary" aria-hidden="true"></span>
    					<span class="visually-hidden">Previous</span>
  					</button>
  					<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
    					<span class="carousel-control-next-icon" aria-hidden="true"></span>
    					<span class="visually-hidden">Next</span>
  					</button>
				</div>
      		</div>
      		<div>
            	<p id="board_content"></p>
      		</div>
  	  </div>
  </div>
</div>
  
  <script src="${context}/resources/theEvent/assets/vendor/aos/aos.js"></script>
  <script src="${context}/resources/theEvent/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${context}/resources/theEvent/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="${context}/resources/theEvent/assets/vendor/php-email-form/validate.js"></script>
  <script src="${context}/resources/theEvent/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="${context}/resources/theEvent/assets/js/main.js"></script>
  <script>
  	let list = new Array();
  	let selectedBoard;
	function showModal(bdNo,boardInfo){
		fetchSelectBoard(bdNo);
		
	}
	
	function fetchSelectBoard(bdNo){
		const url = '/fetchselectedboard?bdNo='+bdNo;
		fetch(url,{
			method : "GET"
		}).then(response=>{
			if(response.ok){
				return response.text();
			}
		}).then((text)=>{
			selectedBoard = JSON.parse(text);
			let carouselInner = document.querySelector(".carousel-inner");
			let boardContent = document.getElementById("board_content");
			let carouselItem = document.createElement("div")
			let img = document.createElement("img");
			boardContent.innerHTML = selectedBoard.board.bdContent;
			<c:forEach var ="boardInfo" items="${personalBoardInfoList}" varStatus="sts">
       			<c:forEach var ="file" items ="${boardInfo.files}" varStatus="status">
       				img.src = "<c:url value='/images/${file.fSavePath}/${file.fRename}'/>";
       				img.setAttribute("class","d-block w-100")
       				img.style="width:100%;height:100%; object-fit: cover;"
       			<c:choose>
       				<c:when test="${sts.index==0 and status.index==0}">
	       				carouselItem.setAttribute("class","carousel-item active")
	       				carouselItem.appendChild(img);
       				</c:when>
	       			<c:otherwise>
	       				carouselItem.setAttribute("class","carousel-item")
	       				carouselItem.appendChild(img);
	       			</c:otherwise>
       			</c:choose>
       			carouselInner.appendChild(carouselItem);
       			</c:forEach>
       		</c:forEach>
       		console.dir(carouselInner)
       		$('#exampleModal').modal("show");
		});
	}
  </script>
</body>
</html>