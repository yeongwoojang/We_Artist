/*let upload = document.querySelector('#upload');


upload.addEventListener('change',(e)=>{
	let files = e.target.files;
    let fileType = files[0].type;
	console.dir(files);
    let limg = loadImage(files[0],(img,data)=>{
		img.toBlob((blob)=>{
			console.dir(blob);		
        	let rotateFile = new File([blob],files[0].name, {type:'JPEG'});
        	let reader = new FileReader();
            reader.onload = (e)=>{
				document.querySelector('#preview').src = e.target.result;
            }
            reader.readAsDataURL(rotateFile);
            },fileType)
         },{orientation : 3});
	//sendImg(limg);
});*/

let fileList = [];

let srcToBlob = (src,outputBox,viewBox) => {
	let inputObj = src;
	let outputObj = document.querySelector(outputBox);
	
	loadImage(inputObj,(img)=>{
		console.dir(img);
		img.toBlob((blob)=>{
			let rotateFile = new File([blob],'gellary',{type : 'JPEG'});
			console.dir(rotateFile);
			let reader = new FileReader();
			reader.onload = (e) => {
				fileList.push(rotateFile);
				outputObj.src = e.target.result;
				document.querySelector(viewBox).className = 'd-flex position-absolute';
				console.dir(fileList);
            }
            reader.readAsDataURL(rotateFile);
		},'JPEG')		
	},{orientation : 4});
}

let sendImageTest = () => {
	
	let formData = new FormData();
	for(let i=0; i<fileList.length; i++){
		console.dir(fileList[i]);
		formData.append('test',fileList[i]);
	}
	
	console.dir(formData);
	fetch('/sendimage',{
		method : 'POST',
		body : formData
	})
	.then(res => res.text)
	.then(res => {alert(res)});
	
}

