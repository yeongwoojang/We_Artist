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
