<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/topMenuHead.jsp"%>

<section id="hero" class="position-relative">
	<div class="container mx-auto d-none" id="divLive">
		<div class="d-flex card w-80 position-absolute top-30 start-50 translate-middle" style="top: 40%">
			<div class="card-header d-flex justify-content-between">
				<div class="align-self-center">
					유저 아이디 넣을까
				</div>
				<div class="flex-inline justify-content-end">
					<div class="btn btn-danger btn-sm" id="btn-close" onclick="changePage()">
						X
					</div> 
				</div>
			</div>
			<div class="d-flex justify-content-center">
				<div class="w-60" style="width: 640px; height: 480px">
					<video id="remoteVideo" autoplay muted playsinline class="position-absolute"></video>
				</div>
				<div class="w-50">
					<div class="card">
						<div id="chatRoom" class="card-body d-flex flex-column justify-content-end overflow-scroll" style="max-height: 407px; height: 407px">
											
						</div>	
						<div class="card-footer">
							
							<div class="input-group mb-3">
							  <input type="text" class="form-control" id="messageInput"aria-label="Recipient's username" aria-describedby="button-addon2">
							  <div class="input-group-append">
							    <button class="btn btn-outline-secondary" type="button" id="button-addon2" onclick="sendMessage()">></button>
							  </div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container mx-auto" id="divLiveList">
		<div class="d-flex card w-80 position-absolute top-30 start-50 translate-middle" style="top: 40%">
			<div class="card-body overflow-scroll" style="max-height: 500px">
				<div class="card mb-2" style="max-width: 540px;">
				  <div class="row g-0">
				    <div class="col-md-4">
				      <img src="/resources/img/dummy_img.png" alt="..." class="img-thumbnail">
				    </div>
				    <div class="col-md-8">
				      <div class="card-body">
				        <h5 class="card-title">유저 아이디 들어갈 곳</h5>
				        <p class="card-text">유저 이메일</p>
				        <p class="card-text btn" onclick="createOffer()"><small class="text-muted">Go to Live</small></p>
				      </div>
				    </div>
				  </div>
				</div>
				
				<div class="card mb-3" style="max-width: 540px;">
				  <div class="row g-0">
				    <div class="col-md-4">
				      <img src="/resources/img/dummy_img.png" alt="..." class="img-thumbnail">
				    </div>
				    <div class="col-md-8">
				      <div class="card-body">
				        <h5 class="card-title">유저 아이디 들어갈 곳</h5>
				        <p class="card-text">유저 이메일 들어갈 곳</p>
				        <p class="card-text btn"><small class="text-muted">Go to Live</small></p>
				      </div>
				    </div>
				  </div>
				</div>
				
				<div class="card mb-3" style="max-width: 540px;">
				  <div class="row g-0">
				    <div class="col-md-4">
				      <img src="/resources/img/dummy_img.png" alt="..." class="img-thumbnail">
				    </div>
				    <div class="col-md-8">
				      <div class="card-body">
				        <h5 class="card-title">유저 아이디 들어갈 곳</h5>
				        <p class="card-text">유저 이메일 들어갈 곳</p>
				        <p class="card-text btn"><small class="text-muted">Go to Live</small></p>
				      </div>
				    </div>
				  </div>
				</div>
			</div>
		</div>
	</div>
</section>

<script type="text/javascript" src="${context}/resources/js/live/liveChat.js"></script>
<script type="text/javascript" src="${context}/resources/js/live/liveGuest.js"></script>
</body>
</html>