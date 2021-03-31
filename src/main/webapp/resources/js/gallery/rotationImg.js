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

let srcToBlob = (src,outputBox,viewBox) => {
	let inputObj = src;
	let outputObj = document.querySelector(outputBox);
	
	loadImage(inputObj,(img)=>{
		img.toBlob((blob)=>{
			let rotateFile = new File([blob],'나의이름은',{type : 'JPEG'});
			let reader = new FileReader();
			reader.onload = (e) => {
				outputObj.src = e.target.result;
				document.querySelector(viewBox).className = 'd-flex position-absolute';
            }
            reader.readAsDataURL(rotateFile);
		},'JPEG')		
	},{orientation : 4});
}


