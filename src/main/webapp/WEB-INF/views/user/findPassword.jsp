<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/topMenuHead.jsp"%>
	<div class="container">
    	<div class="py-5 text-center">
        	<h2>비밀번호 찾기</h2>
    	</div>
    	
	    <div class="row justify-content-center">
	        <form class="needs-validation col-sm-6" id="findPw" action="${context}/user/findimpl" method="post">
	                <div class="input-group mb-3">
	                    <input type="text" name="email" class="form-control" placeholder="가입 하실때 쓰신 이메일 주소를 입력하세요.">
	                    	<div class="input-group-append">
	                        	<div class="input-group-text">
	                        		<span class="fas fa-exclamation">
	                        		</span>
	                    		</div> 
	                		</div>
	    			</div>
	    		
	
	        		<div class="col-4">
	            		<button type="btn-find" class="btn btn-primary btn-block"> 비밀번호 찾기</button>
	        		</div>
	    	</form>
	       
		</div>
	</div>
    	
		
	
   
  

</body>
</html>