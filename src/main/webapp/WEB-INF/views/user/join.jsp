<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/topMenuHead.jsp"%>
<div class="container">
    <div class="py-5 text-center">
        <h2>계정 만들기</h2>
    </div>
    <div class="row justify-content-center">
        <form class="needs-validation col-sm-6">
            <div class="form-group">
                <label for="userId">아이디</label>
                <input id="userId" type="text" class="form-control"
                       placeholder="ID" aria-describedby="nicknameHelp" required minlength="2" maxlength="8">
                <small id="userIdHelp" class="form-text text-muted">
                    공백없이 문자와 숫자로만 입력하세요.
                </small>
                <small class="invalid-feedback">아이디를 입력하세요.</small>
            </div>

            <div class="form-group">
                <label for="email">이메일</label>
                <input id="email" type="email" class="form-control"
                       placeholder="your@email.com" aria-describedby="emailHelp" required>
                <small id="emailHelp" class="form-text text-muted">
                    사용자의 이메일은 공개되지 않습니다.
                </small>
                <small class="invalid-feedback">이메일을 입력하세요.</small>
            </div>

            <div class="form-group">
                <label for="password">패스워드</label>
                <input id="password" type="password" class="form-control"
                       aria-describedby="passwordHelp" required minlength="6" maxlength="8">
                <small id="passwordHelp" class="form-text text-muted">
                    6자 이상 8자 이내로 입력하세요. 영문자, 숫자, 특수기호를 사용할 수 있으며 공백은 사용할 수 없습니다.
                </small>
                <small class="invalid-feedback">패스워드를 입력하세요.</small>
            </div>

            <div class="form-group">
                <button class="btn btn-primary btn-block" type="submit"
                        aria-describedby="submitHelp">가입하기
                </button>
            </div>
        </form>
    </div>


</div>

</body>
</html>