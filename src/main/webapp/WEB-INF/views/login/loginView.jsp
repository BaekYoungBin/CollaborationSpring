<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <html>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="<c:url value=" /resources/javascripts/index.js "/>"></script>
  		<link rel="stylesheet" type="text/css" href="/grouping/resources/stylesheets/main.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <head>
            <title>Login Page</title>    
        </head>
        <body>
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="text-center">Welcome</h1>
                    </div>
                    <div class="modal-body">
                        <form action='/grouping/login/signIn.do' method ="POST">
                            <div class="form-group">
                                <input type="text" id="userId" name="userId" class="form-control input-lg" placeholder="UserId" />
                            </div>
                            <div class="form-group">
                                <input type="password" id="password" name="password" class="form-control input-lg" placeholder="Password" />
                            </div>
                            <div class="form-group">
                                <input type="submit" class="btn btn-block btn-lg btn-primary" value="Login" />
                                <span class="pull-right"><a href="/grouping/login/registerForm.do">회원가입</a></span><span><a href="/grouping/login/passwordFindForm.do">비밀번호 찾기</a></span>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </body>

        </html>