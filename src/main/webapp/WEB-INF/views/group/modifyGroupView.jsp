<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>내 정보</title>
<link rel="stylesheet" type="text/css" href="/grouping/resources/stylesheets/default.css">
</head>
<script>

	/*
		그룹 설정 중 즐겨찾기 버튼 눌렀을 때 즐겨찾기 반영하는 함수
		트랜잭션을 이용해 Favorite추가 , Favorite 그룹 수가 5개 넘을 시 롤백
		Ajax
		data : seq_grp_number -> String으로 전송 후 DB에서 업데이트처리
		success : 그룹 관리 서브페이지 리로드
	*/
	function updateFavoriteGroup(seq_grp_number) {
		$.ajax({
			url : "/grouping/group/updateFavoriteGroupListAjax.do",
			data : {
				"seq_grp_number" : seq_grp_number
			},
			dataType : 'json',
			type : "post",
			async : false,
			success : function(jsonData) {
				group_management();
			},
			error : function(jsonData) {
				alert("즐겨찾기는 최대 5개까지 설정 가능합니다.");
				group_management();
			}
		});
	}
	
	/*
		그룹 설정 중 그룹리더일 때, 삭제 버튼 눌렀을 때 삭제 반영하는 함수	
		Ajax
		data : seq_grp_number -> String으로 전송 후 DB에서 삭제 처리
		success : 그룹 관리 서브페이지 리로드
	*/	
	function deleteGroup(seq_grp_number) {
		var con_test = confirm("그룹을 삭제합니다. 정말로 삭제하시겠습니까?");
		if (con_test == true) {
			$.ajax({
				url : "/grouping/group/deleteGroupAjax.do",
				data : {
					"seq_grp_number" : seq_grp_number
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
	
	/*
		그룹 설정 중 일반 유저의 그룹 탈퇴 버튼 눌렀을 때 탈퇴 반영하는 함수		
		Ajax
		data : seq_grp_number -> String으로 전송 후 DB에서 삭제 처리
		success : 그룹 관리 서브페이지 리로드
	*/
	function deleteMemberInGroup(seq_grp_number) {
		var con_test = confirm("그룹을 탈퇴합니다. 정말로 탈퇴하시겠습니까?");
		if (con_test == true) {
			$.ajax({
				url : "/grouping/group/deleteMemberInGroupAjax.do",
				data : {
					"seq_grp_number" : seq_grp_number
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
			<div class="group-body">
				<form id="communityBoardSearchForm" name="communityBoardSearchForm" method="POST">
					<input type="hidden" id="page" name="page" />
					<table class="table table-striped table-bordered table-list">
						<thead>
							<tr>
								<th>즐겨찾기 설정</th>
								<th>그룹 이름</th>
								<th>그룹 설명</th>
								<th>그룹 접속</th>
							</tr>
						</thead>
						<tbody id="datasection">
							<c:forEach items="${favorite_group}" var="grp">
								<tr>
									<td class="favorite_td">
										<button type="button" id="${grp.seq_grp_number}"
											onclick="updateFavoriteGroup(this.id)" class="btn btn-default btn-sm favorite-btn">
											<span id="${grp.seq_grp_number}" class="glyphicon glyphicon-star"></span>
										</button>
									</td>
									<td>${grp.grp_title}</td>
									<td>${grp.grp_content}</td>
									<td><a href="/grouping/group/redirectGroupMain.do?seq_grp_number=${grp.seq_grp_number}">접속</a>
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
				</div>
			</div>
			<div class="group-body">
				<form id="communityBoardSearchForm" name="communityBoardSearchForm" method="POST">
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
									<!-- 그룹의 즐겨찾기 설정이 되어있으면 ★ 즐겨찾기가 null이면 ☆로 변경한 후 리스트에 추가하는 부분 -->
									<c:set var="favorite_yn" value="{grp.favorite_yn}" />
									<c:choose>
										<c:when test="${grp.grp_favorite_yn ne null}">
											<td class="favorite_td">
												<button type="button" id="${grp.seq_grp_number}"
													onclick="updateFavoriteGroup(this.id)" class="btn btn-default btn-sm favorite-btn">
													<span id="${grp.seq_grp_number}" class="glyphicon glyphicon-star"> </span>
												</button>
											</td>
										</c:when>
										<c:otherwise>										
											<td class="favorite_td">
												<button type="button" id="${grp.seq_grp_number}" 
												onclick="updateFavoriteGroup(this.id)" class="btn btn-default btn-sm favorite-btn">
													<span id="${grp.seq_grp_number}" class="glyphicon glyphicon-star-empty"></span>
												</button>
											</td>
											
										</c:otherwise>
									</c:choose>
									<td>${grp.grp_title}</td>
									<td>${grp.grp_content}</td>
									<td><a href="/grouping/group/redirectGroupMain.do?seq_grp_number=${grp.seq_grp_number}">접속</a>
										<c:set var="user_id" value="${user_id}" /> <c:choose>
											<c:when test="${grp.grp_leader_id eq user_id}">
												<button type="button" id="${grp.seq_grp_number}" 
												onclick="deleteGroup(this.id)" class="btn btn-default btn-sm favorite-btn">
													<span class="glyphicon glyphicon-trash" id="${grp.seq_grp_number}"></span>
												</button>
											</c:when>
											<c:otherwise>
												<button type="button" id="${grp.seq_grp_number}" 
												onclick="deleteMemberInGroup(this.id)" class="btn btn-default btn-sm favorite-btn">
													<span id="${grp.seq_grp_number}" class="glyphicon glyphicon-log-out"></span>
												</button>
											</c:otherwise>
										</c:choose></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
	<!-- 그룹 생성 모달 -->

</body>
</html>