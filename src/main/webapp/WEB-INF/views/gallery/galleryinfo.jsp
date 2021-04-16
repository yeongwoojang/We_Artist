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
		<div class="row justify-content-center">
			<c:forEach items="${userGalleryData}" var="data" begin="3" end="5" varStatus="status">			
				<div class="col-3">
					<c:choose>
						<c:when test="${empty data}">
							<img src="/resources/img/boyoung.jpg" alt="" class="img-thumbnail" id="gallery-img${status.index+1}"/>
						</c:when>
						<c:otherwise>
							<img src="${data.path}" alt="" class="img-thumbnail" id="gallery-img${status.index+1}"/>
						</c:otherwise>
					</c:choose>
				</div>
			</c:forEach>
		</div>
		
		<c:forEach items="${userGalleryData}" var="data" begin="8" end="8" varStatus="status">
			<div class="row justify-content-between">
				<div class="col-3">
					<c:choose>
						<c:when test="${empty data}">
							<img src="/resources/img/boyoung.jpg" alt="" class="img-thumbnail" id="gallery-img${status.index+1}"/>
						</c:when>
						<c:otherwise>
							<img src="${data.path}" alt="" class="img-thumbnail" id="gallery-img${status.index+1}"/>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="col-3">
					<c:choose>
						<c:when test="${empty data}">
							<img src="/resources/img/boyoung.jpg" alt="" class="img-thumbnail" id="gallery-img${status.index+2}"/>
						</c:when>
						<c:otherwise>
							<img src="${data.path}" alt="" class="img-thumbnail" id="gallery-img${status.index+2}"/>
						</c:otherwise>
					</c:choose>
				</div>
			</div>			
		</c:forEach>
		
		<c:forEach items="${userGalleryData}" var="data" begin="7" end="7" varStatus="status">
			<div class="row justify-content-between">
				<div class="col-3">
					<c:choose>
						<c:when test="${empty data}">
							<img src="/resources/img/boyoung.jpg" alt="" class="img-thumbnail" id="gallery-img${status.index+1}"/>
						</c:when>
						<c:otherwise>
							<img src="${data.path}" alt="" class="img-thumbnail" id="gallery-img${status.index+1}"/>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="col-3">
					<c:choose>
						<c:when test="${empty data}">
							<img src="/resources/img/boyoung.jpg" alt="" class="img-thumbnail" id="gallery-img${status.index+4}"/>
						</c:when>
						<c:otherwise>
							<img src="${data.path}" alt="" class="img-thumbnail" id="gallery-img${status.index+4}"/>
						</c:otherwise>
					</c:choose>
				</div>
			</div>			
		</c:forEach>
		
		<c:forEach items="${userGalleryData}" var="data" begin="6" end="6" varStatus="status">
			<div class="row justify-content-between">
				<div class="col-3">
					<c:choose>
						<c:when test="${empty data}">
							<img src="/resources/img/boyoung.jpg" alt="" class="img-thumbnail" id="gallery-img${status.index+1}"/>
						</c:when>
						<c:otherwise>
							<img src="${data.path}" alt="" class="img-thumbnail" id="gallery-img${status.index+1}"/>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="col-3">
					<c:choose>
						<c:when test="${empty data}">
							<img src="/resources/img/boyoung.jpg" alt="" class="img-thumbnail" id="gallery-img${status.index+6}"/>
						</c:when>
						<c:otherwise>
							<img src="${data.path}" alt="" class="img-thumbnail" id="gallery-img${status.index+6}"/>
						</c:otherwise>
					</c:choose>
				</div>
			</div>			
		</c:forEach>
		
		<div class="row justify-content-center d-flex flex-row-reverse">
			<c:forEach items="${userGalleryData}" var="data" begin="0" end="2"  varStatus="status">			
				<div class="col-3">
					<c:choose>
						<c:when test="${empty data}">
							<img src="/resources/img/boyoung.jpg" alt="" class="img-thumbnail" id="gallery-img${status.index+1}"/>
						</c:when>
						<c:otherwise>
							<img src="${data.path}" alt="" class="img-thumbnail" id="gallery-img${status.index+1}"/>
						</c:otherwise>
					</c:choose>
				</div>
			</c:forEach>
		</div>
		<div class="card-footer">
			<button onclick="uploadGalleryInfo()">Save</button>
		</div>
	</div>
    <div class="d-none" id="BoardList" style="background-color: rgba(255,255,255,0.7)">
		<div class="card-header row">
			Upload
		</div>
		<div class="row">
			<c:forEach items="${userBoardData}" var="boardData">			
					<c:forEach items="${boardData.files}" var="boardFile" varStatus="status">				
						<div class="col-3 mb-1" onclick='setGalleryInfo(
														"${boardData.board.bdNo}",
														"${boardFile.fIdx}",
														"${boardFile.userId}",
														"/images/${boardFile.fSavePath}${boardFile.fRename}")'>
							<img src="/images/${boardFile.fSavePath}${boardFile.fRename}" alt="" class="img-fluid"/>
						</div>
					</c:forEach>
			</c:forEach>
		</div>
	</div>
</section>

<!-- <script type="text/javascript" src="/resources/js/live/liveClient.js"></script> -->
<script type="text/javascript" src="/resources/js/gallery/load-image.all.min.js"></script>
<script type="text/javascript" src="/resources/js/gallery/rotationImg.js"></script>
<script type="text/javascript" src="/resources/js/gallery/upload.js"></script>
</body>
</html>