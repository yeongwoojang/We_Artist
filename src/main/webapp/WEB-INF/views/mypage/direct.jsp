<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/topMenuHead.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body class="bg-light">
	<section style="width: 100vw;height: 90vh;margin-top: 20px;" class="mt-10">
        
		<div class="d-flex container" style="height:100%;">
			<div class="card col-4">
				<div class="card-header p-2 bg-white">Sayeong</div> <!--유저 아이디 올 곳 -->
				<div class="card-body" style="width:100%; height:100%; overflow:auto;">
					<p>asdfsdf</p>
					<p>asdfsdf</p>
					<p>asdfsdf</p>
					<p>asdfsdf</p>
					<p>asdfsdf</p>
					<p>asdfsdf</p>
					<p>asdfsdf</p>
					<p>asdfsdf</p>
					<p>asdfsdf</p>
					<p>asdfsdf</p>
					<p>asdfsdf</p>
					<p>asdfsdf</p>
					<p>asdfsdf</p>
					<p>asdfsdf</p>
					<p>asdfsdf</p>
					<p>asdfsdf</p>
					<p>asdfsdf</p>
					<p>asdfsdf</p>
					<p>asdfsdf</p>
					<p>asdfsdf</p>
					<p>asdfsdf</p>
					<p>asdfsdf</p>
					<p>asdfsdf</p>
				</div>
			</div>
			<div class="card col-7">
				<div class="card-body" style="width:100%; height:100%; overflow:auto;">Sayeong</div>
				<div class="card-footer">
					<div class="input-group border rounded-pill p-2 bg-white">
 			 			<input id="msg_box"type="text" class="form-control border border-0 bg-white shadow-none" placeholder="메시지를 입력하세요"
 			 				style="outline:none" onKeydown="JavaScript:sendMessage();">
					</div>
				</div>
			</div>
		</div>
	</section>
	<script>
		//메세지 전송 함수
		function sendMessage(){
			if(event.keyCode == 13){
				let msg = document.getElementById("msg_box").value;
				alert(msg);
				document.getElementById("msg_box").value ="";
			}
		}
	</script>
</body>
</html>