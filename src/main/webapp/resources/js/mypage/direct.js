let userId = null;
let selectUser = null;
let isSubscribe = false;
let currentRoomId = null;
let msgToNickName = null;
//메세지 전송 함수
function sendMessage() {
	if (event.keyCode == 13) {
		let msg = document.getElementById("msg_box").value;
		if (msg.trim()!="") {
			drawMyChatting(msg);
			let msgTime = getCurrentTime();
			stompClient.send("/message", {}, JSON.stringify({'roomId' : currentRoomId, 'message': msg, 'msgFrom': currentUserId, 'msgFromNickName' : currentUserNickName,'msgTo': selectUser,'msgToNickName' :msgToNickName ,'msgTime' : msgTime }));
			console.dir(currentRoomId)
			let chatBox = document.getElementById("chat_box")
			chatBox.scrollTop = chatBox.scrollHeight; 
			insertChatContentImpl(currentRoomId,msg,currentUserId,selectUser,msgTime);
		}
	}
}

function createRoomId(selectedUserInfo){
	selectUser = selectedUserInfo.userId //채팅방을 연결할 유저의 아이디
	msgToNickName = selectedUserInfo.nickName; //채팅방을 연결할 유저의 닉네임
	enterChatRoomImpl(currentUserId,selectUser); //입장한 채팅방의 번호를 가져온다.
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
			currentRoomId = text; //채팅방 번호를 반환 받는다.
			let chatIndex = document.getElementById("chat_index"); //유저를 선택하지 않았을 시의 채팅창 화면
			let sendMessageBox = document.getElementById("send_message_box"); //메시지를입력하는 box
			if(chatIndex!=null){
				chatIndex.parentNode.removeChild(chatIndex); //유저를 선택하면 chatIndex 제거
			}
			let opponent = document.getElementById("opponent");
			opponent.style.visibility="visible";
			opponent.innerHTML = msgToNickName;
			sendMessageBox.style.visibility="visible" // 메세지를 입력하는 box를 보이게한다.
			let chatBox = document.getElementById("chat_box");
			chatBox.innerHTML = "";
			selectChatContentListImpl(currentRoomId,currentUserId,selectUser);
			//만약 새로 생성한 채팅방 번호라면...
			if(myChatRoomList.indexOf(currentRoomId<0)){
				
				//내가 속한 채팅방 리스트를 다시 내려받고 
				//채팅방 구독 리스트를 업데이트
				 stompClient.disconnect();
				reSetMyChatRoomList();
				
				//상대방에게 채팅방을 개설했다는 신호를 푸시 소켓을 통해 전송
				stompPushClient.send("/push", {}, JSON.stringify(
					{'fromId' : currentUserId, 'toId': selectUser, 'nickName' : null, 'bdNo' :null, 'notiMethod' : 'direct' ,'message' : null}
				)); 		
			} 
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
			let chatContentList = JSON.parse(text);
			for(let i = 0; i<chatContentList.length; i++){
				if(chatContentList[i].msgFrom==currentUserId){
					drawMyChatting(chatContentList[i].msg);
				}else{
					drawYourChatting(chatContentList[i].msg);
				}
				
			}
			let chatBox = document.getElementById("chat_box");
			chatBox.scrollTop = chatBox.scrollHeight; 
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
}

function drawYourChatting(msg){
		let chatIndex = document.getElementById("chat_index"); //유저를 선택하지 않았을 시의 채팅창 화면
		let chatBox = document.getElementById("chat_box");
		let borderBox = document.createElement("div");
		borderBox.style.padding = "10px";
		borderBox.style.marginBottom = "10px";
		borderBox.style.border = "1px solid #DCDCDC"
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


	let followingUserItemList = document.querySelectorAll(".item_following_user")
	for(let i=0;i<followingUserItemList.length; i++){
		followingUserItemList[i].addEventListener("click",(e)=>{
			if(e.target.dataset.userid==senderList[i].userId){
			createRoomId(senderList[i]);
			}
		});
	}
