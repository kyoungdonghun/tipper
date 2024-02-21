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
                    <h2 class="fw-bolder">회원가입</h2>
                    <p class="lead mb-0">여러 정보들을 공유해보세요!</p>
                </div>
                <div class="row gx-5 justify-content-center">
                    <div class="col-lg-6">
                        <form id="contactForm" method="post" action="/member/insert" onsubmit="return validateForm()">
                            <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
                            <!-- Email address input-->
                            <div class="form-floating mb-3">
							    <input class="form-control" id="email" name="email" type="email" placeholder="name@example.com" required /><input type="button" class="btn btn-warning " id="checkEmail" value="중복검사" style='text:right;'><span id="checkEmailMessage" style="float: right;"></span><br><br>
								<input type="hidden" id="checkEmailResult" value="">
							    <label for="email">이메일</label>
							</div>
                            
                            <!-- 비밀번호 -->
							<div class="form-floating mb-3">
							    <input class="form-control" id="password" name="password" type="password" placeholder="password"  required>
							    <label for="password">비밀번호</label>
                                <div class="invalid-feedback" data-sb-feedback="password:required">비밀번호를 입력하세요</div>
                            </div>
                            
                            <div class="form-floating mb-3">
								 <span id="passwordMatchMessage" style="float: right;"></span>
								 <label for="password">비밀번호 확인</label>
								 <input class="form-control" type="password" name="password-check" oninput="checkPasswordMatch()" required><br><br>
                            </div>
                            
                            <!-- Name input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="name" name="name" type="text" placeholder="Enter your name..."  required/>
                                <label for="name">이름</label>
                                <div class="invalid-feedback" data-sb-feedback="name:required">이름을 기입해주세요.</div>
                            </div>
                            <!-- Phone number input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="tel" name="phonenumber" type="tel" placeholder="(123) 456-7890" required/>
                                <label for="phonenumber">연락처</label>
                                <div class="invalid-feedback" data-sb-feedback="phone:required">전화번호는 아이디 및 비밀번호 찾기에 쓰입니다.</div>
                            </div>
                            
<div class="form-floating mb-3">
    <input class="form-control" id="birth" name="birth" type="date" required/>
    <label for="birth">생년월일</label>
    <div class="invalid-feedback" data-sb-feedback="birth:required">생년월일은 필수 입력 항목입니다.</div>
</div>
                            
                            
                           <div class="form-floating mb-3">
							    <select class="form-select" aria-label="Default select example" name="agegroup">
							        <option selected>연령대를 고르세요</option>
							        <option value="none">비공개</option>
							        <option value="10대">10대</option>
							        <option value="20대">20대</option>
							        <option value="30대">30대</option>
							        <option value="40대">40대</option>
							        <option value="50대">50대</option>
							        <option value="60대">60대</option>
							        <option value="70대">70대</option>
							        <option value="80대">80대</option>
							        <option value="90대">90대</option>
							    </select>
							    <label for="agegroup">연령대</label>
							</div>
							                            <!-- csrf 토큰 관련 정보 넣기. 왜? post방식이니까. -->
                            
                            <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">Error sending message!</div></div>
                            <div class="d-grid"><button class="btn btn-primary btn-lg" id="submitButton" type="submit">가입하기</button></div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
</body>
</html>
<script>
	$('#checkEmail').click(function() {
		console.log("check email start...");
	    var email = $('input[name="email"]').val();
	    $.ajax({
	        url: '/duplicate/getEmailResult',
	        method: 'GET',
	        data : { email: email },
	        contentType: 'application/json',
	        success: function(data) {
	            var messageElement = $('#checkEmailMessage');
	            var resultElement = $('#checkEmailResult');
	            if (data === '1') {
	                messageElement.css('color', 'red').text('존재하는 이메일 입니다');
	                resultElement.val('1');
	               
	            } else if (data === '0') {
	                messageElement.css('color', 'green').text('사용가능한 이메일 입니다');
	                resultElement.val('0');
	            }
	        },
	        error: function(xhr, status, error) {
	            console.error('Error:', error);
	            // 오류 발생 시 처리할 내용을 추가합니다.
	        }
	    });
	});
	
	$('#checkNickname').click(function() {
	    var nickname = $('input[name="nickname"]').val();
	
	    $.ajax({
	        url: '/duplicate/getNicknameResult',
	        method: 'GET',
	        data : { nickname: nickname },
	        contentType: 'application/json',
	        success: function(data) {
	            var messageElement = $('#checkNicknameMessage');
	            var resultElement = $('#checkNicknameResult');
	            if (data === '1') {
	                messageElement.css('color', 'red').text('존재하는 별명 입니다');
	                resultElement.val('1');
	            } else if (data === '0') {
	                messageElement.css('color', 'green').text('사용가능한 별명 입니다');
	                resultElement.val('0');
	            } else {
	                // 다른 응답에 대한 처리
	            }
	        },
	        error: function(xhr, status, error) {
	            console.error('Error:', error);
	            // 오류 발생 시 처리할 내용을 추가합니다.
	        }
	    });
	});
	
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
    
	$("#tel").keyup(function (){
		chk_input_filter("number", $("#tel"));
	});
    
	function chk_input_filter(type, obj){
		var str = $(obj).val();
		if(type == 'alphabet'){
			//영문만 허용
			$(obj).val(str.replace(/[^a-z]/gi,""));
		}else if(type == 'number'){
			//숫자만 허용
			$(obj).val(str.replace(/[^0-9]/gi,""));
		}else if(type == 'alphabet_number'){
			//영문 , 숫자만 허용
			$(obj).val(str.replace(/[^a-z0-9]/gi,""));
		}else if(type == 'non_spec'){
			//특수문자 비허용
			$(obj).val(str.replace(/[~!@#$%^&*()_+|<>?:;{}`\-\=\\\,.'"\[\]/]/gi,""));
		}else if(type == 'name'){
			//특수문자, 숫자 비허용
			$(obj).val(str.replace(/[~!@#$%^&*()_+|<>?:;{}`\-\=\\\,.'"\[\]/0-9]/gi,""));
		}
	}    

    function validateForm() {
        var requiredFields = document.querySelectorAll('input[required]');
        for (var i = 0; i < requiredFields.length; i++) {
            if (requiredFields[i].value.trim() === '') {
                alert('필수 입력란을 모두 채워주세요.'); // 비어있는 필수 입력란 알림
                requiredFields[i].focus(); // 비어있는 필수 입력란으로 포커스 이동
                return false; // 폼 제출 방지
            }
        }
        if (!checkPasswordMatch()) {
            alert('비밀번호가 일치하지 않습니다.'); // 비밀번호 확인 알림
            document.getElementsByName("password-check")[0].focus(); // 비밀번호 확인 입력란으로 포커스 이동
            return false; // 폼 제출 방지
        }
        var emailResult = $('#checkEmailResult').val(); // 수정된 부분
        var nicknameResult = $('#checkNicknameResult').val(); // 수정된 부분
        
        if(emailResult !== '0'){
        	alert("이메일 또는 별명 중복 확인을 해주세요");
        	return false;
        }
        return true; // 모든 필수 입력란이 채워져 있고 비밀번호가 일치하면 폼 제출 허용
    }
    
</script>