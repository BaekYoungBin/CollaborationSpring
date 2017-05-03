<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>


<link rel="stylesheet" type="text/css"
	href="/grouping/resources/stylesheets/main.css">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>

	function modifyForm() {
 		$("#board_title").removeAttr('disabled');
		$("#board_content").removeAttr('readonly');
		$("#board_content").removeAttr('disabled'); 
	$("#modifyBtn").css("visibility", "hidden");
		$("#submitBtn").css("visibility", "visible"); 
	}
	function deleteBoard(){
		$.ajax({
			url : "/grouping/board/deleteBoard.do",
			data : $('#form').serialize(),
			dataType : 'json',
			type : "post",
			async : false,
			success : function(jsonData) {
				loadCommunity();
			},
			error : function(jsonData) {
				
				alert("실패");
			}
		});
	}
	function modifyBoard() {
 	$.ajax({
			url : "/grouping/board/modifyBoard.do",
			data : $('#form').serialize(),
			dataType : 'json',
			type : "post",
			async : false,
			success : function(jsonData) {
				loadCommunity();
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
			<div class="panel-heading">
				<div class="row">
					<div class="col col-xs-6">
						<h3 class="panel-title">글 상세</h3>
					</div>

				</div>
			</div>
			<div class="panel-body">
				<form id="form">
					<input type="hidden" name="seq_board_number"
						value="${board.seq_board_number}" />
					<div class="form-group">
						<!-- Name field -->
						<label class="control-label " for="name">글 제목</label> 
						<input	class="form-control" id="board_title" name="board_title"
							value="${board.board_title}" type="text" disabled="disabled">
					</div>


					<div class="form-group">
						<!-- Message field -->
						<label class="control-label " for="message">상세 내용</label>
						<textarea class="form-control" cols="40" id="board_content"
							name="board_content" rows="10" readonly="readonly" disabled>${board.board_content}</textarea>
					</div>
						</form>
					<div class="form-group">
					
						<button class="btn btn-primary " id="modifyBtn"
							onclick="modifyForm();">글 수정</button>
							<c:if test="${user_id eq board.board_reg_user_id }">
						<button class="btn btn-primary " id="deleteBtn"
							onclick="deleteBoard();">글 삭제</button>
						</c:if>
						<button class="btn btn-primary " id="submitBtn"
							onclick="modifyBoard();" style="visibility: hidden">확인</button>
						<button class="btn btn-primary " name="back"
							onclick="loadCommunity();">글 목록</button>
</div>



			

			</div>
			<div class="panel-footer">
				<div class="row"></div>
			</div>
		</div>

	</div>
</body>
</html>