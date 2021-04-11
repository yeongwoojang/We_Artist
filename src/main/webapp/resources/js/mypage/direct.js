let userId = null;
let selectUser = null;
let isSubscribe = false;
let currentRoomId = null;
//메세지 전송 함수
function sendMessage() {
	if (event.keyCode == 13) {
		let msg = document.getElementById("msg_box").value;
		if (msg != "") {
			drawMyChatting(msg);
			let msgTime = getCurrentTime();
			stompClient.send("/message", {}, JSON.stringify({'roomId' : currentRoomId, 'message': msg, 'msgFrom': currentUserId, 'msgTo': selectUser,'msgTime' : msgTime }));
			insertChatContentImpl(currentRoomId,msg,currentUserId,selectUser,msgTime);
		}
	}
}

function createRoomId(selectedUser){
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
			if(chatIndex!=null){
				chatIndex.parentNode.removeChild(chatIndex); //유저를 선택하면 chatIndex 제거
			}
			sendMessageBox.style.visibility="visible" // 메세지를 입력하는 box를 보이게한다.
			let chatBox = document.getElementById("chat_box");
			chatBox.innerHTML = "";
			console.log(text);
			selectChatContentListImpl(currentRoomId,currentUserId,selectUser);
		}else{
			//TODO 채팅방 만들기를 실패했을 시
		}
	})
}

function insertChatContentImpl(roomId,msg,msgFrom,msgTo,msgTime){
	const url = '/chat/insertchatcontentimpl';
	let paramObj = new Object();
	paramObj.chatRoomNo = roomId;
	paramObj.msg = msg;
	paramObj.msgFrom = msgFrom;
	paramObj.msgTo = msgTo;
	paramObj.msgTime = msgTime;
	
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

function selectChatContentListImpl(chatRoomNo,firstUser,secondUser){
	const url = '/chat/selectchatcontentlistimpl';
	let paramObj = new Object();
	paramObj.chatRoomNo = chatRoomNo;
	paramObj.firstUser = firstUser;
	paramObj.secondUser = secondUser;
	
	let headerObj = new Headers();
	headerObj.append('content-type','application/json');
	fetch(url,{
		method : "POST",
		headers : headerObj,
		body : JSON.stringify(paramObj)
	})
	.then(response =>{
		if(response.ok){
			return response.text();
		}
	}).then((text)=>{
		if(text=='failed'){
			
		}else{
			console.dir(text);
			let chatContentList = JSON.parse(text);
			for(let i = 0; i<chatContentList.length; i++){
				if(chatContentList[i].msgFrom==currentUserId){
					drawMyChatting(chatContentList[i].msg);
					console.log(chatContentList[i].msg)
				}else{
					drawYourChatting(chatContentList[i].msg);
					console.log(chatContentList[i].msg)
				}
				
			}
		}
	})
}


function drawMyChatting(msg){
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
}

function drawYourChatting(msg){
		let chatIndex = document.getElementById("chat_index"); //유저를 선택하지 않았을 시의 채팅창 화면
		let chatBox = document.getElementById("chat_box");
		let borderBox = document.createElement("div");
		borderBox.style.padding = "10px";
		borderBox.style.marginBottom = "10px";
		borderBox.style.border = "1px solid #DCDCDC"
		console.log("메세지 띄우자")
		if (msg.length >= 20) {
			borderBox.style.width = "30%";
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












