<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/topMenuHead.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.min.js"></script> <!-- socjJS CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script> <!-- STOMP CDN -->

<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Montserrat:300,400,500,600,700" rel="stylesheet">
</head>
<body class="bg-light">
	<section class="d-flex align-items-center justify-content-center" style="height:90vh;">
		<div class="d-flex container" style="height:80vh;">
			<div class="card col-4">
				<div id="userId" class="card-header p-2 bg-white">${userInfo.userId}님의 팔로우 목록</div> <!--유저 아이디 올 곳 -->
				<div class="card-body d-flex flex-column" style="width:100%;height:70vh; overflow:auto;">
					<c:forEach var ="name" items ="${followingList}" varStatus="status">
						<div class="chat_room_card card p-3 position-relative mb-2">
							<a href="#" class="following_user text-dark mb-3" onclick="createRoomId('${name}')"><c:out value="${name}"></c:out></a>
							<div class="last_message text-secondary"></div>
							<p class="last_message_time position-absolute bottom-0 end-0 p-1 fw-light" style="margin-bottom: 0px;"></p>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="card col-7">
					<div id="chat_box" class="card-body d-flex flex-column" style="width:30vw height:100%; overflow:auto;">
					<div id="chat_index"class="container position-relative" style="width:30vw; height:100%">
						<p class="position-absolute top-50 start-50 translate-middle fs-1"><i class="far fa-circle"></i></p>
						<p class="position-absolute top-50 start-50 translate-middle fs-4"><i class="fas fa-location-arrow"></i></p>
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
	<script src="${context}/resources/js/mypage/direct.js"></script>
	
</body>
</html>