<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>GETTING STARTED WITH BRACKETS</title>
<meta name="description"
	content="An interactive getting started guide for Brackets.">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.js"></script>
<script src="<c:url value="/resources/javascripts/sockjs.js"/>"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="/grouping/resources/stylesheets/main.css">

</head>
<script>
	var url;
	$(document).ready(function() {
		$("#innerPage").load("/grouping/group/groupView.do");
	});

	function loadGroup() {
		$("#innerPage").load("/grouping/group/groupView.do");
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
	var sock = null;
	$(function() {
		sock = new SockJS("../chat-ws");
		sock.onopen = function() {
			sock.send("님이 접속하셨습니다.");
		}
		sock.onmessage = function(evt) {
			/* if(id 가 나랑 같으면) 
				right clearfix
				
				else if 나랑다르면
				left clearfix
				
			 */

			$("#chatarea").append('<li>' + evt.data + '</li>');

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
	})
	
</script>
<body>
	<div class="prjname">Grouping</div>
	<nav class="navbar navbar-default navbar-static-top navbar-inverse"
		role="navigation">
	<div class="container-fluid">
		<div id="navbar-menu" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li><a class="categorybar" href="#" onclick="loadGroup();">그룹
						선택</a></li>
				<li><a class="categorybar" href="#" onclick="loadCommunity();">커뮤니티
						게시판</a></li>
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


	<div id="innerPage"></div>



	<div class="panel-primary">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-comment"></span> 공개채팅방
		</div>
		<div class="panel-body chat-panel-body">
			<ul class="chat" id="chatarea">


				<!--    <li class="left clearfix"><span class="chat-img pull-left"> <img src="http://placehold.it/50/55C1E7/fff&text=U" alt="User Avatar" class="img-circle" /> </span>
                                <div class="chat-body clearfix">
                                    <div class="header"> <strong class="primary-font">Jack Sparrow</strong> <small class="pull-right text-muted"> <span class="glyphicon glyphicon-time"></span>12 mins ago</small> </div>
                                    <p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales. </p>
                                </div>
                            </li>
                            
                            <li class="right clearfix"><span class="chat-img pull-right"> <img src="http://placehold.it/50/FA6F57/fff&text=ME" alt="User Avatar" class="img-circle" /> </span>
                                <div class="chat-body clearfix">
                                    <div class="header"> <small class=" text-muted"><span class="glyphicon glyphicon-time"></span>13 mins ago</small> <strong class="pull-right primary-font">Bhaumik Patel</strong> </div>
                                    <p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales. </p>
                                </div>
                            </li>
                            <li class="left clearfix"><span class="chat-img pull-left"> <img src="http://placehold.it/50/55C1E7/fff&text=U" alt="User Avatar" class="img-circle" /> </span>
                                <div class="chat-body clearfix">
                                    <div class="header"> <strong class="primary-font">Jack Sparrow</strong> <small class="pull-right text-muted"> <span class="glyphicon glyphicon-time"></span>14 mins ago</small> </div>
                                    <p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales. </p>
                                </div>
                            </li>
                            <li class="right clearfix"><span class="chat-img pull-right"> <img src="http://placehold.it/50/FA6F57/fff&text=ME" alt="User Avatar" class="img-circle" /> </span>
                                <div class="chat-body clearfix">
                                    <div class="header"> <small class=" text-muted"><span class="glyphicon glyphicon-time"></span>15 mins ago</small> <strong class="pull-right primary-font">Bhaumik Patel</strong> </div>
                                    <p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales. </p>
                                </div>
                            </li> -->
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



</body>

</html>
