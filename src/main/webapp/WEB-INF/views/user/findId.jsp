<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/topMenuHead.jsp"%>
	<style>
		.login_container {
		    width: 78%;
		    height: 52%;
		    display: flex;
		    flex-direction: column;
		    align-items: center;
		    margin: 0 auto;
		    border: 1px solid #E6E6E6;
		}
		
		.logo_header {
		    width: 90%;
		    display: flex;
		    justify-content: center;
		    padding: 10% 0 10%;
		}
		
		.logo_letter {
		    font-family: Lobster Two;
		    font-size: 50px;
		}
		
		.login_box {
		    display: flex;
		    flex-direction: column;
		}
		
		.login_input{
		    width: 75%;
		    height: 20%;
		    color: #999999;
		    background-color: #FAFAFA;
		    border: 1px solid #E6E6E6;
		    border-radius: 2%;
		    margin-bottom: 4%;
		    padding: 4%;
		}
		
		.btn {
		    margin-top: 5px;
		}
		
		.login_btn {
		    width: 268px;
		    height: 30px;
		    border-radius: 6px;
		    border: none;
		    margin: 5px 0 55px;
		    background-color: #0095F6;
		    color: white;
		    font-size: 14px;
		}
		.login_btn:disabled {
		    background-color: #C0DFFD;
		}
		
		.forgot_pw {
		    font-size: 14px;
		    color: #013569;
		    text-decoration: none;
		    align-items: baseline;
		}
	</style>
	
	
	<div class="container">
    	<div class="py-5 text-center">
        	<h2>아이디 / 비밀번호 찾기</h2>
    	</div>
    	
    	<div class="login_container">
        	<header class="logo_header">
            	로그인에 문제가 있나요?
				이메일 주소, 전화번호 또는 사용자 이름을 입력하시면 계정에 다시 액세스할 수 있는 링크를 보내드립니다.
        	</header>
        	
        	<section class="login_box">
            	<input type="text" placeholder="사용자 아이디를 입력하세요." class="login_input" id="userID">
            		<div class="btn">
                		<button type="button" onclick="moveMain();" class="login_btn" disabled>비밀번호 찾기</button>
            		</div>
        	</section>
    	</div>
   </div>

</body>
</html>