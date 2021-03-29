let upload = document.querySelector('#upload');


let sendImg = (data) => {
	let headerObj = new Headers();
	let paramObj = new FormData();
	
	headerObj.append("content-type","multipart/form-data");
	paramObj.append('file',data);
	
	fetch("/galleryupload",{
		method:"POST",
		headers : headerObj,
		body : paramObj
		})
		.then(rep => rep.text())
		.then(text => {
			alert(text);
		})
}

upload.addEventListener('change',(e)=>{
            let files = e.target.files;
            let fileType = files[0].type;
            let limg = loadImage(files[0],(img,data)=>{
                img.toBlob((blob)=>{
                    let rotateFile = new File([blob],files[0].name, {type:fileType});
                    let reader = new FileReader();
                    reader.onload = (e)=>{
                        document.querySelector('#preview').src = e.target.result;
                    }
                    reader.readAsDataURL(rotateFile);
                },fileType)
            },{orientation : 3});
		sendImg(limg);
        });