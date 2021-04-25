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
			let roomNoList = new Array();
			for(let i=0; i<myChatRoomList.length;i++){
				roomNoList.push(myChatRoomList[i].chatRoomNo);
			}
			console.dir(roomNoList);
			console.log(currentRoomId);
			if(roomNoList.indexOf(currentRoomId<0)){
				//내가 속한 채팅방 리스트를 다시 내려받고 
				//채팅방 구독 리스트를 업데이트
				console.log("채팅방 여기에 없다~")
				stompClient.disconnect();
				reSetMyChatRoomList();
				//상대방에게 채팅방을 개설했다는 신호를 푸시 소켓을 통해 전송
				stompPushClient.send("/push", {}, JSON.stringify(
					{'fromId' : currentUserId, 'toId': selectUser, 'nickName' : null, 'bdNo' :null, 'notiMethod' : 'direct' ,'message' : null}
				)); 		
			} 
			let chatRoomCard = document.querySelectorAll(".chat_room_card"); //팔로잉하고 있는 유저들의 item항목을 담고있는 div태그 리스트
			let lastMessage = document.querySelectorAll(".last_message"); //해당 유저에게 마지막으로 받은 message를 보여 줄 div태그 리스트
			
			for(let i =0; i< chatRoomCard.length; i++){
						let uName = chatRoomCard[i].childNodes[1].innerHTML
						//메세지를 보낸 유저와 팔로잉 한 유저가 일치한다면 그 유저가 보낸 메세지를 Cardview에 표시
						if((uName==currentUserNickName || uName == msgToNickName )){
							if(uName==currentUserNickName){
								lastMessage[i].setAttribute("class","last_message text-dark fw-bold");
							}else{
								lastMessage[i].setAttribute("class","last_message text-dark");
							}
							lastMessage[i].innerHTML = lastMsg
							lastMessageTime[i].innerHTML = getCurrentTime();
						}
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

function resetSenderList(){
	const url = '/chat/resetsenderlist';
	fetch(url,{
		method : "GET"
	}).then(response=>{
		if(response.ok){
			return response.text();
		}
	}).then((text)=>{
		let tempSenderList = JSON.parse(text);
		let senderListBox = document.getElementById("sender_list_box");
		for(let i=0;i<tempSenderList.length; i++){
			let senderItem = document.createElement("div");
			senderItem.setAttribute("class","chat_room_card card p-3 position-relative mb-2");
			let a = document.createElement("a");
			a.setAttribute("class","following_user text-dark mb-3 item_following_user fw-bold");
			a.setAttribute("data-userid",tempSenderList[i].userId);
			a.innerHTML = tempSenderList[i].nickName;
			let lastMessageDiv = document.createElement("div");
			lastMessageDiv.setAttribute("class","last_message text-secondary");
			let p = document.createElement("p");
			p.setAttribute("class","last_message_time position-absolute bottom-0 end-0 p-1 fw-light");
			p.setAttribute("style","margin-bottom: 0px; font-size:1px;");
			senderItem.append(a,lastMessageDiv,p);
			senderListBox.appendChild(senderItem);
		}
	});
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
