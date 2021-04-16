let boardListClassName;
let galleryImg;
let galleryImgList = [];

let init = () => {
	
	boardListClassName = "card w-50 mx-auto position-fixed top-50 start-50 translate-middle";
	
	for(let i=1; i<13; i++){
		document.querySelector('#gallery-img'+i).addEventListener('click',()=>{
			alert('클릭'+i)
			galleryImg = 'gallery-img'+i;
			document.querySelector('#BoardList').className = boardListClassName;
			});
	}
	
}

let setGalleryInfo = (bdNo,fIdx,userId,src) => {
	let imgObj = new Object();
	imgObj.bdNo = bdNo;
	imgObj.fIdx = fIdx;
	imgObj.userId = userId;
	imgObj.path = src;
	imgObj.imgOrder = galleryImg.substring(11);
	console.dir(imgObj);
	
	setGalleryImgList(imgObj);
	console.dir(galleryImgList);
	document.querySelector('#'+galleryImg).src = src;
	document.querySelector('#BoardList').className = 'd-none';
}

let uploadGalleryInfo = () => {
	let headerObj = new Headers();

	headerObj.append("content-type","application/json");
	fetch('/galleryupload',{
		method : 'POST',
		headers : headerObj,
		body : JSON.stringify(galleryImgList)
	})
	.then(res => res.text)
	.then(res => {alert(res)});
}

let setGalleryImgList = (imgObj) => {
	let flg = true;
	galleryImgList.forEach((item)=>{
		if(item.imgOrder == imgObj.imgOrder){
			let temp = new Object();
			temp = imgObj;
			imgObj = item;
			item = temp;
			flg = false;
		}	
	})
	
	if(flg){
		galleryImgList.push(imgObj);	
	}
}

init();













