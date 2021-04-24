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

<style>
 	@media(max-width: 992px) {  
 	 	#follow_list{ 
 	 	display:none;
 	 	} 
 	 	#chat_layout{
 	 		width:100vw;
 	 	}
	 } 
</style>
</head>
<body id="body">
	<main id="main">
	<section id="contact" class="section-bg d-flex justify-content-center">
		<div class="row container float-center" style="height:80vh;">
			<div id="follow_list"class="card col-4">
				<div id="userId" class="card-header p-4 bg-white text-center fw-bold">${userInfo.nickName}님의 팔로우 목록</div> 
				<div class="card-body d-flex flex-column" style="width:100%;height:70vh; overflow:auto;">
					<c:forEach var ="senderInfo" items ="${senderList}" varStatus="status">
						<c:set var="loop_flag" value="false" />
						<div class="chat_room_card card p-3 position-relative mb-2">
							<a href="#" class="following_user text-dark mb-3 item_following_user fw-bold" data-userid="${senderInfo.userId}"><c:out value="${senderInfo.nickName}"></c:out></a>
							<c:forEach var="chatContent" items="${lastMessageList}" varStatus="sts">
								<c:if test="${chatContent.msgFrom == senderInfo.userId || chatContent.msgTo ==senderInfo.userId}">
									<div class="last_message text-secondary"><c:out value="${chatContent.msg}"></c:out></div>
									<p class="last_message_time position-absolute bottom-0 end-0 p-1 fw-light" style="margin-bottom: 0px; font-size:1px;"><c:out value="${chatContent.msgTime}"></c:out></p>
									<c:set var="loop_flag" value="true" />
								</c:if>
						   </c:forEach>
						    <c:if test="${not loop_flag}">
						   <div class="last_message text-secondary"></div>
							<p class="last_message_time position-absolute bottom-0 end-0 p-1 fw-light" style="margin-bottom: 0px;"></p>
							</c:if>
						</div>
					</c:forEach>
				</div>
			</div>
			<div id="chat_layout"class="card col-7" style="height:80vh;">
				<div id="opponent" class="card-header bg-white p-4 fw-bold" style="visibility : hidden;"></div>
					<div id="chat_box" class="card-body d-flex flex-column" style="overflow:auto;">
					<div id="chat_index"class="container position-relative" style="width:30vw; height:100%">
						<div onclick="">
						<p class="position-absolute top-50 start-50 translate-middle"><i class="far fa-circle" style="font-size:45px;"></i></p>
						<p class="position-absolute top-50 start-50 translate-middle"><i class="fas fa-location-arrow"style="font-size:25px;"></i></p>
						</div>
						
					</div>
					</div>
					<div id="send_message_box" class="card-footer" style="visibility:hidden;">
						<div class="input-group border rounded-pill p-2 bg-white">
 			 				<input id="msg_box" type="text" class="form-control border border-0 bg-white shadow-none" placeholder="메시지를 입력하세요" style="outline:none" onkeydown="JavaScript:sendMessage();">
						</div>
					</div>
			</div>
		</div>
	</section>
	<!-- 채팅방 리스트 모달 -->
	<div class="modal fade" id="messageListModal" tabindex="-1" aria-labelledby="messageListModalLabel" aria-hidden="true">
 			<div class="modal-dialog modal-dialog-centered">
   				<div class="modal-content" style="border-radius: 20px;">
    				<div class="d-flex border-bottom p-2">
        				<div class="modal-title fw-bold text-center flex-fill" id="messageListModal">
        				팔로워
        				<button type="button" class="btn-close float-end" data-bs-dismiss="modal" aria-label="Close"></button>
        				</div>
        			
      				</div>
      				<ul id="follower_list"class="list-group list-group-flush m-2" style="overflow:auto; height:20vh;">
      					<!-- 비동기로 데이터를 받아올 곳 -->
      				</ul>	
    			</div>
 		 	</div>
		</div>
	
	</main>	
		<%@include file ="/WEB-INF/views/include/footer.jsp" %>
		<script>
			let senderList = new Array();
			let obj;
			<c:forEach var="senderInfo" items="${senderList}" varStatus="status">
				obj = new Object();
				obj.userId = "${senderInfo.userId}";
				obj.nickName = "${senderInfo.nickName}";
				senderList.push(obj);
			</c:forEach>
			console.dir(senderList);
		</script>
	<script src="${context}/resources/js/mypage/direct.js"></script>
	<script>
	

	</script>
</body>
</html>