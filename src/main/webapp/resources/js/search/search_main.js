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
