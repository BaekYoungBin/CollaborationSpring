<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
$(document).ready(function() {
	$("#createGroup").on("submit", function(event){
		$.ajax({
			url : "/grouping/group/groupRegister.do",
			data : $('#createGroup').serialize(),
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
	});
}); /* 
function creGroup(){
	$.ajax({
		url : "/grouping/group/groupRegister.do",
		data : $('#createGroup').serialize(),
		dataType : 'json',
		type : "post",
		async : false,
		success : function(jsonData) {
	
		  $('#reg_grp').hide();
		  $('#main').fadeIn();

			 loadGroup();
		},
		error : function(jsonData) {
			alert("실패");
		}
	});

} */
function removeNewestGroup(seq_grp_number){
	$.ajax({
		url : "/grouping/group/updateNewestGroupList.do",
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
				<div class="col col-xs-6 text-right">
					<button type="button" class="btn btn-sm btn-primary btn-create"
						data-toggle="modal" data-target="#more_grp">그룹 더 보기</button>
					<div id="more_grp" class="modal fade" role="dialog">
						<div class="modal-dialog">
							<div class="more-group-body">
								<div class="modal-content" id="grp_open">
									<table class="table table-striped table-bordered table-list">
										<thead>
											<tr>
												<th>즐겨찾기 설정</th>
												<th>그룹 이름</th>
												<th>그룹 설명</th>
												<th>그룹 설정</th>
											</tr>
										</thead>
										<tbody id="datasection">
											<c:forEach items="${group}" var="grp">
												<tr>
													<td class="favorite_td"><button type="button"
															class="btn btn-default btn-sm">
															<span class="glyphicon glyphicon-star"></span>
														</button></td>
													<td>${grp.grp_title}</td>
													<td>${grp.grp_content}</td>
													<td>
														<button>그룹 입장</button>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>


								</div>
							</div>
						</div>
					</div>

					<button type="button" id="cre_grp_btn"
						class="btn btn-sm btn-primary btn-create" data-toggle="modal"
						data-target="#reg_grp">그룹 생성</button>

					<div id="reg_grp" class="modal fade" role="dialog" >
						<div class="modal-dialog">
							Modal content
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">새 그룹 생성</h4>
								</div>

								<form id = "createGroup">
									<div class="modal-body">
										<div class="form-group">
											그룹 이름: <input type="text" class="form-control" id="grp_title"
												name="grp_title">
										</div>
										<div class="form-group">
											그룹 정보:
											<textarea class="form-control" rows="5" id="grp_content"
												name="grp_content"></textarea>
										</div>
										
									</div>
										<div class="modal-footer">						
										<input type="submit" class="btn" id = "creBtn" />
									</div>
									</form>
									
							
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="panel-body">
			<div id="newestProject">
				<span class='hh'>최근 사용한 프로젝트</span>
				<c:forEach items="${newstGroup}" var="grp">
					<div class="panel panel-default panel-table prj"
						id='${grp.seq_grp_number }'>
						<div class="group-header">
							<div class='title' style='text-overflow: ellipsis;'>
								${grp.grp_title}</div>
      						  <a href="javascript:void(0);" name = "${grp.seq_grp_number }" onclick="removeNewestGroup(this.name);"><span class="glyphicon glyphicon-remove"></span></a>
						</div>
						<hr>
						<div class="group-body-1">
							<span>그룹 설명 :</span>
							<div class='detail' style='text-overflow: ellipsis;'>
								${grp.grp_content}</div>
						</div>
						<div class="group_footer">
							<button class="btn btn-sm btn-primary btn-create group_sel_btn">그룹
								입장</button>
						</div>
					</div>
				</c:forEach>

			</div>
			<div id="favoriteProject">
				<span class='hh'>즐겨찾기한 프로젝트</span>
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
							<button class="btn btn-sm btn-primary btn-create group_sel_btn">그룹
								입장</button>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>

	</div>
</div>
</body>
</html>