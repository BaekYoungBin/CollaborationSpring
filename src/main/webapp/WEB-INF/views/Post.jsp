<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 <script src="<c:url value="/resources/javascripts/Post.js"/>"></script>
<link rel="stylesheet" type="text/css"
	href="/grouping/resources/stylesheets/Post.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>


</script>
<body>
	<h1>${name}님 환영합니다.</h1>
	<br>
	<br>
	<div id="wrapper">
	<div id = tableWrap>
	<table id="table" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td>글번호</td>
				<td class="subject">제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
			</tr>
			<c:forEach items="${postlist}" var="pl">
				<tr>
					<td>${pl.post_id}</td>
					<td id = "${pl.post_id}" class = title>${pl.post_subject}</td>
					<td>${pl.name}</td>
					<td>${pl.date}</td>
					<td>${pl.hits }</td>
				</tr>
			</c:forEach>
		</table>
		</div>
		<form method="GET" action="ProjectView"> <input type ="submit" id = write_btn2 value=" 프로젝트화면으로"/></form>
<!-- 	<button id="write_btn">글쓰기</button> -->
		<form method="GET" action="goPost_Write"> <input type ="submit" id = write_btn value=" 글쓰기"/></form>
	</div>
</body>

</html>