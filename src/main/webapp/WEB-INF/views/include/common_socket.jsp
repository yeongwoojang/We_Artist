<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<script>
window.onload = function() { //페이지의 모든 요소들이 로드되면 호출
	connectSocket(); //소켓 연결

}

// 소켓 연결을 위한 함수
let connectSocket = function(){
	let currentURI = document.location.pathname; //현재 페이지의 uri을 가져오는 코드

	let socket = new SockJS("/chat/room1"); //sockJS객체 생성 endPoint : "room1"
	stompClient = Stomp.over(socket); //stomp객체에 sockJs객체 연경
	stompClient.connect({}, function(frame) {  
		stompClient.subscribe("/queue/${userInfo.userId}",function(response){ //현재 로그인한 유저의 아이디 경로를 구독
		if(currentURI=='/chat/direct'){
			let msgInfo = JSON.parse(response.body);
			user = msgInfo.user
			let msg = msgInfo.message
			console.log("메세지 : " + msg)
			let chatBox = document.getElementById("chat_box");
			let borderBox = document.createElement("div");
			borderBox.style.padding = "10px";
			borderBox.style.marginBottom = "10px";
			borderBox.style.border = "1px solid #DCDCDC"
			if (msg.length >= 20) {
				borderBox.style.width = "30%";
			} else {

			}
			borderBox.style.borderRadius = "20px";
			let br = document.createElement("br");
			let messageBox = document.createElement("div");

			borderBox.style.background = "#FFFFFF";
			borderBox.className = "float-start align-self-start"
			messageBox.style.textAlign = "left"
			chatBox.appendChild(br);
			messageBox.innerHTML = msg;
			borderBox.appendChild(messageBox);
			chatBox.appendChild(borderBox);
		}else{
			document.getElementById("liveToast").className ="toast show";
			setTimeout(function() {
	 			document.getElementById("liveToast").className ="toast hide";
				}, 5000);
		}	
		
		});
		console.log("소켓 연결 성공", frame);
	});
}
</script>