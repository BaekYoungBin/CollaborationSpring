<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.js"></script>
<script src="<c:url value="/resources/javascripts/sockjs.js"/>"></script>
<script src="<c:url value="/resources/javascripts/jquery-ui.min.js"/>"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="/grouping/resources/stylesheets/jquery-ui.min.css">
<link rel="stylesheet" type="text/css"
	href="/grouping/resources/stylesheets/main.css">
<link rel="stylesheet" type="text/css"
	href="/grouping/resources/stylesheets/work.css">
</head>
<script>
	var url;
	$(document).ready(function() {
		$("#innerPage").load("/grouping/work/workView.do");
	});

	function loadWork() {
		$("#innerPage").load("/grouping/work/workView.do");
	}
	function loadCommunity() {
		$("#innerPage").load("/grouping/board/boardView.do");
	}
	function loadMypage() {
		$("#innerPage").load("/grouping/mypage/mypageView.do");
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
	function loadInviteUserModal(){
		$("#invite_user").modal('show');
		
	}
	function inviteUser(){
		
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
	
</script>
<body>
	<div class="prjname">Grouping</div>
	<nav class="navbar navbar-default navbar-static-top navbar-inverse"
		role="navigation">
	<div class="container-fluid">
		<div id="navbar-menu" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li><a class="categorybar" href="#" onclick="loadWork();">업무확인</a></li>
				<li><a class="categorybar" href="#" onclick="loadCommunity();">그룹게시판</a></li>
				<li><a class="categorybar" href="#" onclick="loadMypage();">마이페이지</a></li>
				<li><a class="categorybar" href="#" onclick="loadMypage();">파일공유</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
			<li><a href="../lobby/lobbyView.do"><span class="glyphicon glyphicon-globe"></span> 그룹 로비로 가기</a></li>
			<li><a href="#" onclick="loadInviteUserModal();"><span class="glyphicon glyphicon-plus-sign"></span> 회원 초대</a></li>
			
				<li><a href="../login/loginView.do" id="signout"><span
						class="glyphicon glyphicon-lock"></span> 로그아웃</a></li>
			</ul>

		</div>
	</div>
	<div></div>
	</nav>




	<div id="innerPage"></div>





	<div class="panel-primary">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-comment"></span> 공개채팅방
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


</body>
</html>