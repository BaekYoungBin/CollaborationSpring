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

<style>
#wrapper {
	height: 50%;
	width: 50%;
	margin: 0;
}
</style>
<script>

</script>
<body>
	<div id="wrapper">
		<form action="signIn">
			<input type="text" id="id_box" name = user_id value = "아이디">
			<input type="password" id="password_box"name = user_password value = "패스워드">
			<input type="submit" id="submit_box" value ="로그인">
		
		</form>
		<a href="idFind" >아이디 찾기</a>
		/<a href="passwordFind">비밀번호 찾기</a>
		<a href="signUp">회원 가입</a>
	</div>
</body>
</html>
