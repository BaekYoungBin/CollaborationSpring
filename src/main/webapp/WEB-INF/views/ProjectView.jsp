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
<title>프로젝트 화면</title>
</head>

<script>
var sock = null;
$(document).ready(function(){
	sock=new SockJS("echo-ws");
	sock.onopen = function(){
		sock.send("반갑습니다.");
	}
	sock.onmessage = function(evt){
		$("#chatMessage").append(evt.data + "<br/>");
	}
	sock.onclose = function(){
		sock.send("저 퇴장");
	}
	$("#sendMessage").click(function(){
		if($("#message").val()!=""){
			sock.send($("#message").val());

			$("#message").val("");
		}
	})
})
</script>
<body>

	<%-- 	<div id="leftsection">
		<h1>${name}님로그인됏다</h1>
		<form method="GET" action="goLogout">
			<input type="submit" value=" 로그아웃">
		</form>
		<form method="GET" action="goPost">
			<input class="leftsubmit" type="submit" value=" 게시판 가기">
		</form>
	</div>


	<div id="main">

		<div class='prj add'>
			<span class='title'>프로젝트 생성</span>
			<hr>
			<!-- <form id='formProjectAdd' name='Project_Add' method='POST'
				action='ProjectAdd'>
				프로젝트 이름 <input type='text' name='project_name' maxlength='15'>
				프로젝트 설명 <input type='text' name='project_detail' maxlength='40'>
				<input type='submit' value='프로젝트 생성하기'>
			</form> -->
			<a href="" class="btn-example"
				onclick="layer_open('layer2'); return false;"> <img
				src="/grouping/resources/images/close-button.png" /></a>
			<div class="bg"></div>
			<div id="layer2" class="pop-layer">
				<div class="pop-container">

					<div class="pop-conts">
						<h1>추가하는부분</h1>
						<div class="btn-r">
							<a href="#" class="cbtn"> CLOSE</a>
						</div>
					</div>
				</div>

			</div>
		</div>
		<c:forEach items="${projectlist}" var="pl">
			<div class='prj' id='${pl.project_id }'>
				<!-- 		<img class='del' src='../images/delete.png'>  -->
				<span class='title'> ${pl.project_name}</span>
				<hr>
				<div class='detail'>${pl.project_detail}</div>
				<input class='join' type='button' value='프로젝트 입장' />
			</div>
		</c:forEach>
	</div> --%>

	<h1>아무글 입력자리</h1>
	<div class="wrapper">
		<div id="category">
			<!-- 카테고리 쓰는 곳 -->
			<!-- 프로젝트 -->
			<div id="projectButton">
				프로젝트
			</div>
			<!-- 커뮤니티 게시판 -->
			<div id="communityButton">
			<span id = "goCommunity">	커뮤니티 게시판</span>
			
			</div>
			<!--마이페이지-->
			<div id="mypageButton">
				마이페이지
			</div>




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