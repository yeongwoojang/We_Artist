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
</head>
<body id="body">
<main id="main">
    <!-- ======= Speaker Details Sectionn ======= -->
    <section id="speakers-details" class="section-with-bg">
      <div class="container">
        <div >
          <div class="details">
            <p class="fs-1 text-center">${personalUserInfo.nickName}님의 개인 공간입니다.</p>
              <div class="social text-center d-flex justify-content-center">
              <div>
                <a href="/personal/personalprivate" class="m-2 p-4"><i class="fas fa-user-circle"></i></a>              
                <p class="fw-bold" style= "font-family: 'Nanum Gothic', sans-serif;">프로필</p>
              </div>
              <div>
                <a href="#" class="m-2 p-4"><i class="far fa-comment"></i></a>
                <p class="fw-bold">메세지</p>
              </div>
              <div>
                <a href="#" class="m-2 p-4"><i class="fas fa-heart"></i></a>
                <p class="fw-bold">팔로잉</p>              
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
          <h2>게시물</h2>
          <p>board</p>
        </div>
        <c:set var="loop_flag" value="false" />
		 	<div class="row aos-init aos-animate" data-aos="fade-up" data-aos-delay="100">
		 		<c:forEach var ="boardInfo" items ="${personalBoardInfoList}" varStatus="sts">
		 			<c:forEach var ="file" items ="${boardInfo.files}" varStatus="status">
		 			<c:if test="${status.index==0}">
					<div class="col-lg-4 col-md-6">
            			<div class="hotel">
             				<div class="hotel-img position-relative mb-0" id="${boardInfo.board.bdNo}">
               					<div id="wrap_img"onclick="showModal('${boardInfo.board.bdNo}','${boardInfo}');" style="cursor: pointer;">
                				<img src=<c:url value='/images/${file.fSavePath}/${file.fRename}'/> alt="" class="img-fluid" >
              					</div>
              				</div>
              				<c:if test="${fn:length(boardInfo.board.bdTitle)>17}">
              					<c:set var="bdTitle" value="${boardInfo.board.Title}"></c:set>
              					<p class="p-2 border-bottom fs-3 mx-1"style= "font-family: 'Nanum Gothic', sans-serif;font-style:normal;font-weight: 700;">${fn:substring(bdTitle,0,17)}......</p>
              				</c:if>
              				<c:if test="${fn:length(boardInfo.board.bdTitle)<=17}">
              					<p class="p-2 border-bottom fs-3 mx-1"style= "font-family: 'Nanum Gothic', sans-serif;font-style:normal;font-weight: 700;">${boardInfo.board.bdTitle}</p>
              				</c:if>
                			<c:if test="${fn:length(boardInfo.board.bdContent)>22}">
                				<c:set var="bdContent" value="${boardInfo.board.bdContent}"></c:set>
 	             				<p class="p-2 mb-0"style= "font-family: 'Nanum Gothic', sans-serif; font-style:normal;">${fn:substring(bdContent,0,22)}......</p>
                			</c:if>
                			<c:if test="${fn:length(boardInfo.board.bdContent)<=22}">
                				<p class="p-2 mb-0"style= "font-family: 'Nanum Gothic', sans-serif;font-style:normal;">${boardInfo.board.bdContent}</p>
                			</c:if>
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
		 <!-- Modal --> 
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<p id="btn_modal_close"class="float-end text-white fs-1 mt-2 mr-1" style="cursor: pointer;"><i class="fas fa-times"></i></p>
  <div class="modal-dialog modal-xl" id="myModal">
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
      		<div class="bg-light col col-md-4">
      			<h4 id="board_title" class="fw-bold border-bottom mx-1 p-2"style="font-size:2vw;"></h4>
            	<h6 id="board_content"class="fw-nomal p-2" style="font-size:1vw;"></h6>
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
  <script>
  
  let myModalEl = document.getElementById('exampleModal')
  myModalEl.addEventListener('hidden.bs.modal', function (event) {
	  let carouselInner = document.querySelector(".carousel-inner");
	  while(carouselInner.hasChildNodes()){
		  carouselInner.removeChild(carouselInner.firstChild);
	  }
  });
  
  let modalCloseBtn = document.getElementById('btn_modal_close');
  modalCloseBtn.addEventListener('click',function(){
	  $('#exampleModal').modal("hide");
  })
  myModalEl.addEventListener('shown.bs.modal',function(event){
  });
  

  
  	let selectedBoard;
  	let boardInfo;
  	let fileList;
  	
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
			let boardTitle = document.getElementById("board_title");
			boardContent.innerHTML = selectedBoard.board.bdContent;
			boardTitle.innerHTML = selectedBoard.board.bdTitle;
			boardInfo = selectedBoard.board; //선택한 게시물 정보
			fileList = selectedBoard.files; //선택한 게시물에 속해있는 파일 리스트 정보
			for(let i = 0; i<fileList.length; i++){
					let carouselItem = document.createElement("div")
					let img = document.createElement("img");
					img.setAttribute("class","d-block w-100 img-fluid");
					img.src = "/images/"+fileList[i].fSavePath+"/"+fileList[i].fRename;
					console.log("/images/"+fileList[i].fSavePath+"/"+fileList[i].fRename);
// 					img.style="width:100%;height:100%;object-fit:cover;";
				if(i==0){
					console.log('이건 0')
					carouselItem.setAttribute("class","carousel-item active");
				}else{
					carouselItem.setAttribute("class","carousel-item");
					console.log('이건 0이아님')
				}
	       			carouselItem.appendChild(img);
	       			carouselInner.appendChild(carouselItem);
	       			console.dir(carouselInner.childNodes);
			}
			
			$('#exampleModal').modal("show");
		});
	}
  </script>
</body>
</html>