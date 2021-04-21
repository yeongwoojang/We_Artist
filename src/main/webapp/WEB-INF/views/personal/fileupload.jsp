<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/topMenuHead.jsp"%>
    
	<div class="card w-50 mx-auto text-center">
		<div class="card-header">
			Board Uplaod
		</div>
		<div>
			<form action="${context}/upload" method="post" enctype="multipart/form-data" onsubmit="return false">
				<div class="input-group input-group-lg">
				  <input type="text" class="form-control" placeholder="Title" aria-label="Large" aria-describedby="inputGroup-sizing-sm" name="bdTitle">
				</div>
				<div class="input-group input-group-lg">
					<textarea class="form-control border-0 outline-none" placeholder="Content" rows="10" aria-label="With textarea" name="bdContent"></textarea>
				</div>
				<div class="tag_area d-flex flex-wrap">
					<div class="d-none" id="add_tag_input">
						<input type="text" class="border-0 bg-primary text-white outline-none" id="add_tag_text" size="3"/>
					</div>
					<div class="mx-2 my-2 btn btn-primary" id="add_tag">+</div>				
				</div>
				<input type="text" id="tag" name="tag" class="d-none">
				<label class="btn btn-primary w-100">
					Choose file
					<input type="file" multiple class="d-none" name="files" onchange="preview(this)">
				</label>
				<div class="img_area mb-2 d-flex flex-wrap">
				</div>

				<button class="btn btn-primary w-100" onclick="submitBtn()">Done</button>
			</form>	
		</div>
	</div>
	<script src="${context}/resources/js/personal/fileUpload.js"></script>
</body>
</html>