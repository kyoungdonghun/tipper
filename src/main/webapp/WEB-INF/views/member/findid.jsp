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
                    <h2 class="fw-bolder">아이디를 찾기</h2>
                    <p class="lead mb-0">아이디를 확인하세요.</p>
                </div>
                <div class="row gx-5 justify-content-center">
                    <div class="col-lg-6">
						<form id="contactForm" method="post" action="/member/findid" onsubmit="return validateForm()">
                            <!-- Email address input-->
                      
							<div class="form-floating mb-3">
							    <input class="form-control" id="phonenumber" name="phonenumber" type="text" placeholder="phonenumber" required>
							    <label for="phonenumber">전화번호</label>
                            </div>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<div class="d-grid"><button class="btn btn-primary btn-lg" id="submitButton" type="submit">아이디 찾기</button></div>
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