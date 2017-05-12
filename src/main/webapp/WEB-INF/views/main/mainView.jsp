<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>그룹 메인</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/grouping/resources/stylesheets/fileinput.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="<c:url value="/resources/javascripts/canvas-to-blob.min.js"/>"></script>
<script src="<c:url value="/resources/javascripts/sortable.min.js"/>"></script>
<script src="<c:url value="/resources/javascripts/purify.min.js"/>"></script>
<script src="<c:url value="/resources/javascripts/fileinput.min.js"/>"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://malsup.github.com/jquery.form.js"></script>
<script src="<c:url value="/resources/javascripts/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/resources/javascripts/moment.min.js"/>"></script>
<script src="<c:url value="/resources/javascripts/fullcalendar.min.js"/>"></script>
<link rel="stylesheet" type="text/css" href="/grouping/resources/stylesheets/fullcalendar.min.css">
<link rel="stylesheet" type="text/css" href="/grouping/resources/stylesheets/jquery-ui.min.css">
<link rel="stylesheet" type="text/css" href="/grouping/resources/stylesheets/default.css">
<script src="<c:url value="/resources/javascripts/sockjs.js"/>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.16.0/jquery.validate.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.16.0/additional-methods.min.js"></script>
<script src="<c:url value="/resources/javascripts/jquery.ui.datepicker.validation.min.js"/>"></script>
<script src="<c:url value="/resources/javascripts/jquery.paging.min.js"/>"></script>
</head>
<script>

	//그룹 소켓
	var sock = null;
	$(function() {
		//메인 첫 페이지 업무화면으로 설정
		$("#subPage").load("/grouping/work/workView.do");
		//그룹소켓 url을 group-chat-ws로 설정 후 소켓 생성
		sock = new SockJS("../group-chat-ws");
		
		//접속 이벤트 발생 시 메시지 전송
		sock.onopen = function() {
			sock.send("<c:out value="${user_name}"/>님이 접속하셨습니다.");
		}
		
		//메시지 수신 이벤트 발생 시 리스트 태그처리 후 chatarea에 append
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
			$("#chatpanel").scrollTop($('#chatarea').height());	
		}
		
		//접속 종료 이벤트 발생 시 메시지 전송
		sock.onclose = function() {
			sock.send("저 퇴장");				
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
			if (e.which == 13) {/* 13 == enter key@ascii */
				if ($("#btn-input").val() != "") {
					sock.send($("#btn-input").val());
					$("#btn-input").val("");
				}
			}
		});
	});

	/*
		유저 초대 함수
		Ajax 방식
		data : insertMemberInGroupForm -> String로 전송 DB에서 생성
		success : 초대 모달 닫기
	*/
	function insertMemberInGroup() {

		$.ajax({
			url : "/grouping/group/insertMemberInGroupAjax.do",
			data : $('#insertMemberInGroupForm').serialize(),
			dataType : 'json',
			type : "post",
			async : false,
			success : function(jsonData) {
				alert("성공적으로 초대하였습니다.");
				$("#invite_user").modal('hide');
			},
			error : function(jsonData) {
				alert("해당 id의 회원이 없습니다.");
			}
		});
	}

	/*
		접속 유저 확인 함수
		Ajax 방식
		success : 접속유저 데이터 가공 후 모달에 표출
	*/
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
	function showAllUser() {
		$.ajax({
			url : "/grouping/group/allUser.do",
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
				$("#all_user_list").html(text);
				$("#allUserModal").modal('show');
			},
			error : function(jsonData) {
				alert("실패");
			}
		});
	}
	//서브페이지 로드 함수
	function loadWork() {
		$("#subPage").load("/grouping/work/workView.do");
	}
	function loadBoard() {
		$("#subPage").load("/grouping/board/boardView.do");
	}
	function loadMypage() {
		$("#subPage").load("/grouping/mypage/mypageView.do");
	}
	function loadFileUpload() {
		$("#subPage").load("/grouping/file/fileUploadView.do");
	}
	function loadCalendar() {
		$("#subPage").load("/grouping/calendar/calendarView.do");
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
	function work_confirm() {
		$("#subPage1").load("/grouping/mypage/workConfirmView.do");
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
	function loadInviteUserModal() {
		$("#invite_user").modal('show');

	}

</script>
<body>
	<!-- 그룹 타이틀 영역 -->
	<div class="grpname">${grp_title}</div>
	
	<!-- 네비 영역 -->
	<nav class="navbar navbar-default navbar-static-top navbar-inverse"
		role="navigation">
	<div class="container-fluid">
		<div id="navbar-menu" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li><a class="categorybar" href="#" onclick="loadWork();">업무확인</a></li>
				<li><a class="categorybar" href="#" onclick="loadBoard();">그룹게시판</a></li>
				<li><a class="categorybar" href="#" onclick="loadMypage();">마이페이지</a></li>
				<li><a class="categorybar" href="#" onclick="loadFileUpload();">파일공유</a></li>
				<li><a class="categorybar" href="#" onclick="loadCalendar();">일정달력</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="../lobby/lobbyView.do"><span
						class="glyphicon glyphicon-globe"></span> 그룹 로비로 가기</a></li>
				<li><a href="#" onclick="showAllUser();"><span
						class="glyphicon glyphicon-user"></span> 회원 리스트조회</a></li>		
				<li><a href="#" onclick="loadInviteUserModal();"><span
						class="glyphicon glyphicon-plus-sign"></span> 회원 초대</a></li>
				<li><a href="../login/loginView.do" id="signout"><span
						class="glyphicon glyphicon-lock"></span> 로그아웃</a></li>
			</ul>
		</div>
	</div>
	<div></div>
	</nav>

	<!-- 서브 페이지 로드 영역 -->
	<div id="subPage"></div>

	<!-- 그룹 채팅방 영역 -->
	<div class="panel-primary">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-comment"></span>${grp_title } 그룹 채팅방
			<button type="button" id="usercount" onclick="showAccessUser();"></button>
		</div>
		<div class="panel-body chat-panel-body">
			<ul class="chat" id="chatarea"></ul>
		</div>
		<div class="panel-footer">
			<div class="input-group">
				<input id="btn-input" type="text" class="form-control input-sm" placeholder="Type your message here..." /> 
				<span class="input-group-btn">
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
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">멤버 초대</h4>
				</div>
				<div class="modal-body">
					<form id="insertMemberInGroupForm">
						추가할 멤버 id<input type="text" name="user_id">
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						onclick="insertMemberInGroup();">초대하기</button>
				</div>
			</div>		
		</div>
	</div>

	<!-- 접속 유저 확인 모달 -->
	<div class="modal fade" id="access_user">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
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
		</div>
	</div>
	
	<!-- 그룹속한 유저 확인 모달 -->
	<div class="modal fade" id="allUserModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">그룹 멤버</h4>
				</div>
				<div class="modal-body">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>사용자 id</th>
								<th>이름</th>
							</tr>
						</thead>
						<tbody id="all_user_list">
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>