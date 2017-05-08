<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<head>
<title>비밀번호 찾기</title>
</head>
<script>
	function passwordFind() {
		$.ajax({
			url : "/grouping/login/passwordFind.do",
			data : {
				"user_email" : $("#emailInput").val()
			},
			dataType : 'json',
			type : "post",
			async : false,
			success : function(jsonData) {
				var text = jsonData.user_id +"님의 password는 " + jsonData.user_pwd+"입니다.";
				$("#passwordIn").html(text);
				$("#passwordShow").modal('show');
			},
			error : function(jsonData) {
				alert("잘못된 이메일 입니다.");
			}
		});

	}
	function goLoginPage(){
		location.href = "/grouping/login/loginView.do";
	}
	
</script>
<body>

	<hr>
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="text-center">Forgot Password</h1>
			</div>
			<div class="panel-body">
				<form class="passwordfindform">
					<fieldset>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-envelope color-blue"></i></span> <input
									id="emailInput" placeholder="email address"
									class="form-control" name="user_email" stype="email"
									oninvalid="setCustomValidity('Please enter a valid email address!')"
									onchange="try{setCustomValidity('')}catch(e){}" required="">
							</div>
						</div>
						<div class="form-group">
							<button class="btn btn-lg btn-primary btn-block" type="button"
								onclick="passwordFind();">비밀번호 찾기</button>
						</div>
					</fieldset>
				</form>

			</div>
		</div>
	</div>
	<div id="passwordShow" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Your Password</h4>
				</div>
				<div class="modal-body" id="passwordIn"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" onclick="goLoginPage();">확인</button>
				</div>
			</div>

		</div>
	</div>

</body>
</html>