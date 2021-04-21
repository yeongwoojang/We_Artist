<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/topMenuHead.jsp"%>
    <section id="contact" class="section-bg">

      <div class="container" data-aos="fade-up">

        <div class="section-header">
          <h2>PROFILE</h2>
          <p>프로필 정보를 설정해주세요.</p>
        </div>

        <div class="row contact-info">

          <div class="col-md-4">
            <div class="contact-address">
            </div>
          </div>

          <div class="col-md-4">
            <div class="contact-phone">
            	<div class="jb-a rounded-circle" style="
							    width: 14rem;
							    height: 14rem;
							    border: 0.5rem solid rgba(0, 0, 0, 0.1);
							">
            	<c:set var="pic" value="${picture}"/>
                    <c:choose>
                    	<c:when test="${empty pic}">
		                    <img class="mx-auto rounded-circle propic" src="/resources/img/boyoung.jpg" alt="" style="
							    width: 14rem;
							    height: 14rem;
							    border: 0.5rem solid rgba(0, 0, 0, 0.1);
							">
						</c:when>
						<c:otherwise>
							<img class="mx-auto propic" src="<c:url value="/images/${pic.files.fSavePath}/${pic.files.fRename}"/>" alt="" style="
							    width: 14rem;
							    height: 14rem;"
							    >
						</c:otherwise>
					</c:choose>
					<div class="overlay overlayFade">
					<div class="textProPic">
					<label for="ex_file">
					<i class="fas fa-plus" style="color: blanchedalmond;"></i>
					</label> 
					</div>
					</div>			
			</div>
			<p></p>
             <form action="${contetxt}/user/proPic" id="form" name="form"
						method="post" enctype="multipart/form-data" autocomplete="off" style="margin-top: 5px">
						<input class="d-none" type="file" id="ex_file" name="files" required />
						<button type="submit" class="btn btn-outline-secondary">업로드</button>
				</form>
			<div style="font-size: 30px;
				    margin-bottom: 15px;
				    font-weight: bold;
				    color: #112363;
				    margin-top: 8px;
				    ">
             ${sessionScope.userInfo.userId}
              </div>	
            </div>
          </div>

          <div class="col-md-4">
            <div class="contact-email">
              
            </div>
          </div>

        </div>

        <div class="form">
          <form id="frm-profile" action="${context}/user/update" method="post" role="form" class="php-email-form" novalidate>
            <div class="row">
              <div class="form-group col-md-6">
              	<label for="name" class="col-sm-6 col-form-label">Name</label>
              	<input class="form-control" type="hidden" name="userId" value="${sessionScope.userInfo.userId }">
                <input type="text" name="name" class="form-control" id="name" value="${sessionScope.userInfo.name }"  minlength="2" maxlength="50" required>
              </div>
              <div class="form-group col-md-6 mt-3 mt-md-0">
              	<label class="col-sm-6 col-form-label">Email</label>
                <input type="email" class="form-control" name="email" id="email" value="${sessionScope.userInfo.email }" readonly>
              </div>
            </div>
            <div class="form-group mt-3">
            	<label for="password" class="col-sm-6 col-form-label">Password</label>
              	<input type="password" class="form-control" name="password" id="password" placeholder="Password" minlength="8" maxlength="16" required>
            </div>
            <div class="form-group mt-3">
            	<label for="phone" class="col-sm-6 col-form-label">Phone</label>
             	<input type="tel" class="form-control" id="phone" name="phone" value="${sessionScope.userInfo.phone }">
            </div>
            <div class="form-group mt-3">
            	<label for="inputNickname" class="col-sm-6 col-form-label">Nickname</label>
             	<input type="text" class="form-control" name="nickName" id="inputNickname" value="${sessionScope.userInfo.nickName }">
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
    </section><!-- End Contact Section -->
<script src="/resources/js/user/profile.js"></script>
</body>
</html>