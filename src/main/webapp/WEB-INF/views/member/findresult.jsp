<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Include Clipboard.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/2.0.8/clipboard.min.js"></script>
</head>
<body>
    <%@ include file="../includes/header.jsp" %>
    <section class="bg-light py-5">
        <div class="container px-5 my-5 px-5">
            <div class="text-center mb-5">
                <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-envelope"></i></div>
                <h2 class="fw-bolder">아이디 찾기 결과</h2>
                <p class="lead mb-0">아이디를 확인하세요.</p>
            </div>
            <div class="row gx-5 justify-content-center">
                <div class="col-lg-6">
                    <!-- Email address input -->
                    <c:choose>
                       <c:when test="${not empty result}">
                            <div class="form-floating mb-3">
                                <input class="form-control" id="email" name="email" type="text" placeholder="email" value="${result}" required>
                                <label for="email">이메일</label>
                                <!-- Add a button to trigger the copy -->
                                <button class="btn btn-primary btn-sm" id="copyButton" data-clipboard-target="#email">복사하기</button>
                            </div>
                        </c:when>
                        <c:when test="${empty result}">
                            <div class="form-floating mb-3">
                                <input class="form-control" id="email" name="email" type="text" placeholder="email" value="아이디가 없습니다." required>
                                <label for="email">이메일</label>
                            </div>
                        </c:when>
                    </c:choose>
                </div>
            </div>
        </div>
    </section>

    <script>
        // Initialize Clipboard.js
        var clipboard = new ClipboardJS('#copyButton');
        
        // Handle success event (when text is successfully copied)
        clipboard.on('success', function (e) {
            console.log('Text copied to clipboard: ', e.text);
                alert("복사 완료, 5초 후에 창이 닫힙니다.");
            // Show alert after 5 seconds
            setTimeout(function() {
                // Close the window
                window.close();
            }, 5000);
        });
        
        // Handle error event (when text copy fails)
        clipboard.on('error', function (e) {
            console.error('Text copy failed: ', e.action);
        });
    </script>
</body>
</html>
