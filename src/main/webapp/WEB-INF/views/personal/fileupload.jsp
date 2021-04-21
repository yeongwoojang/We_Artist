<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/topMenuHead.jsp"%>
    
	<div class="card w-50 mx-auto text-center">
		<div class="card-header">
			Board Uplaod
		</div>
		<div>
			<form action="${context}/upload" method="post" enctype="multipart/form-data">
				<div class="input-group input-group-lg">
				  <input type="text" class="form-control" placeholder="Title" aria-label="Large" aria-describedby="inputGroup-sizing-sm">
				</div>
				<div class="input-group input-group-lg">
					<textarea class="form-control" placeholder="Content" rows="10" aria-label="With textarea"></textarea>
				</div>
				<div class="tag_area d-flex flex-wrap">
					<div class="mx-2 my-2 btn btn-primary">#짜잔</div>
					<div class="mx-2 my-2 btn btn-primary">#짜잔1</div>
					<div class="mx-2 my-2 btn btn-primary">#짜잔2</div>
					<div class="mx-2 my-2 btn btn-primary">#짜잔3</div>
					<div class="mx-2 my-2 btn btn-primary">#김선민만세</div>
					<div class="mx-2 my-2 btn btn-primary">#짜잔4</div>
					<div class="mx-2 my-2 btn btn-primary">#짜잔5</div>
					<div class="mx-2 my-2 btn btn-primary">#짜잔6</div>
					<div class="mx-2 my-2 btn btn-primary">+</div>				
				</div>
				<input type="text">
				<label class="btn btn-primary w-100">
					Choose file
					<input type="file" multiple class="d-none">
				</label>
				<div class="img_area mb-2">
				</div>
				<label class="btn btn-primary w-100">
					Done
					<button class="d-none">Done</button>
				</label>
			</form>	
		</div>
	</div>
</body>
</html>