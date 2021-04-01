<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/topMenuHead.jsp"%>
<div class="container">
    <h1 class="display-4">PROFILE</h1><br>
    <span class="lead">반갑습니다. 프로필 정보를 설정해주세요.</span>
    <hr class="my-4">
    <p class="text-muted">
        <form class="needs-validation"  action="" method="post" novalidate>
            <div class="form-group row">
                <label class="col-sm-6 col-form-label">Email</label>
                <div class="col-sm-10">
                    <input class="form-control" type="text" readonly>
                </div>
            </div>

            <div class="form-group row">
                <label for="name" class="col-sm-6 col-form-label">Name</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="name" name="userName" aria-describedby="nameHelp" minlength="2" maxlength="50">
                    <small id="nameHelp" class="form-text text-muted">이름을 입력하세요.</small>
                </div>
            </div>

            <div class="form-group row">
                <label for="inputPassword3" class="col-sm-6 col-form-label">Password</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" id="inputPassword3" name="userPassword" placeholder="Password" aria-describedby="passwordHelp" minlength="6" maxlength="8" required>
                    <small id="passwordHelp" class="form-text text-muted">회원 정보 변경을 위해서 새로운 6자 이상 8자 이내의 패스워드나, 기존의 패스워드를 입력하셔야 합니다.</small>
                    <small class="invalid-feedback">패스워드를 6자 이상 8자 이내로 입력하세요.</small>
                </div>
            </div>

            <div class="form-group row">
                <label for="inputPhone3" class="col-sm-6 col-form-label">Phone</label>
                <div class="col-sm-10">
                    <input type="tel" class="form-control" id="inputPhone3" name="phone" placeholder="Phone">
                </div>
            </div>

            <div class="form-group row">
                <label for="inputNickname" class="col-sm-6 col-form-label">Nickname</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="nickname" id="inputNickname">
                </div>
            </div>

            <div class="form-group row">
                <div class="col-sm-10">
                    <button type="submit" class="btn btn-primary">설정하기</button>
                </div>
            </div>
        </form>
    </p>
</div>

</body>
</html>