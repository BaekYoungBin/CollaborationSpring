<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="<c:url value="/resources/javascripts/index.js"/>?12389"></script>
<head>
<title>intro</title>
<link rel="stylesheet" type="text/css"
	href="/grouping/resources/stylesheets/index.css">
</head>
<body>
	<div id="wrapper">
		<div id="page-1" class="page">
			<div class="select-content">

				<div id="loginbtn" class="name">
					로그인 <br>
					<div class="underbar"></div>
				</div>
				<div id="sign" class="name1">
					가입하기 <br>
					<div class="underbar"></div>
				</div>
				<div id="formLogin">
					<form class="form" method="post" action="SignIn">
						<input type="text" id="user_id" name="user_id" placeholder="아이디"><br>
						<input type="password" id="password" name="password"
							placeholder="비밀번호"><br> <input type="submit"
							id="login_btn" onclick="abc();" value="로그인"><br> <a
							id="pwfind" href="javascript:void();"
							onclick="FindPassword(); return false">비밀번호 찾기</a><br>
					</form>
				</div>
				<div id="formAddUser" style="display: none;">
					<form class="form" method="post" action="SignUp">
						<input type="text" id="inputUserId" name="user_id"
							placeholder="아이디"><br>
						<div id="idchk_msg" class="alertmsg">이미 사용중인 이메일 입니다!</div>
						<input type="text" id="inputUserName" name="name" placeholder="이름"><br>
						<input type="password" id="inputPassword" name="password"
							placeholder="비밀번호"> <br> <input type="password"
							id="rePassword" placeholder="비밀번호확인"><br>
						<div id="pw_msg" class="alertmsg">비밀번호가 일치하지 않습니다!</div>
						<input type="submit" id="btnSubmit" value="회원가입"> <br>
					</form>
				</div>
			</div>
		</div>

	</div>
</body>
</html>
