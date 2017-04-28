<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>내 정보</title>

<link rel="stylesheet" type="text/css"
	href="/grouping/resources/stylesheets/main.css">
<link rel="stylesheet" type="text/css"
	href="/grouping/resources/stylesheets/groupframe.css">

</head>
<script>
function updateFavorite(id){
	$.ajax({
		url : "/grouping/group/updateFavoriteGroupList.do",
		data : {
			"seq_grp_number" : id
			},
		dataType : 'json',
		type : "post",
		async : false,
		success : function(jsonData) {
			group_management();
		},
		error : function(jsonData) {
			alert("실패");
		}
	});
	
}

function deleteGroup(id){
	var con_test = confirm("그룹을 삭제합니다. 정말로 삭제하시겠습니까?");
	if(con_test == true){ 
		$.ajax({
			url : "/grouping/group/deleteGroup.do",
			data : {
				"seq_grp_number" : id
				},
			dataType : 'json',
			type : "post",
			async : false,
			success : function(jsonData) {
				alert("gg");
				group_management();
			},
			error : function(jsonData) {
				alert("실패");
			}
		});
		
	}
	
}
function outGroup(id){
	var con_test = confirm("그룹을 탈퇴합니다. 정말로 탈퇴하시겠습니까?");
	if(con_test == true){ 
		$.ajax({
			url : "/grouping/group/outGroup.do",
			data : {
				"seq_grp_number" : id
				},
			dataType : 'json',
			type : "post",
			async : false,
			success : function(jsonData) {
				group_management();
			},
			error : function(jsonData) {
				alert("실패");
			}
		});
		
	}
	
}
</script>
<body>

	<div class="col-md-9">
		<div class="panel panel-default panel-table">
			<div class="panel-heading">
				<div class="row">
					<div class="col col-xs-6">
						<h3 class="panel-title">즐겨찾기 그룹</h3>
					</div>
				</div>
			</div>
			<div class="panel-body group-body">
				<form id="communityBoardSearchForm" name="communityBoardSearchForm"
					method="POST">
					<input type="hidden" id="page" name="page" />
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
							<c:forEach items="${favorite_group}" var="grp">
								<tr>
								<td class="favorite_td">
											<button type="button"
													class="btn btn-default btn-sm favorite-btn" id = "${grp.seq_grp_number}" onclick="updateFavorite(this.id)">

												<span class="glyphicon glyphicon-star" id = "${grp.seq_grp_number}">
													</span>
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
				</form>

			</div>

		</div>

	</div>
	<div class="col-md-9">
		<div class="panel panel-default panel-table">
			<div class="panel-heading">
				<div class="row">
					<div class="col col-xs-6">
						<h3 class="panel-title">회원이 속한 모든 그룹</h3>
					</div>
					<div class="col col-xs-6 text-right">
						<button type="button" class="btn btn-sm btn-primary btn-create">Create
							New</button>
					</div>
				</div>
			</div>
			<div class="panel-body group-body">
				<form id="communityBoardSearchForm" name="communityBoardSearchForm"
					method="POST">
					<input type="hidden" id="page" name="page" />
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
									<c:set var="favorite_yn" value="{grp.favorite_yn}" />
									<c:choose>
										<c:when test="${grp.grp_favorite_yn ne null}">
											<td class="favorite_td">
											<button type="button"
													class="btn btn-default btn-sm favorite-btn" id = "${grp.seq_grp_number}" onclick="updateFavorite(this.id)">

												<span class="glyphicon glyphicon-star" id = "${grp.seq_grp_number}">
													</span>
												</button></td>
										</c:when>
										<c:otherwise>
											<td class="favorite_td">
												<button type="button" class="btn btn-default btn-sm favorite-btn" id = "${grp.seq_grp_number}" onclick="updateFavorite(this.id)">
												<span class="glyphicon glyphicon-star-empty" id = "${grp.seq_grp_number}"></span>
												</button>
											</td>
										</c:otherwise>
									</c:choose>
									<td>${grp.grp_title}</td>
									<td>${grp.grp_content}</td>
									<td>
										<button>접속</button>
									</td>
									
									<c:set var="user_id" value="${user_id}" />
										<c:choose>				
										<c:when test="${grp.grp_leader_id eq user_id}">
											<td class="out_td">
												<button type="button" class="btn btn-default btn-sm favorite-btn" id = "${grp.seq_grp_number}" onclick="deleteGroup(this.id)">								
												<span class="glyphicon glyphicon-trash" id = "${grp.seq_grp_number}"></span>
												</button>
											</td>
										</c:when>
										<c:otherwise>
											<td class="out_td">
												<button type="button" class="btn btn-default btn-sm favorite-btn" id = "${grp.seq_grp_number}" onclick="outGroup(this.id)">								
												<span class="glyphicon glyphicon-log-out" id = "${grp.seq_grp_number}"></span>
												</button>
											</td>
										</c:otherwise>
									</c:choose>

								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>

			</div>
			<div class="panel-footer">
				<div class="row">
					<div class="col col-xs-4">Page 1 of 5</div>
					<div class="col col-xs-8">
						<ul class="pagination hidden-xs pull-right">
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
						</ul>
						<ul class="pagination visible-xs pull-right">
							<li><a href="#">«</a></li>
							<li><a href="#">»</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

	</div>


</body>
</html>