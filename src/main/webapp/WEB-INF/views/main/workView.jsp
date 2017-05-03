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
		var member = "";
		$
				.getJSON(
						'/grouping/work/selectMemberList.do',
						function(jsonData) {
							var dataform = JSON.stringify(jsonData);
							var temp = JSON.parse(dataform);
							$
									.each(
											temp,
											function(key, value) {
												member += "<input type='checkbox' id = '"+value.user_id+"' name='work_user_id' value='" + value.user_id + "'>"
														+ value.user_name;
												
												$("#memberlist").html(member);
												$("#memberlist2").html(member);
												
											});
						});

		$.getJSON('/grouping/work/selectWorkList.do',
						function(jsonData) {
							var dataform = JSON.stringify(jsonData);
							var temp = JSON.parse(dataform);
			
							var list = new Array();
							list[0] = '';
							list[1] = '';
							list[2] = '';
							list[3] = '';
							list[4] = '';
							list[5] = '';
							
							$.each(temp,function(key, value) {
								
												if (value.work_category == "first_list_name") {
													list[0] += "<span class='list-group-item list-group-item-action'>업무 이름:"
															+ "<a href='javascript:loadDetailWork("
															+ value.seq_work_number
															+ ");'>"
															+ value.work_subject
															+ "</a></span>";
													$("#first-list").html(
															list[0]);
												} else if (value.work_category == "second_list_name") {
													list[1] += "<span class='list-group-item list-group-item-action'>업무 이름:"
															+ "<a href='javascript:loadDetailWork("
															+ value.seq_work_number
															+ ");'>"
															+ value.work_subject
															+ "</a></span>";
													$("#second-list").html(
															list[1]);
												} else if (value.work_category == "third_list_name") {
													list[2] += "<span class='list-group-item list-group-item-action'>업무 이름:"
															+ "<a href='javascript:loadDetailWork("
															+ value.seq_work_number
															+ ");'>"
															+ value.work_subject
															+ "</a></span>";
													$("#third-list").html(
															list[2]);
												} else if (value.work_category == "fourth_list_name") {
													list[3] += "<span class='list-group-item list-group-item-action'>업무 이름:"
															+ "<a href='javascript:loadDetailWork("
															+ value.seq_work_number
															+ ");'>"
															+ value.work_subject
															+ "</a></span>";
													$("#fourth-list").html(
															list[3]);
												} else if (value.work_category == "fifth_list_name") {
													list[4] += "<span class='list-group-item list-group-item-action'>업무 이름:"
															+ "<a href='javascript:loadDetailWork("
															+ value.seq_work_number
															+ ");'>"
															+ value.work_subject
															+ "</a></span>";
													$("#fifth-list").html(
															list[4]);
												} else if (value.work_category == "sixth_list_name") {
													list[5] += "<span class='list-group-item list-group-item-action'>업무 이름:"
															+ "<a href='javascript:loadDetailWork("
															+ value.seq_work_number
															+ ");'>"
															+ value.work_subject
															+ "</a></span>";
													$("#sixth-list").html(
															list[5]);
												}

											});
						});

	});

	function loadDetailWork(seq_work_number) {
		$.ajax({
			url : "/grouping/work/selectWorkDetail.do",
			data : {
			"seq_work_number" : seq_work_number
			},	
			dataType : 'json',
			type : "post",
			async : false,
			success : function(jsonData) {
				$("#add_seq_work_number").val(seq_work_number);
				$("#work_subject").val(jsonData.work_subject);
				$("#work_start_date").val(jsonData.work_start_date);
				$("#work_end_date").val(jsonData.work_end_date);
				$("#work_content").val(jsonData.work_content);
				$("input:checkbox[id='"+jsonData.work_user_id+"']").prop("checked", true);
				$("#workdetailmodal").modal('show');			
			},
			error : function(jsonData) {
				alert("실패");
			}
		});

	} 

	function loadAddWork(id) {
		
		$("#add_work_category").val(id);
		$("#addworkmodal").modal('show');
	}
	
	function loadnamemodify(id){
		
		$("#work_category").val(id);
		$("#modifylistname").modal('show');
	}
	
	function addwork(){
		$.ajax({
			url : "/grouping/work/workRegister.do",
			data : $('#insertForm').serialize(),
			dataType : 'json',
			type : "post",
			async : false,
			success : function(jsonData) {
				$("#addworkmodal").modal('hide');
				
			},
			error : function(jsonData) {
				alert("실패");
			}
		});
	}
	function modifylistname(){
		$.ajax({
			url : "/grouping/work/modifyListName.do",
			data : $('#listnamemodify').serialize(),
			dataType : 'json',
			type : "post",
			async : false,
			success : function(jsonData) {
				$("#modifylistname").modal('hide');
				//loadWork();
			},
			error : function(jsonData) {
				alert("실패");
			}
		});	
	}
	function modifywork(){

		
	 		$("#work_subject").removeAttr('disabled');
			$("#work_start_date").removeAttr('disabled');
			$("#work_end_date").removeAttr('disabled'); 
			$("#work_content").removeAttr('disabled'); 
		$("#modifyBtn").css("visibility", "hidden");
			$("#confirmBtn").css("visibility", "visible"); 
		
	}
	function updatework(){
		
		$.ajax({
			url : "/grouping/work/updateWork.do",
			data : $('#update_work_form').serialize(),
			dataType : 'json',
			type : "post",
			async : false,
			success : function(jsonData) {
				$("#workdetailmodal").modal('hide');
			},
			error : function(jsonData) {
				alert("실패");
			}
		});

	}
