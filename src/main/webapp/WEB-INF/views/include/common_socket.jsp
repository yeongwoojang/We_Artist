<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<script>
let currentUserId;
let stompClient = null;
let myChatRoomList = null;
window.onload = function() { //페이지의 모든 요소들이 로드되면 호출
	myChatRoomList = new Array(); //내가 속한 채팅방 리스트
	<c:forEach items='${myChatRoomList}' var='item'>
		let chatRoom = new Object();
		chatRoom.chatRoomNo = "${item.chatRoomNo}"
		chatRoom.firstUser = "${item.firstUser}";
		chatRoom.seconduser = "${item.secondUser}";
		myChatRoomList.push(chatRoom)
	</c:forEach>
	console.log("나의 채팅방 리스트 : "+myChatRoomList);
	connectSocket(); //소켓 연결
	currentUserId = "${userInfo.userId}"; //현재 로그인한 유저의 ID

}

// 소켓 연결을 위한 함수
let connectSocket = function(){
	let currentURI = document.location.pathname; //현재 페이지의 uri을 가져오는 코드

	let socket = new SockJS("/chat/room1"); //sockJS객체 생성 endPoint : "room1"
	stompClient = Stomp.over(socket); //stomp객체에 sockJs객체 연경
	stompClient.connect({}, function(frame) {  
		//내가 속한 모든 채팅방을 구독
		for(let i = 0; i < myChatRoomList.length; i++){
			console.log("채팅방 번호 : "+myChatRoomList[i].chatRoomNo)
			stompClient.subscribe("/queue/"+myChatRoomList[i].chatRoomNo,function(response){
				if(currentURI.indexOf('/chat/direct')!=-1){ //만약 현제 페이지가 채팅화면 이라면
					let msgInfo = JSON.parse(response.body) //넘어온 message 정보를 담고있는 json을 파싱
					let msg = msgInfo.message;
					let msgFrom = msgInfo.msgFrom;
					let msgTo = msgInfo.msgTo;
					console.log("팔로우창 띄우자")
//		 			subscribeImpl(msg,msgFrom,msgTo); //받은 메시지를 Controller에 전달
					
					let chatRoomCard = document.querySelectorAll(".chat_room_card"); //팔로잉하고 있는 유저들의 item항목을 담고있는 div태그 리스트
					let lastMessage = document.querySelectorAll(".last_message"); //해당 유저에게 마지막으로 받은 message를 보여 줄 div태그 리스트
					let lastMessageTime = document.querySelectorAll(".last_message_time") //해당 유저에게 마지막으로 message 를 받은 시간을 나타내는 p태그리스트 
					
					//받은 메세지가 글자수 10자를 넘으면 10글자만 보여주고 나머지는 "......."으로 표시
					if (msg.length >= 10) {
						msg = msg.substr(0,10)+"......" 
					}
					
					for(let i =0; i< chatRoomCard.length; i++){
						let uName = chatRoomCard[i].childNodes[1].innerHTML
						//메세지를 보낸 유저와 팔로잉 한 유저가 일치한다면 그 유저가 보낸 메세지를 Cardview에 표시
						if(uName==msgFrom){
							console.dir(lastMessage)
							lastMessage[i].innerHTML = msg
							lastMessageTime[i].innerHTML = getCurrentTime();
						}
					}		
				}else{
					document.getElementById("liveToast").className ="toast show";
					setTimeout(function() {
			 			document.getElementById("liveToast").className ="toast hide";
						}, 5000);
					}	
			});
		}
		console.log("소켓 연결 성공", frame);
	});
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
// 		stompClient.subscribe("/queue/${userInfo.userId}",function(response){ //현재 로그인한 유저의 아이디 경로를 구독
// 		if(currentURI.indexOf('/chat/direct')!=-1){ //만약 현제 페이지가 채팅화면 이라면
// 			let msgInfo = JSON.parse(response.body) //넘어온 message 정보를 담고있는 json을 파싱
// 			let msg = msgInfo.message;
// 			let msgFrom = msgInfo.msgFrom;
// 			let msgTo = msgInfo.msgTo;
// // 			subscribeImpl(msg,msgFrom,msgTo); //받은 메시지를 Controller에 전달
			
// 			let chatRoomCard = document.querySelectorAll(".chat_room_card"); //팔로잉하고 있는 유저들의 item항목을 담고있는 div태그 리스트
// 			let lastMessage = document.querySelectorAll(".last_message"); //해당 유저에게 마지막으로 받은 message를 보여 줄 div태그 리스트
// 			let lastMessageTime = document.querySelectorAll(".last_message_time") //해당 유저에게 마지막으로 message 를 받은 시간을 나타내는 p태그리스트 
			
// 			//받은 메세지가 글자수 10자를 넘으면 10글자만 보여주고 나머지는 "......."으로 표시
// 			if (msg.length >= 10) {
// 				msg = msg.substr(0,10)+"......" 
// 			}
			
// 			for(let i =0; i< chatRoomCard.length; i++){
// 				let uName = chatRoomCard[i].childNodes[1].innerHTML
// 				//메세지를 보낸 유저와 팔로잉 한 유저가 일치한다면 그 유저가 보낸 메세지를 Cardview에 표시
// 				if(uName==msgFrom){
// 					console.dir(lastMessage)
// 					lastMessage[i].innerHTML = msg
// 					lastMessageTime[i].innerHTML = getCurrentTime();
// 				}
// 			}		
			
			
			
// 			let chatBox = document.getElementById("chat_box");
// 			let borderBox = document.createElement("div");
// 			borderBox.style.padding = "10px";
// 			borderBox.style.marginBottom = "10px";
// 			borderBox.style.border = "1px solid #DCDCDC"
// 			if (msg.length >= 20) {
// 				borderBox.style.width = "30%";
// 			} else {

// 			}
// 			borderBox.style.borderRadius = "20px";
// 			let br = document.createElement("br");
// 			let messageBox = document.createElement("div");

// 			borderBox.style.background = "#FFFFFF";
// 			borderBox.className = "float-start align-self-start"
// 			messageBox.style.textAlign = "left"
// 			chatBox.appendChild(br);
// 			messageBox.innerHTML = msg;
// 			borderBox.appendChild(messageBox);
// 			chatBox.appendChild(borderBox);
// 		}else{
// 			document.getElementById("liveToast").className ="toast show";
// 			setTimeout(function() {
// 	 			document.getElementById("liveToast").className ="toast hide";
// 				}, 5000);
// 			}	
// 		});
// 		console.log("소켓 연결 성공", frame);
// 	});
}

//받은 메시지를 Controller에 전달하는 함수
function subscribeImpl(msg,msgFrom,msgTo){
	const url = '/chat/subscribeimpl';
	let paramObj = new Object();
	paramObj.msg = msg;
	paramObj.msgFrom = msgFrom;
	paramObj.msgTo = msgTo;
	
	let headerObj = new Headers();
	headerObj.append('content-type',"application/json");
	fetch(url,{
		method:"POST",
		headers:headerObj,
		body:JSON.stringify(paramObj)
	})
	.then(response =>{
		if(response.ok){
			return response.text();
		}
	}).then((text)=>{
		if(text=='fail'){
			
		}else{
			console.log("통신 성공")
		}
	})
}

//현재 시간을 반환 하는 함수
function getCurrentTime(){
	let today = new Date();
	
	let year = today.getFullYear(); // 년도
	let month = today.getMonth() + 1;  // 월
	let date = today.getDate();  // 날짜
	let day = today.getDay();  // 요일
	let hours = today.getHours(); // 시
	let minutes = today.getMinutes();  // 분
	
	return year+"년 "+month+"월 "+date+"일 "+hours+"시 "+minutes+"분"
}
</script>