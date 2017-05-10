<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/grouping/resources/stylesheets/default.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.16.0/jquery.validate.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.16.0/additional-methods.min.js"></script>
</head>
<script>
$(function(){
	 $("form").validate({
        //validation이 끝난 이후의 submit 직전 추가 작업할 부분          
		//폼 규칙
			rules : {
				user_id : {
					required : true,
					minlength : 4,
					maxlength : 16,
					remote :
                    {
                      url: '/grouping/login/checkId.do'                	 
                    }
				},
				user_pwd : {
					required : true,
					maxlength : 16,
					minlength : 4
				},
				password_confirm : {
					required : true,
					maxlength : 16,
					minlength : 4,
					equalTo : "#user_pwd"
				},
				user_name : {
					required : true,
					maxlength : 16,
					minlength : 2
				},
				user_email : {
					required : true,
					email : true
				}
			
			},
			//규칙체크 실패시 출력될 메시지
			messages : {
				user_id : {
					required : "필수로입력하세요",
					maxlength : "최대 16글자 이하이어야 합니다",
					minlength : "최소 4글자이상이어야 합니다",
					remote : "이미 존재하는 id 입니다."
				},
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
	})
</script>
<body>
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="text-center">회원가입</h1>
			</div>
			<!-- 회원가입 모달 바디 -->
			<div class="modal-body">
				<!-- 회원가입 정보 입력 폼 -->
				<form id = "register_form" class="modal-body_register" action='insertUser.do' method="POST">
					<fieldset>
						<div class="control-group">
							<!-- user_id와 태그 연결 -->
							<label class="control-label" for="user_id">ID</label>
							<div class="controls">
								<input type="text" id="user_id" name="user_id" placeholder="희망하는 id를 입력하세요" class="input-xlarge">
							</div>
						</div>
						<div class="control-group">
							<!-- user_pwd와 태그 연결 -->
							<label class="control-label" for="user_pwd">비밀번호</label>
							<div class="controls">
								<input type="password" id="user_pwd" name="user_pwd" placeholder="********" class="input-xlarge">
							</div>
						</div>
						<div class="control-group">
							<!-- password_confirm과 태그 연결 -->
							<label class="control-label" for="password_confirm">비밀번호 확인 </label>
							<div class="controls">
								<input type="password" id="password_confirm" name="password_confirm" placeholder="********" class="input-xlarge">
							</div>
						</div>
						<div class="control-group">
							<!-- user_name과 태그 연결 -->
							<label class="control-label" for="usr">이름</label>
							<div class="controls">
								<input type="text" id="user_name" name="user_name" placeholder="예) 홍길동" class="input-xlarge">
							</div>
						</div>
						<div class="control-group">
							<!-- user_email과 태그 연결 -->
							<label class="control-label" for="user_email">이메일</label>
							<div class="controls">
								<input type="text" id="user_email" name="user_email" placeholder="예) abc@feelingk.com" class="input-xlarge">
							</div>
						</div>
						<div class="control-group">
							<!-- Button -->
							<div class="controls">
								<button class="btn btn-block btn-lg btn-primary">등록</button>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</body>
</html>