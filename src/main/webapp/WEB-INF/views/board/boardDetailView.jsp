<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>	
$(function() {
	$("form").validate({
		//validation이 끝난 이후의 submit 직전 추가 작업할 부분      
		//규칙
		rules : {
			board_title : {
				required : true,
				minlength : 1,
				maxlength : 50
			},
			board_content : {
				required : true,
				minlength : 1,
				maxlength : 500
			}
		},
		//규칙체크 실패시 출력될 메시지
		messages : {
			board_title : {
				required : "게시글 제목을 필수로 입력하세요",
				minlength : "최소 1글자 이상 입력하세요",
				maxlength : "최대 50글자 이하이어야 합니다"
			},
			board_content : {
				required : "게시글 상세 내용을 필수로 입력하세요",
				minlength : "최소 1글자 이상 입력하세요",
				maxlength : "최대 500글자 이하이어야 합니다"
			}
		},
		/*
		게시글 수정 함수
		Ajax 방식
		data : form -> GroupVO로 전송 후 seq_grp_number받아 DB에서 업데이트
		success : 게시판 화면 리로드
		*/
		submitHandler : function(form) {
			$.ajax({
				url : "/grouping/board/modifyBoard.do",
				data : $('#form').serialize(),
				dataType : 'json',
				type : "post",
				async : false,
				success : function(jsonData) {
					loadBoard();
				},
				error : function(jsonData) {
					alert("실패");
				}
			});
		}
		
	});
})

	/*
		수정 버튼 눌렀을 때 폼 활성화 함수
	*/
	function modifyForm() {
 		$("#board_title").removeAttr('disabled');
		$("#board_content").removeAttr('readonly');
		$("#board_content").removeAttr('disabled'); 
		$("#modifyBtn").css("visibility", "hidden");
		$("#submitBtn").css("visibility", "visible"); 
	}
	
	/*
		게시글 삭제 함수
		Ajax 방식
		data : form -> GroupVO로 전송 후 seq_grp_number받아 DB에서 삭제
		success : 게시판 화면 리로드
	*/
	function deleteBoard(){
		$.ajax({
			url : "/grouping/board/deleteBoard.do",
			data : $('#form').serialize(),
			dataType : 'json',
			type : "post",
			async : false,
			success : function(jsonData) {
				loadBoard();
			},
			error : function(jsonData) {			
				alert("실패");
			}
		});
	}
	


 	
</script>
<body>
	<div class="col-md-10 col-md-offset-1">
		<div class="panel panel-default panel-table">
			<!-- 패널 헤더 부분 -->
			<div class="panel-heading">
				<div class="row">
					<div class="col col-xs-6">
						<h3 class="panel-title">글 상세</h3>
					</div>
				</div>
			</div>
			<!-- 패널 바디 부분 -->
			<div class="panel-body">
				<form id="form">
					<input type="hidden" name="seq_board_number" value="${board.seq_board_number}" />
					<div class="form-group">
						<!-- Name field -->
						<label class="control-label " for="name">글 제목</label> 
						<input class="form-control" id="board_title" name="board_title" value="${board.board_title}" 
						type="text" disabled="disabled">
					</div>
					<div class="form-group">
						<!-- Message field -->
						<label class="control-label " for="message">상세 내용</label>
						<textarea class="form-control" cols="40" id="board_content" name="board_content" 
						rows="10" readonly="readonly" disabled>${board.board_content}</textarea>
					</div>
					<Button type="submit" class="btn btn-primary " id="submitBtn" style="visibility: hidden">확인</button>
				</form>
				<div class="form-group">					
					<!-- 글 작성자와 사용자가 같을 경우 글 수정, 삭제 버튼 표출 -->
					<c:if test="${user_id eq board.board_reg_user_id }">
						<button class="btn btn-primary " id="modifyBtn" onclick="modifyForm();">글 수정</button>
						<button class="btn btn-primary " id="deleteBtn" onclick="deleteBoard();">글 삭제</button>
					</c:if>				
					<button class="btn btn-primary " name="back" onclick="loadBoard();">글 목록</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>