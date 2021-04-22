<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/topMenuHead.jsp"%>

<section id="speakers">
	<div class="container mx-auto w-70">
		<div class="row">
			<div class="col-8">
				<video id="localVideo" autoplay muted playsinline></video>
			</div>
			<div class="col-4">
				<div class="card h-100">
					<div class="card-header text-center">
						이것은 채팅방
					</div>
					<div id="chatRoom" class="card-body d-flex flex-column justify-content-end">
										
					</div>	
					<div class="card-footer">
						
						<div class="input-group mb-3">
						  <input type="text" class="form-control" id="messageInput"aria-label="Recipient's username" aria-describedby="button-addon2">
						  <div class="input-group-append">
						    <button class="btn btn-outline-secondary" type="button" id="button-addon2" onclick="sendMessage()">-></button>
						  </div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<input type="text" id="messageInput"/>
<button onclick="sendMessage()">Send</button>

<script type="text/javascript" src="${context}/resources/js/live/liveChat.js"></script>
<script type="text/javascript" src="${context}/resources/js/live/liveHost.js"></script>
</body>
</html>