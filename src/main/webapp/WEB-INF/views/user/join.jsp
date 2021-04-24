<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/topMenuHead.jsp"%>
<section id="contact" class="section-bg">

      <div class="container" data-aos="fade-up">

        <div class="section-header">
          <h2>Sign Up</h2>
          <p>계정 만들기</p>
        </div>

        <div class="form">
          <form action="${context}/user/mailauth" method="post" role="form" class="php-email-form">
            
            <div class="form-group mt-3">
            
            <label for="userId">ID</label>
              <input type="text" name="userId" class="form-control" id="userId" placeholder="ID" aria-describedby="userIdHelp" maxlength="16" required>
            
              <button class="btn btn-dark" type="button" onclick="idCheck()">check</button>
              <span class="text-danger" id="id_check"></span>
                <small id="userIdHelp" class="form-text text-muted">
                    공백없이 문자와 숫자로만 입력하세요.
                </small>
                <small class="invalid-feedback">아이디를 입력하세요.</small>
            </div>
            <div class="form-group mt-3">
            	<label for="email">Email</label>
              <input type="email" class="form-control" name="email" id="email" placeholder="your@email.com" aria-describedby="emailHelp" required>
              <small id="emailHelp" class="form-text text-muted">
                    사용자의 이메일은 공개되지 않습니다.
                </small>
                <small class="invalid-feedback">이메일을 입력하세요.</small>
            </div>
            
            <div class="form-group mt-3">
            	<label for="password">Password</label>
              <input type="password" class="form-control" name="password" id="pw" aria-describedby="passwordHelp" maxlength="16" required>
              <small id="passwordHelp" class="form-text text-muted">
                    8자 이상 16자 이내로 입력하세요. 영문자, 숫자, 특수기호를 사용할 수 있으며 공백은 사용할 수 없습니다.
                </small>
                <small class="invalid-feedback">패스워드를 입력하세요.</small>
                <span id="pw_confirm" class="valid_info"></span>
            </div>
            <div class="form-group mt-3">
            	<label for="name">Name</label>
              <input type="text" class="form-control" name="name" id="name" aria-describedby="nameHelp"  maxlength="10" required>
              <small class="invalid-feedback">이름을 입력하세요.</small>
            </div>
            <div class="form-group mt-3">
            	<label for="phone">Phone</label>
              <input type="tel" class="form-control" name="phone" id="phone" aria-describedby="phoneHelp" maxlength="11" required>
              <small class="invalid-feedback">전화번호를 입력하세요.</small>
            </div>
            <div class="form-group mt-3">
            	<label for="nickName">Nickname</label>
              <input type="text" class="form-control" name="nickName" id="nickName" aria-describedby="nickNameHelp" maxlength="15" required>
              <button class="btn btn-dark" type="button" onclick="nicknameCheck()">check</button>
                <span class="text-danger" id="nickname_check"></span>
                <small class="invalid-feedback">닉네임을 입력하세요.</small>
            </div>
            <div class="my-3">
              <div class="loading">Loading</div>
              <div class="error-message"></div>
              <div class="sent-message">Your message has been sent. Thank you!</div>
            </div>
            <div class="text-center"><button type="submit">Submit</button></div>
          </form>
        </div>

      </div>
    </section>
<script src="${context}/resources/js/user/join.js"></script>
</body>
</html>