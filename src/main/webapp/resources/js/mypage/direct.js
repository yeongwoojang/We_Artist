let stompClient = null; //stomp객체
let userId = null;
let user = null;
let testUser = null;
let isSubscribe = false;
/*window.onload = function() { //페이지의 모든 요소들이 로드되면 호출
	connectSocket();

}*/

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

			stompClient.send("/message", {}, JSON.stringify({ 'message': msg, 'fromUser': userId, 'toUser': testUser }));
		}
	}
}

function test(val) {
	if (!isSubscribe) {
		testUser = val
		stompClient.subscribe("/queue/" + testUser, function(response) { //채널 구독
			let msgInfo = JSON.parse(response.body);
			user = msgInfo.user
			let msg = msgInfo.message
			console.log("메세지 : " + msg)
			if (msgInfo.fromUser != userId) {
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
			}
			console.log("구독중")
		});
	}

}