<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Login Page</title>
<link rel="stylesheet" type="text/css" href="/grouping/resources/stylesheets/default.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.16.0/jquery.validate.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.16.0/additional-methods.min.js"></script>
</head>
<script>
$(function(){
	 $("form").validate({
         //validation이 끝난 이후의 submit 직전 추가 작업할 부분      
         //규칙
         rules: {
        	 user_id: {
                 required : true,
                 minlength : 4,
                 maxlength : 16
             },
             user_pwd: {
                 required : true,
                 maxlength : 16,
                 minlength : 4
             }
         },
         //규칙체크 실패시 출력될 메시지
         messages : {
        	 user_id: {
                 required : "필수로입력하세요",
                 maxlength : "최대 16글자 이하이어야 합니다",
                 minlength : "최소 4글자이상이어야 합니다"            
             },
             user_pwd: {
                 required : "필수로입력하세요",
                 maxlength : "최대 16글자 이하이어야 합니다",
                 minlength : "최소 4글자이상이어야 합니다"
             }
         }
     }); 
})
</script>
<body>
    <!-- 로그인 모달 -->
	<div class="modal-dialog">
		<div class="modal-content">	
			<!-- 로그인 모달 헤더 -->
			<div class="modal-header">
				<h1 class="text-center">Grouping입니다.</h1>
			</div>		
			<!-- 로그인 모달 바디 -->
			<div class="modal-body">
				<!-- 로그인 정보 입력 폼 : POST -->
				<form method="POST" action='/grouping/login/excuteLogin.do' >				
					<!-- 폼 간격을 띄우기 위해 개별 div 적용 -->
					<!-- input : user_id -->
					<div class="form-group">
						<input type="text" id = "user_id" name="user_id" class="form-control input-lg" placeholder="user_id" required="required"/>
					</div>
					<!-- input : user_pwd -->
					<div class="form-group">
						<input type="password" id = "user_pwd" name="user_pwd" class="form-control input-lg" placeholder="Password" required="required"/>
					</div>
					<!-- input : submit -->
					<div class="form-group">
						<input type="submit" class="btn btn-block btn-lg btn-primary" value="Login" /> 						
						<!-- 회원가입 a태그 오른쪽 정렬 -->
						<span class="pull-right"><a href="/grouping/login/registerUserView.do">회원가입</a></span>
						<span><a href="/grouping/login/findPasswordView.do">비밀번호 찾기</a></span>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>

</html>