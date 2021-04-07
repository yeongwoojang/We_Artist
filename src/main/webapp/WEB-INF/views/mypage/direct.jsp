<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/topMenuHead.jsp"%>
<%@ include file="/WEB-INF/views/include/common_socket.jsp" %>
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
				<div id="userId" class="card-header p-2 bg-white">${userId}</div> <!--유저 아이디 올 곳 -->
				<div class="card-body" style="width:30vw;height:70vh; overflow:auto;">
					<p>김종환</p>
					<p>김선민</p>
					<p>김동찬</p>
					<p>김지연</p>
					<button type="button" id="test1" onclick="test('김지연');">김지연</button>
					<button type="button" id="test2" onclick="test('장영우');">장영우</button>
					<p>${context}</p>				
				</div>
			</div>
			<div class="card col-7">
				<div id="chat_box" class="card-body d-flex flex-column" style="width:30vw height:100%; overflow:auto;"></div>
				<div class="card-footer">
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