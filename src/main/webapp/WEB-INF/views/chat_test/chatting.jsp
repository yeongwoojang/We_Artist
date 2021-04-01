<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.min.js"></script> <!-- socjJs CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script> <!-- STOMP CDN -->

</head>
<body>
	<input type="text" id="msg-box">
	<button type="button" class="btn-primary" onclick="sendMessage();"></button>
<script>
let stompClient = null;
window.onload = function(){
	let socket = new SockJS("room1");
	stompClient = Stomp.over(socket);
	stompClient.connect({},function(frame){
		stompClient.subscribe("/queue/info",function(response){
			console.log(JSON.parse(response.body));
		});
		console.log("소켓 연결 성공",frame);
	});
}

	let sendMessage= function(){
		let message = document.getElementById("msg-box").value;
		stompClient.send("/info",{},JSON.stringify({'message' : message}));
	}

// 	stompClient.disconnect();
	

</script>
</body>
</html>