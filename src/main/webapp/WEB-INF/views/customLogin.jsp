<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Bootstrap Admin Theme</title>

    <!-- Bootstrap Core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
<%@ include file="./includes/header.jsp" %>
         <div class="container bg-light py-5">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">로그인 하세요.</h3>
                        <br>
                        <br>
                        <br>
                        
                    </div>
                    <div class="panel-body">
                        <form role="form" method="post" action="/login">
                            <div class="form-group">
                                <input class="form-control" placeholder="E-mail" name="username" type="email" autofocus>
                            </div>
                            <br>
                            <div class="form-group">
                                <input class="form-control" placeholder="Password" name="password" type="password" value="">
                            </div>
                            <br>
                            <div > <!-- Center the buttons -->
								<button type="submit" class="btn btn-success">로그인</button>
                                <button type="button" class="btn btn-primary" onclick="openFindIdPopup()">아이디 찾기</button>
                                <button type="button" class="btn btn-info" onclick="openFindPasswordPopup()">비밀번호 찾기</button>
								<button type="button" class="btn btn-secondary" onclick="openRegister()">회원가입</button>
                            </div>

                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

    <script>
        $(".btn-success").on("click", function (e) {
            e.preventDefault();
            $("form").submit();
        });
        
        function openFindIdPopup() {
            window.open('/member/findid', 'findIdPopup', 'width=500,height=400');
        }

        function openFindPasswordPopup() {
            window.open('/member/findpw', 'findPasswordPopup', 'width=500,height=400');
        }
        
        function openRegister(){
        	window.location.href = '/member/insert';
        }
    </script>
</body>
