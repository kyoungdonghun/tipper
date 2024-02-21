<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../includes/header.jsp" %>
	<section class="bg-light py-5">
            <div class="container px-5 my-5 px-5">
                <div class="text-center mb-5">
                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-envelope"></i></div>
                    <h2 class="fw-bolder">비밀번호 변경</h2>
                    <p class="lead mb-0">비밀번호를 변경하세요.</p>
                </div>
                <div class="row gx-5 justify-content-center">
                    <div class="col-lg-6">
						<form id="contactForm" method="post" action="/member/passwordmodify" onsubmit="return validateForm()">
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
                            <!-- Email address input-->
							<div class="form-floating mb-3">
							    <input class="form-control" id="email" name="email" readonly type="email" placeholder="name@example.com" value="${listone.email }" required />
							    <label for="email">이메일</label>
							</div>
                      
							<div class="form-floating mb-3">
							    <input class="form-control" id="password" name="password" type="password" placeholder="password" required>
							    <label for="password">비밀번호</label>
                                <div class="invalid-feedback" data-sb-feedback="password:required">비밀번호를 입력하세요</div>
                            </div>
                            
                            <div class="form-floating mb-3">
								 <span id="passwordMatchMessage" style="float: right;"></span>
								 <label for="password">비밀번호 확인</label>
								 <input class="form-control" type="password" name="password-check" oninput="checkPasswordMatch()" required><br><br>
                            </div>
						<div class="d-grid"><button class="btn btn-primary btn-lg" id="submitButton" type="submit">변경하기</button></div>
					</form>
              </div>
          </div>
      </div>
  </section>
</body>
</html>

<script>
function checkPasswordMatch() {
    var password = document.getElementsByName("password")[0].value;
    var confirmPassword = document.getElementsByName("password-check")[0].value;
    var message = document.getElementById("passwordMatchMessage");

    if (password !== '' && confirmPassword !== '') {
        if (password === confirmPassword) {
            message.style.color = 'green';
            message.innerHTML = '비밀번호가 일치합니다';
            return true;
        } else {
            message.style.color = 'red';
            message.innerHTML = '비밀번호가 일치하지 않습니다';
            return false;
        }
    } else {
        message.innerHTML = ''; // 필드가 비어 있으면 메시지를 지웁니다.
        return false;
    }
}
</script>