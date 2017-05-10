<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<script>
$("form").validate({
    //validation이 끝난 이후의 submit 직전 추가 작업할 부분      
    //규칙
    rules: {
    	grp_title: {
            required : true, 
            maxlength : 50
        },
        grp_content: {
            required : true,
            maxlength : 200
        }
    },
    //규칙체크 실패시 출력될 메시지
    messages : {
    	grp_title: {
            required : "그룹 이름 필수로 입력하세요",
            maxlength : "최대 50글자 이하이어야 합니다"        
        },
        grp_content: {
            required : "그룹 정보 필수로 입력하세요",
            maxlength : "최대 200글자 이하이어야 합니다"
        }
    }
}); 



	/*
		그룹 생성 함수
		Ajax 방식
		data : insertGroupForm -> GroupVO로 전송 후 DB에서 생성
		success : 모달 닫기
	*/
	function insertGroup() {
		$.ajax({
			url : "/grouping/group/insertGroupAjax.do",
			data : $('#insertGroupForm').serialize(),
			dataType : 'json',
			type : "post",
			async : false,
			success : function(jsonData) {
				$("#insertGroupModal").modal('hide');
			},
			error : function(jsonData) {
				alert("실패");
			}
		});
	}
	
	/*
		최근 사용한 그룹 중 X표시를 눌러 목록에서 지웠을 때 처리하는 함수
		Ajax 방식
		data : seq_grp_number -> String으로 전송 후 DB에서 사용 날짜를 null로 변경
		success : 그룹 로드 서브페이지 리로드
	*/
	function updateNewestGroupListAjax(seq_grp_number) {
		$.ajax({
			url : "/grouping/group/updateNewestGroupListAjax.do",
			data : {
				"seq_grp_number" : seq_grp_number
			},
			dataType : 'json',
			type : "post",
			async : false,
			success : function(jsonData) {
				loadGroup();
			},
			error : function(jsonData) {
				alert("실패");
			}
		});
	}
	
	/*
		모달 닫기 버튼 이벤트가 발생 했을 시 그룹 페이지 리로드
	*/
	$('#insertGroupModal').on('hidden.bs.modal', function(e) {
		loadGroup();
	});
	
	/*
		그룹 선택 했을 때 메인페이지로 redirect
	*/
	function redirectGroupMain(seq_grp_number) {
		location.href = "/grouping/group/redirectGroupMain.do?seq_grp_number="
				+ seq_grp_number;

	}
</script>

</head>
<body>
	<div id="main" class="col-md-10 col-md-offset-1">
		<div class="panel panel-default panel-table">
			<div class="panel-heading">
				<div class="row">
					<div class="col col-xs-6">
						<h3 class="panel-title">그룹 선택</h3>
					</div>
					
					<!-- 그룹 더 보기 버튼, 그룹 더 보기 모달 -->
					<div class="col col-xs-6 text-right">
						<button type="button" class="btn btn-sm btn-primary btn-create"
							data-toggle="modal" data-target="#showMoreGroupModal">그룹 더 보기</button>
						<div id="showMoreGroupModal" class="modal fade" role="dialog">
							<div class="modal-dialog">
								<div class="more-group-body">
									<div class="modal-content" id="grp_open">
										<table class="table table-striped table-bordered table-list">
											<thead>
												<tr>
													<th>그룹 이름</th>
													<th>그룹 설명</th>
													<th>그룹 설정</th>
												</tr>
											</thead>
											<tbody id="datasection">
												<c:forEach items="${group}" var="grp">
													<tr>
														<td>${grp.grp_title}</td>
														<td>${grp.grp_content}</td>
														<td>
															<button id="${grp.seq_grp_number}"
																onclick="redirectGroupMain(this.id);">그룹 입장</button>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						
						<!-- 그룹 생성 버튼, 그룹 생성 모달 -->
						<button type="button" id="cre_grp_btn"
							class="btn btn-sm btn-primary btn-create" data-toggle="modal"
							data-target="#insertGroupModal">그룹 생성</button>
						<div id="insertGroupModal" class="modal fade" role="dialog">
							<div class="modal-dialog">
								Modal content
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">새 그룹 생성</h4>
									</div>
									<form id="insertGroupForm">
										<div class="modal-body">
											<div class="form-group">
												그룹 이름: <input type="text" class="form-control" id="grp_title" name="grp_title">
											</div>
											<div class="form-group">
												그룹 정보:
												<textarea class="form-control" rows="5" id="grp_content" name="grp_content"></textarea>
											</div>
										</div>
									</form>
									<div class="modal-footer">
										<Button type="button" class="btn" id="creBtn" onclick="insertGroup();">그룹 생성</Button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 유저들의 그룹이 나타나는 화면 -->
			<div class="panel-body">
				<div id="newestProject">
					<span class="list_subject">최근 사용한 그룹</span>
					<c:forEach items="${newstGroup}" var="grp">
						<div class="panel panel-default panel-table prj"
							id='${grp.seq_grp_number }'>
							<div class="group-header">
								<div class='title' style='text-overflow: ellipsis;'>
									${grp.grp_title}</div>
								<a href="javascript:void(0);" name="${grp.seq_grp_number }"
									onclick="updateNewestGroupListAjax(this.name);">
									<span class="glyphicon glyphicon-remove"></span></a>
							</div>
							<hr>
							<div class="group-body-1">
								<span>그룹 설명 :</span>
								<div class='detail' style='text-overflow: ellipsis;'>
									${grp.grp_content}</div>
							</div>
							<div class="group_footer">
								<button class="btn btn-sm btn-primary btn-create group_sel_btn "
									id="${grp.seq_grp_number}" onclick="redirectGroupMain(this.id);">그룹입장</button>
							</div>
						</div>
					</c:forEach>
				</div>
				
				<div id="favoriteProject">
					<span class = "list_subject">즐겨찾기한 그룹</span>
					<c:forEach items="${favoriteGroup}" var="grp">
						<div class="panel panel-default panel-table prj"
							id='${grp.seq_grp_number }'>
							<div class="group-header">
								<div class='title' style='text-overflow: ellipsis;'>
									${grp.grp_title}</div>
							</div>
							<hr>
							<div class="group-body-1">
								<span>그룹 설명 :</span>
								<div class='detail' style='text-overflow: ellipsis;'>
									${grp.grp_content}</div>
							</div>
							<div class="group_footer">
								<button class="btn btn-sm btn-primary btn-create group_sel_btn"
									id="${grp.seq_grp_number}" onclick="redirectGroupMain(this.id);">그룹입장</button>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
</html>