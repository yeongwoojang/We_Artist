   let idCheckFlg = true;
   let idCheck = () => {
      //사용자가 입력한 아이디
      //요소의 아이디속성이 있을 경우 해당 엘리먼트를 가져다가 사용할 수 있다.
      let userId = document.getElementById("userId");
      if(userId.value){
         fetch("/user/idcheck?userId=" + userId.value,{
            method:"GET"
         })
         .then(response => response.text())
         .then(text =>{
            if(text == 'success'){
               idCheckFlg = true;
               id_check.innerHTML = '사용 가능한 아이디 입니다.';
            }else{
               idCheckFlg = false;
               id_check.innerHTML = '사용 불가능한 아이디 입니다.';
               userId.value="";
            }
         })
         
      }else{
         alert("아이디를 입력하지 않으셨습니다.");
      }
   }
   
  document.querySelector('#frm_join').addEventListener('submit',(e)=>{
	   let password = pw.value;
	   let regExp = /^(?!.*[ㄱ-힣])(?=.*\W)(?=.*\d)(?=.*[a-zA-Z])(?=.{8,})/;
	   
	   if(!idCheckFlg){
		   e.preventDefault();
		   alert("아이디 중복검사를 하지 않으셨습니다.");
		   id.focus()
	   }
	   
	   if(!(regExp.test(password))){
		   //form의 데이터 전송을 막음
		   e.preventDefault();
		   pw_confirm.innerHTML = '비밀번호는 숫자,영문자,특수문자 조합의 8글자 이상인 문자열입니다.';
		   pw.value='';
	   }
   });