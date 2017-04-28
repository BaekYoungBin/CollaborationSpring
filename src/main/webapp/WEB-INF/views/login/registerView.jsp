<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="/grouping/resources/stylesheets/main.css">
        
</head>
<body>
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="text-center">회원가입</h1>
                </div>
                <div class="modal-body">
                  <form class="modal-body_register" action='register.do' method="GET">
					<fieldset>

						<div class="control-group">
							<!-- Username -->
							<label class="control-label" for="user_id">ID</label>
							<div class="controls">
								<input type="text" id="user_id" name="user_id"
									placeholder="희망하는 id를 입력하세요" class="input-xlarge">
								<p class="help-block">ID는 필수입력값 입니다.</p>
							</div>
						</div>


						<div class="control-group">
							<label class="control-label" for="user_pwd">비밀번호</label>
							<div class="controls">
								<input type="password" id="user_pwd" name="user_pwd"
									placeholder="********" class="input-xlarge">
								<p class="help-block">비밀번호는 적어도 4자 이상 입력해주세요.</p>
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="password_confirm">비밀번호 확인
							</label>
							<div class="controls">
								<input type="password" id="password_confirm"
									name="password_confirm" placeholder="********" class="input-xlarge">
								<p class="help-block">비밀번호가 일치하지 않습니다.</p>
							</div>
						</div>
						
						<div class="control-group">
							<!-- E-mail -->
							<label class="control-label" for="usr">이름</label>
							<div class="controls">
								<input type="text" id="user_name" name="user_name" placeholder="예) 홍길동"
									class="input-xlarge">
								<p class="help-block">이름을 입력하세요</p>
							</div>
						</div>
						
						<div class="control-group">
							<!-- E-mail -->
							<label class="control-label" for="user_email">이메일</label>
							<div class="controls">
								<input type="text" id="user_email" name="user_email" placeholder="예) abc@feelingk.com"
									class="input-xlarge">
								<p class="help-block">이메일을 제대로 입력해주세요</p>
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