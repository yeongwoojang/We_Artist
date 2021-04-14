<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/topMenuHead.jsp"%>

<section id="speakers">
	<video id="localVideoa" autoplay muted playsinline></video>
	<video id="remoteVideoa" autoplay playsinline></video>
</section>

<button onclick="createOffer()">Create</button>
<br>
<input type="text" id="messageInput"/>
<button onclick="sendMessage()">Send</button>
<hr />
<section class="position-relative">
	<div class="card w-50 mx-auto">
		<div class="card-header">
			Gallery Setting
		</div>
		<div class="row">
			<div class="col">
				<img src="/resources/theEvent/assets/img/hotels/whiteBG.jpg" alt="" class="img-thumbnail"/>
			</div>
			<div class="col">
				<img src="/resources/img/boyoung.jpg" alt="" class="img-thumbnail" id="gallery-img1"/>
			</div>
			<div class="col">
				<img src="/resources/theEvent/assets/img/hotels/3.jpg" alt="" class="img-thumbnail" id="gallery-img2"/>
			</div>
			<div class="col">
				<img src="/resources/img/boyoung.jpg" alt="" class="img-thumbnail" id="gallery-img3"/>
			</div>
			<div class="col">
				<img src="/resources/theEvent/assets/img/hotels/whiteBG.jpg" alt="" class="img-thumbnail"/>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<img src="/resources/img/boyoung.jpg" alt="" class="img-thumbnail" id="gallery-img12"/>
			</div>
			<div class="col">
				<img src="/resources/theEvent/assets/img/hotels/whiteBG.jpg" alt="" class="img-thumbnail"/>
			</div>
			<div class="col">
				<img src="/resources/theEvent/assets/img/hotels/whiteBG.jpg" alt="" class="img-thumbnail"/>
			</div>
			<div class="col">
				<img src="/resources/theEvent/assets/img/hotels/whiteBG.jpg" alt="" class="img-thumbnail"/>
			</div>
			<div class="col">
				<img src="/resources/img/boyoung.jpg" alt="" class="img-thumbnail" id="gallery-img4"/>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<img src="/resources/img/boyoung.jpg" alt="" class="img-thumbnail" id="gallery-img11"/>
			</div>
			<div class="col">
				<img src="/resources/theEvent/assets/img/hotels/whiteBG.jpg" alt="" class="img-thumbnail"/>
			</div>
			<div class="col">
				<img src="/resources/theEvent/assets/img/hotels/whiteBG.jpg" alt="" class="img-thumbnail"/>
			</div>
			<div class="col">
				<img src="/resources/theEvent/assets/img/hotels/whiteBG.jpg" alt="" class="img-thumbnail"/>
			</div>
			<div class="col">
				<img src="/resources/img/boyoung.jpg" alt="" class="img-thumbnail" id="gallery-img5"/>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<img src="/resources/img/boyoung.jpg" alt="" class="img-thumbnail" id="gallery-img10"/>
			</div>
			<div class="col">
				<img src="/resources/theEvent/assets/img/hotels/whiteBG.jpg" alt="" class="img-thumbnail"/>
			</div>
			<div class="col">
				<img src="/resources/theEvent/assets/img/hotels/whiteBG.jpg" alt="" class="img-thumbnail"/>
			</div>
			<div class="col">
				<img src="/resources/theEvent/assets/img/hotels/whiteBG.jpg" alt="" class="img-thumbnail"/>
			</div>
			<div class="col">
				<img src="/resources/img/boyoung.jpg" alt="" class="img-thumbnail" id="gallery-img6"/>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<img src="/resources/theEvent/assets/img/hotels/whiteBG.jpg" alt="" class="img-thumbnail"/>
			</div>
			<div class="col">
				<img src="/resources/img/boyoung.jpg" alt="" class="img-thumbnail" id="gallery-img9"/>
			</div>
			<div class="col">
				<img src="/resources/img/boyoung.jpg" alt="" class="img-thumbnail" id="gallery-img8"/>
			</div>
			<div class="col">
				<img src="/resources/img/boyoung.jpg" alt="" class="img-thumbnail" id="gallery-img7"/>
			</div>
			<div class="col">
				<img src="/resources/theEvent/assets/img/hotels/whiteBG.jpg" alt="" class="img-thumbnail"/>
			</div>
		</div>
	</div>
    <div class="card w-50 mx-auto position-absolute top-50 start-50 translate-middle d-none" id="BoardList">
		<div class="card-header">
			Upload
		</div>
		<div class="row">
			<c:forEach items="${userBoardData}" var="boardData">			
					<c:forEach items="${boardData.files}" var="boardFile" varStatus="status">				
						<div class="col-3 mb-1" onclick='alert("${boardData}")'>
							<img src="/images/${boardFile.fSavePath}${boardFile.fRename}" alt="" class="img-fluid"/>
						</div>
					</c:forEach>
			</c:forEach>
		</div>
	</div>
</section>

<script type="text/javascript" src="/resources/js/live/liveClient.js"></script>
<script type="text/javascript" src="/resources/js/gallery/load-image.all.min.js"></script>
<script type="text/javascript" src="/resources/js/gallery/rotationImg.js"></script>
<script type="text/javascript" src="/resources/js/gallery/upload.js"></script>
</body>
</html>