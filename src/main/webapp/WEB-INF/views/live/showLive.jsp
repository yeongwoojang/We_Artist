<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/topMenuHead.jsp"%>

<section id="speakers" class="d-flex">
	<video id="remoteVideo" autoplay muted playsinline></video>
	<div>
		<ul id="chatRoom">
			
		</ul>
	</div>
</section>

<button onclick="createOffer()">Create</button>
<br>
<input type="text" id="messageInput"/>
<button onclick="sendMessage()">Send</button>

<script type="text/javascript" src="/resources/js/live/liveGuest.js"></script>
<script type="text/javascript" src="/resources/js/gallery/load-image.all.min.js"></script>
<script type="text/javascript" src="/resources/js/gallery/rotationImg.js"></script>
<script type="text/javascript" src="/resources/js/gallery/upload.js"></script>
</body>
</html>