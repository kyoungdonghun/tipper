<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    
<!DOCTYPE html>
<html>
<head>
	<!-- 여기다가 싹 다 임포트 할것. -->
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<link href="/resources/css/mainstyles.css" rel="stylesheet"/> 	
</head>
<body>
<!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="/">GAME GGUL TIP HELPER</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    
						<li class="nav-item"><a class="nav-link active" href="/comunity/list">COMUNITY</a></li>
						<li class="nav-item"><a class="nav-link active" aria-current="page" href="#">MAIN PAGE</a></li>
                        
                    <!-- 로그인을 안했다면.-->
                    <sec:authorize access="isAnonymous()">
                    	<li class="nav-item">
                    	<a class="nav-link" href="/customLogin">로그인</a>
                    	</li>
                    </sec:authorize>
                    
                    <!-- 로그인이 되어있다면, -->
                    
                    <sec:authorize access="isAuthenticated()">
                    	<li class="nav-item"><a class="nav-link" href="/member/get?email=${pageContext.request.userPrincipal.name }" style='color:white;'>${pageContext.request.userPrincipal.name} 님, 안녕하세요!</a></li>
                    	<li class="nav-item"><a class="nav-link" href="/customLogout">로그아웃</a></li>
                    </sec:authorize>
                    
                    	<%-- <p>사용자 이름 : <sec:authentication property="principal.member.username"/></p>
                    	<p>사용자 아이디 : <sec:authentication property="principal.username"/></p>
                    	<p>사용자 권한 리스트 : <sec:authentication property="principal.member.authList"/></p>
                    	 --%>
                    </ul>
                </div>
            </div>
        </nav>   
        <div id="page-wrapper">