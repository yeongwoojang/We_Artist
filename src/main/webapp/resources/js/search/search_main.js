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
		
		let imageLayout = document.getElementById("image_layout");
		while(imageLayout.hasChildNodes()){
			imageLayout.removeChild(imageLayout.firstChild);
		}
		for(let i = 0; i<boardList.length; i++){
			console.log(boardList[i].tag);
			console.log(boardList[i].fIdx);
			
		let wrapImageBox = document.createElement("div");
		wrapImageBox.setAttribute("class","col-lg-3 col-md-4");
		
		let imageBox = document.createElement("div");
		imageBox.setAttribute("class","venue-gallery image_item")
		imageBox.setAttribute("data-imagelink",boardList[i].fSavePath+"/"+boardList[i].fRename);
		imageBox.setAttribute("data-fidx",boardList[i].fIdx);
		
		let image = document.createElement("img");
		image.setAttribute("class","img-fluid");
		image.src = boardList[i].fSavePath+"/"+boardList[i].fRename
		
		imageBox.appendChild(image);
		wrapImageBox.appendChild(imageBox);
		imageLayout.appendChild(wrapImageBox);			
		}
	});
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
