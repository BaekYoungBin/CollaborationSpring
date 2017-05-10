<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<link rel="stylesheet" type="text/css" href="/grouping/resources/stylesheets/mypage.css">
</head>
<script>
$("form").validate({
    //validation이 끝난 이후의 submit 직전 추가 작업할 부분      
    //규칙
    rules: {
    	user_name: {
			required : true,
			maxlength : 16,
			minlength : 2
        },
        user_email: {
			required : true,
			email : true
        },
        user_pwd: {
			required : true,
			maxlength : 16,
			minlength : 4
        },
		password_confirm : {
			required : true,
			maxlength : 16,
			minlength : 4,
			equalTo : "#user_pwd"
		}
    },
    //규칙체크 실패시 출력될 메시지
    messages : {   
		user_pwd : {
			required : "필수로입력하세요",
			maxlength : "최대 16글자 이하이어야 합니다",
			minlength : "최소 4글자이상이어야 합니다"
		},
		password_confirm : {
			required : "필수로입력하세요",
			maxlength : "최대 16글자 이하이어야 합니다",
			minlength : "최소 4글자이상이어야 합니다",
			equalTo : "비밀번호가 일치하지 않습니다."
		},
		user_name : {
			required : "필수로입력하세요",
			maxlength : "최대 16글자 이하이어야 합니다",
			minlength : "최소 2글자이상이어야 합니다"
		},
		user_email: {
			required : "필수로입력하세요",
			email : "유효한 이메일을 입력하세요"
		}
    }
}); 


	function modifyForm() {
		$("#user_name").removeAttr('disabled');
		$("#user_email").removeAttr('disabled');
		$("#submitBtn").css("visibility", "visible");
		$("#insertBtn").css("visibility", "hidden");
		$("#user_pwd_line").css("visibility", "visible");
		$("#user_pwdConfirm_line").css("visibility", "visible");
	}
	function modifyUser() {
		$.ajax({
			url : "/grouping/mypage/modifyUserInfo.do",
			data : $('#form').serialize(),
			dataType : 'json',
			type : "post",
			async : false,
			success : function(jsonData) {
				alert("회원 정보 수정 성공");
				loadModifyUser();
			},
			error : function(jsonData) {
				alert("실패");
			}
		});
	}
</script>
<body>
	<div class="col-md-9">
		<div class="panel panel-default panel-table">
			<div class="panel-heading">
				<h3 class="panel-title">회원 정보 상세</h3>
			</div>
			<div class="panel-body userpanel-body">
				<div class="row">					
					<div class=" col-md-9 col-lg-9 ">
						<form id="form">
							<table class="table table-user-information">
								<tbody>
									<tr>
										<td>회원 ID:</td>
										<td>
										<input class="form-control" id="user_id" name="user_id" value="${user_id}" type="text"
											disabled="disabled"></td>
									</tr>
									<tr>
										<td>이름</td>
										<td>
										<input class="form-control" id="user_name" name="user_name" value="${user_name}" type="text"
											disabled="disabled"></td>
									</tr>
									<tr>
										<td>이메일</td>
										<td>
										<input class="form-control" id="user_email" name="user_email" value="${user.user_email}" type="text"
											disabled="disabled"></td>
									</tr>
									<tr>
										<td>가입 일자:</td>
										<td>
										<input class="form-control" id="reg_dt" name="reg_dt" value="${user.reg_dt}" type="text" disabled="disabled"></td>
									</tr>
									<tr id="user_pwd_line" style="visibility: hidden;">
										<td>회원 Password:</td>
										<td>
										<input class="form-control" id="user_pwd" name="user_pwd" type="password"></td>
									</tr>
									<tr id="user_pwdConfirm_line" style="visibility: hidden;">
										<td>회원 Password 확인:</td>
										<td>
										<input class="form-control" id="password_confirm" type="password"></td>
									</tr>
								</tbody>
							</table>
						</form>
						<button type="button" id="deleteBtn"
							class="btn btn-sm btn-primary btn-create">회원 탈퇴</button>
						<button type="button" id="insertBtn"
							class="btn btn-sm btn-primary btn-create" onclick="modifyForm()">회원
							정보 수정</button>

						<button class="btn btn-primary " id="submitBtn"
							onclick="modifyUser();" style="visibility: hidden">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

