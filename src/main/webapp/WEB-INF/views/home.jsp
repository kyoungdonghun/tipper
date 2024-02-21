<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body class="d-flex flex-column h-100">
 <%@ include file="./includes/header.jsp" %>
        <main class="flex-shrink-0">
            <!-- Navigation-->
            <!-- Page Content-->
            <section class="py-5">
                <div class="container px-5 my-5">
                    <div class="row gx-5 justify-content-center">
                        <div class="col-lg-6">
                            <div class="text-center mb-5">
                                <h1 class="fw-bolder">게임정보 공유 커뮤니티</h1>
                                <p class="lead fw-normal text-muted mb-0">CRUD의 구현을 통해 회원, 글쓰기, 등을 통해 커뮤니티를 형성하고, 게임사에서 공개하는 API를 이용하여 다양한 정보를 가져와서 특별한 커뮤니티를 만드는 것이 목표입니다.</p>
                            </div>
                        </div>
                    </div>
                    <div class="row gx-5">
					    <div class="col-12 border" style="background-color: gray;"><img class="img-fluid rounded-3 mb-5" src="/resources/img/2.png" alt="..." /></div>
					    <div class="col-lg-6 border  " style="background-color: gray;"><img class="img-fluid rounded-3 mb-5" src="/resources/img/1.png" alt="..." /></div>
					    <div class="col-lg-6 border" style="background-color: gray;"><img class="img-fluid rounded-3 mb-5" src="/resources/img/3.png" alt="..." /></div>
					</div>

                    <div class="row gx-5 justify-content-center">
                        <div class="col-lg-6">
                            <div class="text-center mb-5">
                                <p class="lead fw-normal text-muted">게임사에서 제공하는 API를 통한 게임 내부정보를 공유하는 것은 아직 구현하지 못했습니다. 빨리 해보겠슴둥.</p>
                                <a class="text-decoration-none" href="#!">
                                    <i class="bi-arrow-right"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
        <!-- Footer-->
        <footer class="bg-dark py-4 mt-auto">
            <div class="container px-5">
                <div class="row align-items-center justify-content-between flex-column flex-sm-row">
                    <div class="col-auto"><div class="small m-0 text-white">Copyright &copy; Your Website 2023</div></div>
                    <div class="col-auto">
                        <a class="link-light small" href="#!">Privacy</a>
                        <span class="text-white mx-1">&middot;</span>
                        <a class="link-light small" href="#!">Terms</a>
                        <span class="text-white mx-1">&middot;</span>
                        <a class="link-light small" href="#!">Contact</a>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
