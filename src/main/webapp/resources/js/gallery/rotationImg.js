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

let srcToBlob = (src,outputSelector) => {
	let inputObj = src;//document.querySelector(inputSelector).src;
	let outputObj = document.querySelector(outputSelector);
	
	loadImage(inputObj,(img,data)=>{
		img.toBlob((blob)=>{
			let rotateFile = new File([blob],'나의이름은',{type : 'JPEG'});
			let reader = new FileReader();
            reader.onload = (e)=>{
				outputObj.src = e.target.result;	
            }
            reader.readAsDataURL(rotateFile);
		},'JPEG')
		
	},{orientation : 4});
}

let srcToBlob2 = (src,outputSelector) => {
	let inputObj = src;
	let outputObj = document.querySelector(outputSelector);
	
	loadImage(inputObj,(img,data)=>{
		img.toBlob((blob)=>{
			let rotateFile = new File([blob],'나의이름은',{type : 'JPEG'});
			let reader = new FileReader();
            reader.onload = (e)=>{
				outputObj.src = e.target.result;	
            }
            reader.readAsDataURL(rotateFile);
		},'JPEG')
		
	},{orientation : 4});
}

