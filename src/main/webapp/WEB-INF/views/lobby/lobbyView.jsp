<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Grouping 로비</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.js"></script>
<script src="<c:url value="/resources/javascripts/sockjs.js"/>"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/grouping/resources/stylesheets/default.css">
<link rel="stylesheet" type="text/css" href="/grouping/resources/stylesheets/lobby.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.16.0/jquery.validate.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.16.0/additional-methods.min.js"></script>
<script src="<c:url value="/resources/javascripts/jquery.paging.min.js"/>"></script>

</head>
<script>
//소켓 변수
var sock = null;

$(function() {			
	//로비의 첫 서브 페이지는 그룹 선택페이지로 설정
	$("#subPage").load("/grouping/group/groupView.do");
	
	//소켓 url을 chat-ws로 설정 후 소켓 생성
	sock = new SockJS("../chat-ws");
	
	//접속 이벤트 발생 시 메시지 전송
	sock.onopen = function() {
		sock.send("<c:out value="${user_name}"/>님이 접속하셨습니다.");
	}
	
	//메시지 수신 이벤트 발생 시 리스트 태그처리 후 chatarea에 append
	sock.onmessage = function(event) {
		var user_id = "<c:out value="${user_id}"/>";
		var msg = JSON.parse(event.data);
		$("#usercount").html(msg.join_user_count);
		if (msg.user_id != user_id) {
			$("#chatarea").append("<li style='text-align: left'>" + msg.user_name+ "<br>" + msg.message + "</li>");
		} else {
			$("#chatarea").append("<li style='text-align: right'>" + msg.message+ "</li>");
		}
		$("#chatpanel").scrollTop($('#chatarea').height());	
	}
	
	//접속 종료 이벤트 발생 시 메시지 전송
	sock.onclose = function() {
		sock.send("<c:out value="${user_name}"/>님이 로그아웃하셨습니다.");
	}
	
	//메시지 전송 버튼 클릭 했을 시 소켓 메시지전송
	$("#btn-chat").click(function() {
		if ($("#btn-input").val() != "") {
			sock.send($("#btn-input").val());
			$("#btn-input").val("");
		}
	});
	
	//엔터키 이벤트 발생 시 소켓 메시지 전송
	$('#btn-input').keyup(function(e) {
		/* 13 == enter key@ascii */
		if (e.which == 13) {
			if ($("#btn-input").val() != "") {
				sock.send($("#btn-input").val());
				$("#btn-input").val("");
			}
		}
	});
});

//서브페이지 로드 함수
function loadGroup() {
	$("#subPage").load("/grouping/group/groupView.do");
}
function loadBoard() {
	$("#subPage").load("/grouping/board/boardView.do");
}
function loadMypage() {
	$("#subPage").load("/grouping/mypage/mypageView.do");
}
function loadBoardWrite() {
	$("#subPage").load("/grouping/board/boardWriteView.do");
}
function loadBoardDetail(seq) {
	$("#subPage").load("/grouping/board/boardDetailView.do?seq_board_number=" + seq);
}
function loadBoardModify(seq) {
	$("#subPage").load("/grouping/board/boardModifyView.do?seq_board_number=" + seq);
}

function group_more() {
	$("#subPage").load("/grouping/group/selectGroupList.do");
}
function group_management() {
	$("#subPage1").load("/grouping/group/selectGroupList.do");
}
function loadModifyUser() {
	$("#subPage1").load("/grouping/mypage/modifyUserInfoView.do");
}
</script>
<body>
	<!-- 제목 -->
	<div class="grpname">Grouping</div>
	
	<!-- 네비 -->
	<nav class="navbar navbar-default navbar-static-top navbar-inverse"
		role="navigation">
		<div class="container-fluid">
			<div id="navbar-menu" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a class="categorybar" href="#" onclick="loadGroup();">그룹선택</a></li>
					<li><a class="categorybar" href="#" onclick="loadBoard();">커뮤니티게시판</a></li>
					<li><a class="categorybar" href="#" onclick="loadMypage();">마이페이지</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="../login/loginView.do" id="signout"><span
							class="glyphicon glyphicon-lock"></span> 로그아웃</a></li>
				</ul>
			</div>
		</div>
		<div></div>
	</nav>
	
	<!-- 서브페이지 -->
	<div id="subPage"></div>
	
	<!-- 채팅 패널 -->
	<div class="panel-primary">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-comment"></span> 공개채팅방
		</div>
		<div id = "chatpanel" class="panel-body chat-panel-body">
			<ul class="chat" id="chatarea"></ul>
		</div>
		<div class="panel-footer">
			<div class="input-group">
				<input id="btn-input" type="text" class="form-control input-sm"
					placeholder="Type your message here..." /> <span
					class="input-group-btn">
					<button class="btn btn-warning btn-sm" id="btn-chat">Send</button>
				</span>
			</div>
		</div>
	</div>
</body>
</html>
