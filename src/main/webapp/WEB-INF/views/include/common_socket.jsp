<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<script>
window.onload = function() { //페이지의 모든 요소들이 로드되면 호출
	connectSocket();

}
console.log("아이디 : ${userId}");
let connectSocket = function(){
	let socket = new SockJS("/chat/room1"); //sockJS객체 생성 endPoint : "room1"
	stompClient = Stomp.over(socket); //stomp객체에 sockJs객체 연경
	stompClient.connect({}, function(frame) { // 
		stompClient.subscribe("/queue/${userId}",function(response){ //채널 구독
			document.getElementById("liveToast").className ="toast show";
			setTimeout(function() {
 			document.getElementById("liveToast").className ="toast hide";
			}, 5000);
		});
		console.log("소켓 연결 성공", frame);
	});
}
</script>