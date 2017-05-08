<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="/grouping/resources/stylesheets/fileinput.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="<c:url value="/resources/javascripts/canvas-to-blob.min.js"/>"></script>
<script src="<c:url value="/resources/javascripts/sortable.min.js"/>"></script>
<script src="<c:url value="/resources/javascripts/purify.min.js"/>"></script>
<script src="<c:url value="/resources/javascripts/fileinput.min.js"/>"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://malsup.github.com/jquery.form.js"></script>
<script src="<c:url value="/resources/javascripts/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/resources/javascripts/moment.min.js"/>"></script>
<script
	src="<c:url value="/resources/javascripts/fullcalendar.min.js"/>"></script>
<link rel="stylesheet" type="text/css"
	href="/grouping/resources/stylesheets/fullcalendar.min.css">
<link rel="stylesheet" type="text/css"
	href="/grouping/resources/stylesheets/jquery-ui.min.css">
<link rel="stylesheet" type="text/css"
	href="/grouping/resources/stylesheets/main.css">
<link rel="stylesheet" type="text/css"
	href="/grouping/resources/stylesheets/work.css">
<script src="<c:url value="/resources/javascripts/sockjs.js"/>"></script>
</head>
<script>

	//그룹 소켓
	var url;
	var sock = null;
	$(function() {
		$("#innerPage").load("/grouping/work/workView.do");
		sock = new SockJS("../group-chat-ws");
		sock.onopen = function() {
			sock.send("<c:out value="${user_name}"/>님이 접속하셨습니다.");
		}
		sock.onmessage = function(event) {			
		 var user_id = "<c:out value="${user_id}"/>";		 
			var msg = JSON.parse(event.data);
			$("#usercount").html(msg.join_user_count);
			if(msg.user_id != user_id){
				$("#chatarea").append(
						"<li style='text-align: left'>" + msg.user_name +"<br>"+ msg.message + "</li>");
			}
			else{	
				$("#chatarea").append(
						"<li style='text-align: right'>" + msg.message + "</li>");				
			}			
		}
		sock.onclose = function() {
			sock.send("저 퇴장");				
		}
		$("#btn-chat").click(function() {
			if ($("#btn-input").val() != "") {
				sock.send($("#btn-input").val());

				$("#btn-input").val("");
			}
		});

		$('#btn-input').keyup(function(e) {
			if (e.which == 13) {/* 13 == enter key@ascii */
				if ($("#btn-input").val() != "") {
					sock.send($("#btn-input").val());
					$("#btn-input").val("");
				}
			}
		});
	});

	//페이지 로드함수
	function loadWork() {
		$("#innerPage").load("/grouping/work/workView.do");
	}
	function loadCommunity() {
		$("#innerPage").load("/grouping/board/boardView.do");
	}
	function loadMypage() {
		$("#innerPage").load("/grouping/mypage/mypageView.do");
	}
	function loadFileUpload() {
		$("#innerPage").load("/grouping/file/fileUploadView.do");
	}
	function loadCalendar() {
		$("#innerPage").load("/grouping/calendar/calendarView.do");
	}
	function loadComunityWrite() {
		$("#innerPage").load("/grouping/board/boardWriteView.do");
	}
	function loadBoardDetail(seq) {
		url = "/grouping/board/boardDetailView.do?seq_board_number=" + seq;
		$("#innerPage").load(url);
	}
	function loadBoardModify(seq) {
		url = "/grouping/board/boardModifyView.do?seq_board_number=" + seq;
		$("#innerPage").load(url);
	}
	function work_confirm() {
		$("#innerPage1").load("/grouping/mypage/workConfirmView.do");
	}
	function group_more() {
		$("#innerPage").load("/grouping/group/selectGroupList.do");
	}
	function group_management() {
		$("#innerPage1").load("/grouping/group/selectGroupList.do");
	}
	function insertuser() {
		$("#innerPage1").load("/grouping/mypage/insertUserInfoView.do");
	}
	function loadInviteUserModal() {
		$("#invite_user").modal('show');

	}
	
	
	//유저 초대 함수
	function inviteUser() {

		$.ajax({
			url : "/grouping/group/inviteUser.do",
			data : $('#inviteUserForm').serialize(),
			dataType : 'json',
			type : "post",
			async : false,
			success : function(jsonData) {
				$("#invite_user").modal('hide');
			},
			error : function(jsonData) {
				alert("실패");
			}
		});
	}

	//접속 유저 확인 함수
	function showAccessUser() {
		$.ajax({
			url : "/grouping/group/accessUser.do",
			dataType : 'json',
			type : "post",
			async : false,
			success : function(jsonData) {
				var dataform = JSON.stringify(jsonData);
				var temp = JSON.parse(dataform);
				var text = null;
				$.each(temp, function(key, value) {
					text += "<tr>";
					text += "<td>" + value.user_id + "</td>";
					text += "<td>" + value.user_name + "</td>";
					text += "</tr>";
				});
				$("#access_user_list").html(text);
				$("#access_user").modal('show');
			},
			error : function(jsonData) {
				alert("실패");
			}
		});
	}
</script>
<body>
	<!-- 그룹 타이틀 영역 -->
	<div class="prjname">${grp_title}</div>
	
	<!-- 네비 영역 -->
	<nav class="navbar navbar-default navbar-static-top navbar-inverse"
		role="navigation">
	<div class="container-fluid">
		<div id="navbar-menu" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li><a class="categorybar" href="#" onclick="loadWork();">업무확인</a></li>
				<li><a class="categorybar" href="#" onclick="loadCommunity();">그룹게시판</a></li>
				<li><a class="categorybar" href="#" onclick="loadMypage();">마이페이지</a></li>
				<li><a class="categorybar" href="#" onclick="loadFileUpload();">파일공유</a></li>
				<li><a class="categorybar" href="#" onclick="loadCalendar();">일정달력</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="../lobby/lobbyView.do"><span
						class="glyphicon glyphicon-globe"></span> 그룹 로비로 가기</a></li>
				<li><a href="#" onclick="loadInviteUserModal();"><span
						class="glyphicon glyphicon-plus-sign"></span> 회원 초대</a></li>
				<li><a href="../login/loginView.do" id="signout"><span
						class="glyphicon glyphicon-lock"></span> 로그아웃</a></li>
			</ul>
		</div>
	</div>
	<div></div>
	</nav>



	<!-- 하위 페이지 로드 영역 -->
	<div id="innerPage"></div>




	<!-- 그룹 채팅방 영역 -->
	<div class="panel-primary">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-comment"></span>${grp_title } 그룹 채팅방
			<button type="button" id="usercount" onclick="showAccessUser();"></button>
		</div>
		<div class="panel-body chat-panel-body">
			<ul class="chat" id="chatarea">

			</ul>
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
	
	<!-- 사용자 추가 모달 -->
	<div class="modal fade" id="invite_user">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">멤버 초대</h4>
				</div>
				<div class="modal-body">
					<form id="inviteUserForm">
						추가할 멤버 id<input type="text" name="user_id">
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						onclick="inviteUser();">초대하기</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->


	<!-- 접속 유저 확인 모달 -->
	<div class="modal fade" id="access_user">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">접속 멤버</h4>
				</div>
				<div class="modal-body">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>사용자 id</th>
								<th>이름</th>
							</tr>
						</thead>
						<tbody id="access_user_list">
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
</body>
</html>