 let myModalEl = document.getElementById('exampleModal')
  myModalEl.addEventListener('hidden.bs.modal', function (event) {
	  let carouselInner = document.querySelector(".carousel-inner");
	  while(carouselInner.hasChildNodes()){
		  carouselInner.removeChild(carouselInner.firstChild);
	  }
  });
  
  let modalCloseBtn = document.getElementById('btn_modal_close');
  modalCloseBtn.addEventListener('click',function(){
	  $('#exampleModal').modal("hide");
  })
  myModalEl.addEventListener('shown.bs.modal',function(event){
  });
    
  	let selectedBoard;
  	let boardInfo;
  	let fileList;
  	
	 function showModal(bdNo,boardInfo){
		fetchSelectBoard(bdNo);
		
	}
	    function fetchSelectBoard(bdNo){
		const url = '/fetchselectedboard?bdNo='+bdNo;
		fetch(url,{
			method : "GET"
		}).then(response=>{
			if(response.ok){
				return response.text();
			}
		}).then((text)=>{
			selectedBoard = JSON.parse(text);
			console.dir(selectedBoard);
			let carouselInner = document.querySelector(".carousel-inner");
			let boardContent = document.getElementById("board_content");
			let boardTitle = document.getElementById("board_title");
			let likeIcon = document.getElementById("like_icon")
			likeIcon.setAttribute("onclick","updateLike();")
			boardContent.innerHTML = selectedBoard.board.bdContent;
			boardTitle.innerHTML = selectedBoard.board.bdTitle;
			boardInfo = selectedBoard.board; //선택한 게시물 정보
			fileList = selectedBoard.files; //선택한 게시물에 속해있는 파일 리스트 정보
			for(let i = 0; i<fileList.length; i++){
					let carouselItem = document.createElement("div")
					let img = document.createElement("img");
					img.setAttribute("class","d-block w-100 img-fluid");
					img.setAttribute("style","height:100%;");
					img.src = "/images/"+fileList[i].fSavePath+"/"+fileList[i].fRename;
					console.log("/images/"+fileList[i].fSavePath+"/"+fileList[i].fRename);
// 					img.style="width:100%;height:100%;object-fit:cover;";
				if(i==0){
					carouselItem.setAttribute("class","carousel-item active");
				}else{
					carouselItem.setAttribute("class","carousel-item");
				}
	       			carouselItem.appendChild(img);
	       			carouselInner.appendChild(carouselItem);
	       			console.dir(carouselInner.childNodes);
			}
			test();
		});
	}
	
	async function test(){
		let likeIcon = document.getElementById("like_icon");
		let result = await certificatelike(selectedBoard.board.bdNo);
		console.log("test : "+ result)
			if(result=="true"){
				likeIcon.setAttribute("class","fas fa-heart text-dark");
			}else{
				likeIcon.setAttribute("class","fas fa-heart text-danger");
			}
			$('#exampleModal').modal("show")
	}
	function following(){
		let userId = "${personalUserInfo.userId}";
		let nickName = "${curUserInfo.nickName}";
		if(currentUserId!=""){
// 			stompPushClient.send("/push", {}, JSON.stringify({'fromId' : currentUserId, 'toId': userId, 'nickName' : nickName})); //해당 유저에게 팔로잉 요청을 보낸다.
// 	 		createNewRoom(currentUserId,userId);
// 	 		reSetMyChatRoomList();	
	 		followingImpl(userId,currentUserId);
		}else{
			location.href = "/user/login";
		}
		console.log("테스트 종료")

	}
	
	function followingImpl(toId,fromId){
		const url = '/communication/followingimpl';
		let paramObj = new Object();
		paramObj.toId = toId;
		paramObj.fromId = fromId;
		
		let headerObj = new Headers();
		headerObj.append('content-type','application/json');
		
		fetch(url,{
			method:"POST",
			headers : headerObj,
			body : JSON.stringify(paramObj)
		}).then(response=>{
			if(response.ok){
				return response.text();
			}
		}).then((text)=>{
			if(text=="success"){
				//팔로잉 성공 시
				let userId = "${personalUserInfo.userId}";
				let nickName = "${curUserInfo.nickName}";
				stompPushClient.send("/push", {}, JSON.stringify({'fromId' : fromId, 'toId': toId, 'nickName' : nickName})); //해당 유저에게 팔로잉 요청을 보낸다.
	 			createNewRoom(currentUserId,userId);
	 			reSetMyChatRoomList();	
				let fBtn = document.getElementById("btn_about_following");
				fBtn.innerHTML ="팔로우 끊기";
				fBtn.setAttribute("onclick","unfollowing()")
				reSetFollowingCountimpl();
			}else{
				//팔로잉 실패 시
			}
		})
	}
	
	function unfollowing(){
		let toId = "${personalUserInfo.userId}";
		let fromId = currentUserId;
		unFollowingImpl(toId,fromId);
	}
	
	
	function unFollowingImpl(toId,fromId){
		const url ='/communication/unfollowingimpl';
		let paramObj = new Object();
		paramObj.toId = toId;
		paramObj.fromId = fromId;
		
		let headerObj = new Headers();
		headerObj.append('content-type','application/json');
		
		fetch(url,{
			method:"POST",
			headers : headerObj,
			body : JSON.stringify(paramObj)
		}).then(response=>{
			if(response.ok){
				return response.text();
			}
		}).then((text)=>{
			if(text=="success"){
				//언팔로우 성공 시
				let fBtn = document.getElementById("btn_about_following");
				fBtn.innerHTML ="팔로잉";
				fBtn.setAttribute("onclick","following()")
				reSetFollowingCountimpl();
			}else{
				//언팔로우 실패 시
			}
		})
	}
	
	
	function reSetFollowingCountimpl(){
		let nickName = "${personalUserInfo.nickName}";
		const url = '/personal/resetfollowingcountimpl?nickName='+nickName;
		fetch(url,{
			method:"GET",
		}).then(response=>{
			if(response.ok){
				return response.text();
			}
		}).then((text)=>{
			document.getElementById("follower_count").innerHTML = text;
		});
		
	}
	
	
	function modifyProfile(){
		location.href ="/user/profile?userId="+currentUserId;
	}
	
	
	   async function updateLike(){
		bdNo = selectedBoard.board.bdNo;
		 let result =  await certificatelike(bdNo);
		if(result=="true"){
			insertLike(bdNo); 
		}else{
			deleteLike(bdNo);
		}
	}
	
	    async function certificatelike(bdNo){
		const url = '/certificatelike?bdNo='+bdNo+'&lkId='+currentUserId;
		let response = await fetch(url,{method:"GET"});
		if(response.ok){
			let result = await response.text();
			if(result=="ok"){
				return "true";
			}else{
				return "false";
			}
		}
	}
	
	
	function insertLike(bdNo){
		//전달 받은 bdNo의 like업데이트
		console.log("INSERET 실행")
		const url = '/insertlike?bdNo='+bdNo+'&lkId='+currentUserId;
		fetch(url,{
			method:"GET"
		}).then(response=>{
			if(response.ok){
				return response.text();
			}
		}).then((text)=>{
			if(text=="success"){
				//좋아요 성공 시
				let likeIcon = document.getElementById("like_icon");
				likeIcon.setAttribute("class","fas fa-heart text-danger");
			}else{
				//좋아요 실패 시
			}
		})
		
	}
	
	
	function deleteLike(bdNo){
			console.log("DELETE 실행")
		const url = '/deletelike?bdNo='+bdNo+'&lkId='+currentUserId;
		fetch(url,{
			method:"GET"
		}).then(response=>{
			if(response.ok){
				return response.text();
			}
		}).then((text)=>{
			if(text=="success"){
				//좋아요 취소 성공 시
					let likeIcon = document.getElementById("like_icon");
					likeIcon.setAttribute("class","fas fa-heart text-dark");
			}else{
				//좋아요 취소 실패 시
			}
		})
	}
	
	
	
	
	