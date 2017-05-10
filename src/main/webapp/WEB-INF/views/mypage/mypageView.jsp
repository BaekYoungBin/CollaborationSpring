<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>마이페이지</title>
<link rel="stylesheet" type="text/css" href="/grouping/resources/stylesheets/mypage.css">
</head>
<script>
$( function() {
	  $("#subPage1").load("/grouping/mypage/modifyUserInfoView.do");
});
</script>
<body>
	<nav class="navbar navbar-default sidebar" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-sidebar-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-sidebar-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="#" onclick="loadModifyUser();">회원정보 수정
				<span style="font-size: 16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span></a></li>
				<li><a href="#" onclick="group_management();">그룹 관리
				<span style="font-size: 16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-th-list"></span></a></li>
				
			</ul>
		</div>
	</div>
	</nav>
	<div id="subPage1"></div>
</body>
</html>