<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>


<link rel="stylesheet" type="text/css"
	href="/grouping/resources/stylesheets/Post_detail.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id=wrap>
<input type="hidden" id = "post_in_userid" value="${post.user_id}"/>
		<form action ="modifyPost" method ="POST">
		<input type="hidden" id = "user_id" value="${user_id}"/>
		<input type="hidden" id = "post_id" name = "post_id" value="${post.post_id}"/>
		<table>		
			<tr>
				<td>번호</td>
				<td>${post.post_id}</td>
				<td>날짜</td>
				<td>${post.date }</td>
				<td>작성자</td>
				<td>${post.name}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan=5>
				<input type="text" id = "post_subject2" name ="post_subject" value = "${post.post_subject }"></td>
			</tr>
		</table>
		<br>
		<textarea id = "post_detail" name = "post_detail" cols="80" rows="40">${post.post_detail }</textarea>
		<input type="submit" value ="수정완료">
</form>
		<form method="GET" action="goPost">
			<input type="submit" id="return" value="목록으로">
		</form>
	</div>
</body>
</html>