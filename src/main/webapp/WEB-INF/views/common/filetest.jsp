<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/topMenuHead.jsp"%>
    
	<form action="${context}/upload" method="post" enctype="multipart/form-data">
		제목 : <input type="text" name="bdTitle"/> <br>
		내용 : <input type="text" name="bdContent"/> <br>
		태그 : <input type="text" name="tag"/> <br>
		파일 : <input type="file" name="files" multiple/> <br>
		<button>전송</button>
	</form>
</body>
</html>