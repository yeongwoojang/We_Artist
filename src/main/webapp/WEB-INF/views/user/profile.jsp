<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/topMenuHead.jsp"%>
<div class="profile" style="
    background-color: rgb(51, 51, 51);
">

<div class="container" style="
    background-color: white;
    max-width: 600px;
    border-left: 0.2rem solid black;
    border-right: 0.2rem solid black;
">
    <h1 class="display-4">PROFILE</h1><br>
    <span class="lead">반갑습니다. 프로필 정보를 설정해주세요.</span>
    <hr class="my-4">
    <p class="text-muted">
    	<div class="col-lg-10 row">
                <div class="col-lg-6">
                    <img class="mx-auto rounded-circle" src="/resources/img/boyoung.jpg" alt="" style="
					    width: 14rem;
					    height: 14rem;
					    border: 0.5rem solid rgba(0, 0, 0, 0.1);
					">
                </div>
                <div class="col-lg-4">
					<form action="" id="form" name="form"
						method="post" enctype="multipart/form-data" autocomplete="off">
						<label for="ex_file">프로필 사진 바꾸기</label> 
						<input type="file" id="ex_file" name="filename" required />
						<button type="submit" class="btn btn-primary">업로드</button>
					</form>
				</div>
            </div>
        <form class="needs-validation"  action="" method="post" novalidate>
        	
            <div class="form-group row">
                <label class="col-sm-6 col-form-label">Email</label>
                <div class="col-sm-10">
                    <input class="form-control" type="text" value="${sessionScope.userInfo.email }" readonly>
                </div>
            </div>

            <div class="form-group row">
                <label for="name" class="col-sm-6 col-form-label">Name</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="name" name="name" value="${sessionScope.userInfo.name }" aria-describedby="nameHelp" minlength="2" maxlength="50">
                    <small id="nameHelp" class="form-text text-muted">이름을 입력하세요.</small>
                </div>
            </div>

            <div class="form-group row">
                <label for="inputPassword3" class="col-sm-6 col-form-label">Password</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" id="inputPassword3" name="password" placeholder="Password" aria-describedby="passwordHelp" minlength="6" maxlength="8" required>
                    <small id="passwordHelp" class="form-text text-muted">회원 정보 변경을 위해서 새로운 8자 이상 16자 이내의 패스워드나, 기존의 패스워드를 입력하셔야 합니다.</small>
                    <small class="invalid-feedback">패스워드를 8자 이상 16자 이내로 입력하세요.</small>
                </div>
            </div>

            <div class="form-group row">
                <label for="inputPhone3" class="col-sm-6 col-form-label">Phone</label>
                <div class="col-sm-10">
                    <input type="tel" class="form-control" id="inputPhone3" name="phone" value="${sessionScope.userInfo.phone }">
                </div>
            </div>

            <div class="form-group row">
                <label for="inputNickname" class="col-sm-6 col-form-label">Nickname</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="nickname" id="inputNickname" value="${sessionScope.userInfo.nickName }">
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
</div>

</body>
</html>