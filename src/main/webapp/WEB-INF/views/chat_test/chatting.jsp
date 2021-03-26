<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/dist/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<link href="/resources/assets/css/style.css">
</head>
<body>

	<textarea name="msg" id="msgi" rows="2" class="form-control col-sm-8"></textarea>


<script>
$(function() {
	let messageInput = $('textarea[name="msg"]');
	let roomNo = "${roomNo}";
	let member = $('.content').data('member');
	let sock = new SockJS(
			"${pageContext.request.contextPath}/endpoint");
	client = Stomp.over(sock);
	function sendmsg() {
		let message = messageInput.val();
		//alert("메시지"+message);
		if (message == "") {
			return false;
		}
		//insertChat();
		client.send('/app/hello/' + roomNo, {}, JSON
				.stringify({
					chatContent : message,
					memberId : "${loginMember.memberId}",
					srNo : "${roomNo}"
				}));
		messageInput.val('');
	}	
</script>
</body>
</html>