function searchByTag(){
let searchBox = document.getElementById("search_box");
	selectBoardByTag(searchBox.value);
	console.log(searchBox.value);
}

function selectBoardByTag(tag){
	
	const url = "/search/tag?tag="+tag
	console.log(tag);
	fetch(url,{
		method : "GET"
	}).then(response=>{
		if(response.ok){
			return response.text();
		}
	}).then((text)=>{
		console.dir(JSON.parse(text));
		let boardList = JSON.parse(text);
		imageList = boardList;
		let imageLayout = document.getElementById("image_layout");
		while(imageLayout.hasChildNodes()){
			imageLayout.removeChild(imageLayout.firstChild);
		}
		console.dir(imageList);
		for(let i = 0; i<imageList.length; i++){
			console.log(imageList[i].tag);
			console.log(imageList[i].fIdx);
			console.log(imageList[i].nickName);
			
		let wrapImageBox = document.createElement("div");
		wrapImageBox.setAttribute("class","col-lg-3 col-md-4");
		
		let imageBox = document.createElement("div");
		imageBox.setAttribute("class","venue-gallery image_item")
		imageBox.setAttribute("data-imagelink",imageList[i].fSavePath+"/"+imageList[i].fRename);
		imageBox.setAttribute("data-fidx",imageList[i].fIdx);
		imageBox.setAttribute("data-nickname",imageList[i].nickName);
		
		let image = document.createElement("img");
		image.setAttribute("class","img-fluid");
		image.src = "/images/"+boardList[i].fSavePath+"/"+boardList[i].fRename
		
		imageBox.appendChild(image);
		wrapImageBox.appendChild(imageBox);
		imageLayout.appendChild(wrapImageBox);	
		}
				
		let imageItemList = document.querySelectorAll('.image_item');
		
		for(let i=0;i<imageItemList.length; i++){
			imageItemList[i].addEventListener('click',(e)=>{
				console.dir(imageItemList[i].dataset.fidx);
				showModal(imageItemList[i].dataset.imagelink,imageItemList[i].dataset.fidx,imageItemList[i].dataset.nickname);
			});
			
			}	
	});
}


function movePersonalPage(){
	let nickName = document.getElementById("user_nickname").innerHTML;
	location.href="/personal/personal?nickName="+nickName;
}


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
