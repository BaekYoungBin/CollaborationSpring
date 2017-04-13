<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="<c:url value="/resources/javascripts/main.js"/>"></script>
<script src="<c:url value="/resources/javascripts/sockjs.js"/>"></script>
<link rel="stylesheet" type="text/css"
	href="/grouping/resources/stylesheets/main.css">

<head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	<div id=wrapper>
		<div id=leftsection>
			<h1>${name}님의 ${project_name}</h1>
			<button id="goPost">게시판으로 가기</button>
			<button id="goProject">프로젝트화면으로 가기</button>
			<button id="logout">로그아웃</button>
		</div>

		<div id=center>
			<h1>메인영역</h1>
		</div>

		<div id=rightsection>
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