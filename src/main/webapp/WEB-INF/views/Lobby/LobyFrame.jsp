<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="<c:url value="/resources/javascripts/Project.js"/>"></script>
<script src="<c:url value="/resources/javascripts/sockjs.js"/>"></script>
<link rel="stylesheet" type="text/css"
	href="/grouping/resources/stylesheets/Project_Select.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>

$(function() {
	$("#projectButton").click(function(){
		location.href ="goProject";
	});
	$("#communityButton").click(function(){
		location.href ="goPost";
	});
	$("#mypageButton").click(function(){
		location.href ="goMypage";
	});
});
</script>
<body>
<h1>아무글 입력자리</h1>
	<div class="wrapper">
		<div id="category">
			<!-- 카테고리 쓰는 곳 -->
			<!-- 프로젝트 -->
			<button id="projectButton">
				프로젝트
			</button>
			<!-- 커뮤니티 게시판 -->
			<button id = "communityButton">	커뮤니티 게시판</button>

			<!--마이페이지-->
			<button id="mypageButton">
				마이페이지
			</button>




		</div>
		<div class="prjview">
			<div id="buttonBox">
				<button id="projectMore">프로젝트 더 보기</button>
				<button id="projectAdd">프로젝트 등록</button>
			</div>
			<span class='hh'>즐겨찾기한 프로젝트</span>
			<div id="favoriteProject">
				<c:forEach items="${projectlist}" var="pl">
					<div class='prj' id='${pl.project_id }'>
						<!-- 		<img class='del' src='../images/delete.png'>  -->
						<span class='title'> ${pl.project_name}</span>
						<hr>
						<div class='detail'>${pl.project_detail}</div>
						<input class='join' type='button' value='프로젝트 입장' />
					</div>
				</c:forEach>
			</div>
			<span class='hh'>최근 사용한 프로젝트</span>
			<div id="newestProject">
				<c:forEach items="${projectlist}" var="pl">
					<div class='prj' id='${pl.project_id }'>
						<!-- 		<img class='del' src='../images/delete.png'>  -->
						<span class='title'> ${pl.project_name}</span>
						<hr>
						<div class='detail'>${pl.project_detail}</div>
						<input class='join' type='button' value='프로젝트 입장' />
					</div>
				</c:forEach>
			</div>
		</div>
		<div id="rightsection">
			<div id="mem">
				<button id="MemberAddButton">초대</button>
				<div id="chatMessage"></div>
				<input id="message" type="text"> <input id="sendMessage"
					type="submit" value="보내기" />
			</div>
		</div>

	</div>

</body>
</html>