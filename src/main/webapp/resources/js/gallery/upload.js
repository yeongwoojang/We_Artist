let boardListClassName;

let init = () => {
	
	boardListClassName = "card w-50 mx-auto position-absolute top-50 start-50 translate-middle";
	
	for(let i=1; i<13; i++){
		document.querySelector('#gallery-img'+i).addEventListener('click',()=>{
			alert('클릭'+i)
			document.querySelector('#BoardList').className = boardListClassName;
			});
	}
	data = "${userBoardData}";
	console.dir(data);
	
}

init();