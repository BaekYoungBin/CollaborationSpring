$(document).ready(function() {

	var flag = false;
	$("#formAddUser").hide(); // 이메일 중복 확인

	$("#loginbtn").click(function() {
		alert("로그인버튼체크");

		$("#formAddUser").hide();
		$("#formLogin").show();
	});
	$("#sign").click(function() {
		alert("가입버튼체크");

		$("#formLogin").hide();
		$("#formAddUser").show();
	});
	$(document).on("blur", "#inputUserId", function() {

		$.ajax({
			url : 'ID_Confirm',
			type : 'GET',
			data : {
				'user_id' : this.value
			},
			success : function(result) {

				alert(result);
				if (result == '') {
					$('#idchk_msg').css('display', 'none');
				} else {
					$('#idchk_msg').css('display', 'block');

				}
			}
		});
	});

	$(document).on("focus", "#inputUserId", function() {
		$('#idchk_msg').css('display', 'none');
	});

	// 비밀번호 일치 확인
	$(document).on("blur", "#rePassword", function() {
		if ($('#inputPassword').val() != $('#rePassword').val()) {
			$('#pw_msg').css('display', 'block');
		}
	});
	$(document).on("focus", "#inputPassword", function() {
		$('#pw_msg').css('display', 'none');
	});
	$(document).on("focus", "#rePassword", function() {
		$('#pw_msg').css('display', 'none');
	});

	
	
});
function checkform(){
	alert("ㅇㅇ폼");
	if(flag == false){
		alert("이메일이 중복되었습니다.");
		return false;
	}
	var name = $(document).getElementById("inputUserName");
	var id = document.getElementById("inputUserId");
	var pass = document.getElementById("inputPassword");

	if(name.val.length > 10){
		alert("이름이 너무 길어");
		return false;
	}
	if(id.val.length < 2 || id.val.length > 10){
		alert("아이디 길이좀..");
		return false;
	}
	if(pass.val.length < 4 || pass.val.length > 20){
		alert("비밀번호는 4~20자리");
		return false;
	}
}
