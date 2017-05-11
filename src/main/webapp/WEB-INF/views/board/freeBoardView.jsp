<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

<title>자유 게시판</title>
</head>
<script>
/*
	게시판 화면 페이지 로드
	html 랜더링 후 데이터 ajax로 받아와서 html변경
	Ajax 방식
	success : 데이터 가공 후 datasection에 게시글 목록 표출
*/

var total ;
var list ;
$(function() {
	list= new Array();
	total= "<c:out value="${boardTotalListCnt}"/>";
	total = total/10 + 1;
	//페이징 프레임워크, totalPages : 페이지 출력 숫자, visiblePages : 한화면에 최대로 보여주는 페이지 숫자
	$('#pagination-demo').twbsPagination({
		  totalPages: total,
		  visiblePages: 10,
		  onPageClick: function (event, page) {
			  $.ajax({
					url : "/grouping/board/boardViewAjax.do",
					data: {
						"pageNum" : page
						},
					dataType : 'json',
					type : "post",
					async : false,
					success : function(jsonData) {
						var dataform = JSON.stringify(jsonData.boardList);
						var temp = JSON.parse(dataform);
						var text;			
						$.each(temp, function(key, value) {
							text += "<tr>";
							text += "<td>" + value.row_num + "</td>";
							text += "<td><a href='javascript:loadBoardDetail("+ value.seq_board_number + ");'>"
									+ value.board_title + "</a></td>";
							text += "<td>" + value.board_content + "</td>";
							text += "<td>" + value.board_reg_user_name + "</td>";
							text += "</tr>";
						});
						$("#dataSection").html(text);
					},
					error : function(jsonData) {
						alert("실패");
					}		  
				});
		  }
	});
	
});

	



</script>
<body>
	<div class="col-md-10 col-md-offset-1">
		<div class="panel panel-default panel-table">
			<!-- 패널 헤더부분 -->
			<div class="panel-heading">
				<div class="row">
					<div class="col col-xs-6">
						<h3 class="panel-title">자유 게시판</h3>
					</div>
					<div class="col col-xs-6 text-right">
						<button type="button" class="btn btn-sm btn-primary btn-create"
							onclick="loadBoardWrite();">새 글쓰기</button>
					</div>
				</div>
			</div>
			<!-- 패널 바디 부분 -->
			<div id ="content" class="panel-body">
					<table class="table table-striped table-bordered table-list">
						<thead>
							<tr>
								<th>글 번호</th>
								<th>글 제목</th>
								<th>상세 내용</th>
								<th>글쓴이</th>
							</tr>
						</thead>
						<!-- 게시글 목록 표출 부분 -->
						<tbody id="dataSection">			
						</tbody>
					</table>
			</div>
			
			<div id = "page-selection"class="panel-footer">
			 <ul id="pagination-demo" class="pagination-sm"></ul>
			</div>
		</div>
	</div>
</body>
</html>