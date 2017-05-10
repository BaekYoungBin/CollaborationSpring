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
	var events_array = new Array();

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
												member += "<input type='radio' id = '"+value.user_id+"' name='work_user_id' value='" + value.user_id + "'>"
														+ value.user_name;

												$("#memberlist2").html(member);
											});
						});

		$.getJSON('/grouping/work/selectWorkList.do', function(data) {
			var dataform = JSON.stringify(data);
			var list = JSON.parse(dataform);
			$.each(list, function(key, value) {

				events_array.push({
					'id' : value.seq_work_number,
					'title' : value.work_subject,
					'tip' : value.work_content,
					'start' : value.work_start_date,
					'end' : value.work_end_date
				})

			});
			$('#calendar').fullCalendar({
				selectable : true,
				height: 700,
				events : events_array,
				eventRender : function(event, element) {
					element.attr('title', event.tip);
				},
				eventClick : function(calEvent, jsEvent, view) {
					loadDetailWork(calEvent.id);
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
				$("input:radio[id='" + jsonData.work_user_id + "']").prop(
						"checked", true);
				$("#workdetailmodal").modal('show');
			},
			error : function(jsonData) {
				alert("실패");
			}
		});
	}

	function modifywork() {

		$("#work_subject").removeAttr('disabled');
		$("#work_start_date").removeAttr('disabled');
		$("#work_end_date").removeAttr('disabled');
		$("#work_content").removeAttr('disabled');
		$("#modifyBtn").css("visibility", "hidden");
		$("#confirmBtn").css("visibility", "visible");

	}
	function updatework() {

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
	function deleteWork() {
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
	$('#workdetailmodal').on('hidden.bs.modal', function(e) {
		loadCalendar();
	});
</script>
<body>
	<div class="col-md-10 col-md-offset-1">

		<div class="panel panel-default panel-table">
			<div class="panel-heading"></div>
			<div class="panel-body" style="height:79vh;">
				<div id='calendar'></div>
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
							<div class="modal-body" >
								<form id="update_work_form">
									<div id="memo_form">
										<input type="hidden" id="add_seq_work_number"
											name="seq_work_number"> <input type="hidden"
											id="add_work_category" name="work_category"> 업무주제<input
											type="text" id="work_subject" name="work_subject"
											disabled="disabled"> <br> 시작일 <input type="date"
											id="work_start_date" name="work_start_date"
											disabled="disabled"> <br> 마감일 <input type="date"
											id="work_end_date" name="work_end_date" disabled="disabled">
										<br> 참여자
										<div id="memberlist2"></div>
										<br> 내용 <input type="text" id="work_content"
											name="work_content" disabled="disabled"> <br>
									</div>
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" id="modifyBtn" class="btn btn-primary"
									onclick="modifywork();">수정</button>
								<button type="button" id="confirmBtn" class="btn btn-primary"
									onclick="updatework();" style="visibility: hidden">확인</button>
								<button type="button" class="btn btn-primary"
									onclick="deleteWork(); ">삭제</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
</body>
</html>