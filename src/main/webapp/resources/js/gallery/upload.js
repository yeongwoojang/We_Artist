let init = () => {
	
	for(let i=1; i<13; i++){
		document.querySelector('#gallery-img'+i).addEventListener('click',()=>{alert('클릭'+i)});
	}
	
}

init();