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
                    <h2 class="fw-bolder">회원정보</h2>
                    <p class="lead mb-0">회원 정보를 확인하세요.</p>
                </div>
                <div class="row gx-5 justify-content-center">
                    <div class="col-lg-6">
                    
                            <!-- Email address input-->
                      <div class="form-floating mb-3">
	    <input class="form-control" id="email" name="email" type="email" placeholder="name@example.com" value="${listone.email }" readonly required />
	    <label for="email">이메일</label>
	</div>
                      
                      <!-- 비밀번호 -->
	<div class="form-floating mb-3">
	    <input class="form-control" id="password" name="password" type="password" placeholder="password" value="${listone.password }" readonly required>
	    <label for="password">비밀번호</label>
                      </div>
                      
                      <!-- Name input-->
                      <div class="form-floating mb-3">
                          <input class="form-control" id="name" name="name" type="text" placeholder="Enter your name..." value="${listone.name }" readonly required/>
                          <label for="name">이름</label>
                      </div>
                      <!-- Phone number input-->
                      <div class="form-floating mb-3">
                          <input class="form-control" id="tel" name="phonenumber" type="tel" placeholder="(123) 456-7890" value="${listone.phonenumber }"readonly  required/>
                          <label for="phonenumber">연락처</label>
                      </div>

<div class="form-floating mb-3">
    <input class="form-control" id="birth" name="birth" type="text" readonly required value="${listone.birth}" />
    <label for="birth">생년월일</label>
</div>
                      
                     <div class="form-floating mb-3">
	    <input class="form-control" id="agegroup" name="agegroup" type="text" value="${listone.agegroup }"readonly  required/>
					 <label for="birth">연령대</label>
	</div>
	<div class="d-grid"><button id="goSubmit" class="btn btn-primary btn-lg" type="button"><a href="/member/modify?email=${pageContext.request.userPrincipal.name }" style='color:black; text-decoration: none;'>정보 수정하러 가기</a></button></div>
              </div>
          </div>
      </div>
  </section>
</body>
</html>
