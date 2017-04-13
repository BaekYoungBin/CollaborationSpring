<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="<c:url value="/resources/javascripts/PostDetail.js"/>"></script>

<link rel="stylesheet" type="text/css"
	href="/grouping/resources/stylesheets/Post_detail.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id=wrap>
<input type="hidden" id = "post_in_userid" value="${post.user_id}"/>
<input type="hidden" id = "user_id" value="${user_id}"/>
<input type="hidden" id = "post_id" value="${post.post_id}"/>
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
				<td colspan=5>${post.post_subject }</td>
			</tr>
		</table>
		<br>
		<div id=content style="width: 586px; height: 352px;">${post.post_detail }</div>

		<form method="GET" action="goPost">
			<input type="submit" id="return" value="목록으로">
		</form>
		<button id="modifyButton">수정</button>
		<button id="deleteButton">삭제</button>
	</div>
</body>
</html>