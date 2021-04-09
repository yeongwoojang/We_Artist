let userId = null;
let selectUser = null;
let isSubscribe = false;
let currentRoomId = null;
//메세지 전송 함수
function sendMessage() {
	if (event.keyCode == 13) {
		let msg = document.getElementById("msg_box").value;
		if (msg != "") {
			let chatBox = document.getElementById("chat_box");
			let borderBox = document.createElement("div");
			borderBox.style.padding = "10px";
			borderBox.style.marginBottom = "10px";
			borderBox.style.border = "1px solid #DCDCDC"

			if (msg.length >= 20) {
				borderBox.style.width = "30%";
			} else {
				borderBox.style.display = 'inline-block'
			}

			borderBox.style.borderRadius = "20px";
			let br = document.createElement("br");
			let messageBox = document.createElement("div");
			borderBox.style.background = "#DCDCDC"
			borderBox.className = "float-end align-self-end"
			messageBox.style.textAlign = "left"
			chatBox.appendChild(br);
			messageBox.innerHTML = msg;
			borderBox.appendChild(messageBox);
			chatBox.appendChild(borderBox);
			document.getElementById("msg_box").value = "";
			console.log('메세지 전송')
			stompClient.send("/message", {}, JSON.stringify({'roomId' : currentRoomId, 'message': msg, 'msgFrom': currentUserId, 'msgTo': selectUser }));
		}
	}
}

function subscribeChannel(currentRoomId) {
	console.log(currentRoomId)
		stompClient.subscribe("/queue/" + currentRoomId, function(response) { //채널 구독
			let msgInfo = JSON.parse(response.body);
			let msg = msgInfo.message
			console.log("메세지 : " + msg)
			//currentUserId : common_socket.jsp 파일에 있는 현재 로그인한 유저의 아이디를 담고있는 변수 
			if (msgInfo.fromUser != currentUserId) {
				let chatBox = document.getElementById("chat_box");
				let borderBox = document.createElement("div");
				borderBox.style.padding = "10px";
				borderBox.style.marginBottom = "10px";
				borderBox.style.border = "1px solid #DCDCDC"
				console.log("메세지 띄우자")
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
			}
			console.log("구독중")
		});
}

function createRoomId(selectedUser,currentRoomId){
	
	selectUser = selectedUser //팔로우 목록중 한명을 클릭했을 시 선택한 유저의 ID를 'selectUser' 변수에 담는다.
	enterChatRoomImpl(currentUserId,selectUser); //입장한 채팅방의 번호를 가져온다.
//	let chatIndex = document.getElementById("chat_index"); //유저를 선택하지 않았을 시의 채팅창 화면
//	let sendMessageBox = document.getElementById("send_message_box"); //메시지를입력하는 box
//	chatIndex.parentNode.removeChild(chatIndex); //유저를 선택하면 chatIndex 제거
//	sendMessageBox.style.visibility="visible" // 메세지를 입력하는 box를 보이게한다.
//	subscribeChannel(currentRoomId); // 선택한 유저를 구독
}


function enterChatRoomImpl(currentUserId,selectUser){
	
	let url = '/chat/enterchatroomimpl'
	let paramObj = new Object();
	paramObj.firstUser = currentUserId;
	paramObj.secondUser = selectUser;
	let headerObj = new Headers();
	headerObj.append("content-type","application/json");
	fetch(url,{
		method : "POST",
		headers : headerObj,
		body : JSON.stringify(paramObj)
	})
	.then(response=>{
		if(response.ok){
			return response.text()
		}
	})
	.then((text)=>{
		if(text!='failed'){
			//TODO 채팅방 만들기를 성공했을 시
			currentRoomId = text;
			let chatIndex = document.getElementById("chat_index"); //유저를 선택하지 않았을 시의 채팅창 화면
			let sendMessageBox = document.getElementById("send_message_box"); //메시지를입력하는 box
			chatIndex.parentNode.removeChild(chatIndex); //유저를 선택하면 chatIndex 제거
			sendMessageBox.style.visibility="visible" // 메세지를 입력하는 box를 보이게한다.
			subscribeChannel(currentRoomId); // 선택한 유저를 구독
			console.log(text);
		}else{
			//TODO 채팅방 만들기를 실패했을 시
		}
	})
}







