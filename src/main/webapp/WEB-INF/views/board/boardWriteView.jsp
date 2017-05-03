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
function insertBoard(){
$.ajax({
	url : "/grouping/board/insertBoard.do",
	async:false,
	data : $('#insertform').serialize(),
	dataType : 'json',
	type : "post",
	success : function(jsonData) {
		loadCommunity();
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
						<h3 class="panel-title">글 등록</h3>
					</div>

				</div>
			</div>
			<div class="panel-body">
				<form id = "insertform">

					<div class="form-group">
						<!-- Name field -->
						<label class="control-label " for="name">Name</label> <input
							class="form-control" id="board_title" name="board_title" type="text" />
					</div>


					<div class="form-group">
						<!-- Message field -->
						<label class="control-label " for="message">Message</label>
						<textarea class="form-control" cols="40" id="board_content"
							name="board_content" rows="10"></textarea>
					</div>
</form>
					<div class="form-group">
						<button class="btn btn-primary " name="submit" onclick="insertBoard();">Submit</button>
					</div>
				
			</div>
			<div class="panel-footer">
				<div class="row"></div>
			</div>
		</div>

	</div>
</body>
</html>