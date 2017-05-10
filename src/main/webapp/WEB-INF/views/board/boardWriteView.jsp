<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>새 글쓰기</title>
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
		게시글 등록 함수
		Ajax 방식
		data : registerBoardForm -> BoardVO로 전송 DB에서 생성
		success : 게시판페이지 로드
	 */
		submitHandler : function(form) {
			$.ajax({
				url : "/grouping/board/registerBoardAjax.do",
				async : false,
				data : $('#registerBoardForm').serialize(),
				dataType : 'json',
				type : "post",
				success : function(jsonData) {
					loadBoard();
				}
			});
		}
	});
})
</script>
<body>
	<div class="col-md-10 col-md-offset-1">
		<div class="panel panel-default panel-table">
			<!-- 패널 헤드 -->
			<div class="panel-heading">
				<div class="row">
					<div class="col col-xs-6">
						<h3 class="panel-title">글 등록</h3>
					</div>
				</div>
			</div>
			<!-- 패널 바디 -->
			<div class="panel-body">
				<!-- 게시판 등록 폼 -->
				<form id="registerBoardForm">
					<div class="form-group">
						<!-- board_title 라벨태그 연결 -->
						<label class="control-label " for="board_title">Title</label> 
						<input class="form-control" id="board_title" name="board_title" type="text" required="required"/>
					</div>
					<div class="form-group">
						<!-- board_content 라벨태그 연결 -->
						<label class="control-label " for="board_content">board_content</label>
						<textarea class="form-control" cols="40" id="board_content" name="board_content" rows="10" required="required"></textarea>
					</div>
				
					<div class="form-group">
						<button type = "submit" class="btn btn-primary " name="submit" >Submit</button>
					</div>
				</form>
			</div>
		</div>

	</div>
</body>
</html>