function deleteWork(){
		var seq_work_number = $("#add_seq_work_number").val();
		$.ajax({
			url : "/grouping/work/deleteWork.do",
			data : {
			"seq_work_number" : seq_work_number
			},
			dataType : 'json',
			type : "post",
			async : false,
			success : function(jsonData) {
				$("#workdetailmodal").modal('hide');
			},
			error : function(jsonData) {
				alert("실패");
			}
		});

	}
	$('#workdetailmodal').on('hidden.bs.modal', function (e) {
		loadWork();
		});
	$('#modifylistname').on('hidden.bs.modal', function (e) {
		loadWork();
		});
	$('#addworkmodal').on('hidden.bs.modal', function (e) {
		loadWork();
		});	
	
</script>
<body>
	<div id="work_area">
		<div class="col-md-2">
			<div class="panel panel-default panel-table">
				<div class="panel-heading">
					${worklistname.first_list_name }
					<button id="first_list_name" class="btn btn-sm btn-primary btn-create" onclick="loadAddWork(this.id);">업무
						추가</button>
					<button id="first_list_name" class="btn btn-sm btn-primary btn-create" onclick="loadnamemodify(this.id);">리스트
						이름 변경</button>
				</div>
				<div class="panel-body list-group" id="first-list"></div>

			</div>
		</div>
		<div class="col-md-2">
			<div class="panel panel-default panel-table">
				<div class="panel-heading">
					${worklistname.second_list_name }
					<button id="second_list_name" class="btn btn-sm btn-primary btn-create" onclick="loadAddWork(this.id);">업무
						추가</button>
					<button id="second_list_name" class="btn btn-sm btn-primary btn-create" onclick="loadnamemodify(this.id);">리스트
						이름 변경</button>
				</div>
				<div class="panel-body list-group" id="second-list"></div>

			</div>
		</div>
		<div class="col-md-2">
			<div class="panel panel-default panel-table">
				<div class="panel-heading">
					${worklistname.third_list_name }
					<button id="third_list_name" class="btn btn-sm btn-primary btn-create" onclick="loadAddWork(this.id);">업무
						추가</button>
					<button id="third_list_name" class="btn btn-sm btn-primary btn-create" onclick="loadnamemodify(this.id);">리스트
						이름 변경</button>
				</div>
				<div class="panel-body list-group" id="third-list"></div>

			</div>
		</div>
		<div class="col-md-2">
			<div class="panel panel-default panel-table">
				<div class="panel-heading">
					${worklistname.fourth_list_name }
					<button id="fourth_list_name" class="btn btn-sm btn-primary btn-create" onclick="loadAddWork(this.id);">업무
						추가</button>
					<button id="fourth_list_name" class="btn btn-sm btn-primary btn-create" onclick="loadnamemodify(this.id);">리스트
						이름 변경</button>
				</div>
				<div class="panel-body list-group" id="fourth-list"></div>

			</div>
		</div>
		<div class="col-md-2">
			<div class="panel panel-default panel-table">
				<div class="panel-heading">
					${worklistname.fifth_list_name }
					<button id="fifth_list_name" class="btn btn-sm btn-primary btn-create" onclick="loadAddWork(this.id);">업무
						추가</button>
					<button id="fifth_list_name" class="btn btn-sm btn-primary btn-create" onclick="loadnamemodify(this.id);">리스트
						이름 변경</button>
				</div>
				<div class="panel-body list-group" id="fifth-list"></div>

			</div>
		</div>
		<div class="col-md-2">
			<div class="panel panel-default panel-table">
				<div class="panel-heading">
					${worklistname.sixth_list_name }
					<button id="sixth_list_name" class="btn btn-sm btn-primary btn-create" onclick="loadAddWork(this.id);">업무
						추가</button>
					<button id="sixth_list_name" class="btn btn-sm btn-primary btn-create" onclick="loadnamemodify(this.id);">리스트
						이름 변경</button>
				</div>
				<div class="panel-body list-group" id="sixth-list"></div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="modifylistname">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">리스트 이름 변경</h4>
				</div>
				<div class="modal-body">
					<form id="listnamemodify">
						변경할 리스트 이름<input type="text" name="list_name"> <input
							type="hidden" id="work_category" name="work_category">
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						onclick="modifylistname();">Save changes</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<!-- 업무 추가 모달 -->
	<div class="modal fade" id="addworkmodal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">업무 추가</h4>
				</div>
				<div class="modal-body">
					<form id="insertForm">
						<div id="memo_form">
						<input type="hidden" id="add_work_category" name = "work_category">
							업무주제<input type="text" id="Task_Name" name = "work_subject"> <br> 
							시작일 <input type="date" id="Task_Sday" name = "work_start_date"> <br> 
							마감일 <input type="date" id="Task_Dday" name = "work_end_date"> <br> 
							참여자
							<div id="memberlist">
							</div>
							<br> 내용 <input type="text" id="Task_Memo" name = "work_content"> <br>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						onclick="addwork();">추가</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->



<!-- 업무 상세리스트 출력모달 -->
<div class="modal fade" id="workdetailmodal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">업무 상세</h4>
				</div>
				<div class="modal-body">
					<form id="update_work_form">
						<div id="memo_form">
						<input type="hidden" id="add_seq_work_number" name = "seq_work_number">
						<input type="hidden" id="add_work_category" name = "work_category">
							업무주제<input type="text" id="work_subject" name = "work_subject" disabled="disabled"> <br> 
							시작일 <input type="date" id="work_start_date" name = "work_start_date" disabled="disabled"> <br> 
							마감일 <input type="date" id="work_end_date" name = "work_end_date" disabled="disabled"> <br> 
							참여자
							<div id="memberlist2">
							</div>
							<br> 내용 <input type="text" id="work_content" name = "work_content" disabled="disabled"> <br>
						</div>
					</form>
				</div>
				<div class="modal-footer">
				<button type="button" id = "modifyBtn" class="btn btn-primary"
						onclick="modifywork();">수정</button>
					<button type="button" id = "confirmBtn" class="btn btn-primary"
						onclick="updatework();"  style="visibility: hidden">확인</button>
					<button type="button" class="btn btn-primary"
						onclick="deleteWork(); ">삭제</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

</body>
</html>