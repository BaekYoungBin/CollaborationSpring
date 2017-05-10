<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파일 게시판</title>
</head>
<script>	
$(function(){
	
    //부트스트랩 fileinput 라이브러리 적용
   	$("#fileinput").fileinput();   
  	var list = new Array();
  	
/*
	파일 리스트 getJSON으로 받아오는 함수
*/
   $.getJSON('/grouping/file/selectFileList.do',
		 function(jsonData){
	   		var dataform = JSON.stringify(jsonData);
			var temp = JSON.parse(dataform);
			var text;
			var i = 1;			
			$.each(temp, function(key, value){	
				text +="<tr>";
				text +="<td>"+i+"</td>";
				text +="<td><a href='javascript:loadFileDetail("+value.seq_file_number+");'>"+value.file_title+"</a></td>";
				text +="<td>"+value.file_content+"</td>";
				text +="<td>"+value.file_reg_user_name+"</td>";
				text +="</tr>";		
				i++;
			});
			$("#datasection").html(text);			
		});
});

/*
	파일 리스트 getJSON으로 받아오는 함수
	parameter : seq_file_number
*/
function loadFileDetail(seq_file_number){
  	$.getJSON('/grouping/file/selectFileDetail.do?seq_file_number='+seq_file_number,
		function(jsonData){
	   		var dataform = JSON.stringify(jsonData);
			var temp = JSON.parse(dataform);	
			$("#detail_seq_file_number").val(temp.seq_file_number);			
			$("#detail_file_title").val(temp.file_title);
			$("#detail_file_content").val(temp.file_content);
			$("#detail_file_reg_user_name").val(temp.file_reg_user_name);
			$("#detail_file_udt_dt").val(temp.file_udt_dt);
			$("#detail_file_name").val(temp.file_name);		
			$("#filedetailmodal").modal('show');
  	});

}

/*
	새 파일 버튼을 눌렀을 때 모달 불러오는 함수
*/
function loadFileUploadModal(){
	$("#fileuploadmodal").modal('show');
}

/*
	새 파일 submit이 눌렸을 때 함수
	formData를 통해 multipart데이터 저장
	Ajax 방식
	success : 업로드 모달 닫기
*/
$("#uploadForm").on("submit", function(event){
	event.preventDefault();
	var formData = new FormData(); 
	formData.append("file_title", $("input[name=file_title]").val()); 
	formData.append("file_content", $("textarea[name=file_content]").val()); 
	formData.append("report", $("input[name=report]")[0].files[0]);    	
	$.ajax({ url:"/grouping/file/fileUpload.do", 
		data: formData, 
		processData: false, 
		contentType: false, 
		type: 'POST', 
		success:
			function(data){
				alert("성공적으로 업로드 되었습니다");
				$("#fileuploadmodal").modal('hide');
			} 
	});

})

/*
	수정 버튼 눌렀을 때 폼 활성화
*/
function modifyFileInfo(){
	$("#detail_file_title").removeAttr('disabled');
	$("#detail_file_content").removeAttr('disabled');		
	$("#modifyBtn").css("visibility", "hidden");
	$("#confirmBtn").css("visibility", "visible"); 		
}

/*
	수정-확인 버튼 눌렀을 때 데이터 저장하는 함수
	Ajax 방식
	success : 업로드 모달 닫기
*/
function updateFileInfo(){
  	$.ajax({
		url : "/grouping/file/updateFileInfo.do",
		data : $('#modifyForm').serialize(),
		dataType : 'json',
		type : "post",
		async : false,
		success : function(jsonData) {
			$("#filedetailmodal").modal('hide');
		},
		error : function(jsonData) {
			alert("실패");
		}
	});	
}

/*
	삭제 버튼 눌렀을 때 데이터 삭제하는 함수
	Ajax 방식
	success : 모달 닫기
*/
function deleteFileInfo(){
   	$.ajax({
		url : "/grouping/file/deleteFileInfo.do",
		data : $('#modifyForm').serialize(),
		dataType : 'json',
		type : "post",
		async : false,
		success : function(jsonData) {
			$("#filedetailmodal").modal('hide');
		},
		error : function(jsonData) {
			alert("실패");
		}
	});
}

/*
	파일 다운로드 버튼 눌렀을 때 seq_file_number를 통해 다운받는 함수
*/
function downloadFile(){
	location.href="/grouping/file/fileDownload.do?seq_file_number="+$("#detail_seq_file_number").val();
	$("#filedetailmodal").modal('hide');
}

/*
	모달 닫기 함수
*/
function closeModal(){
  	$("#filedetailmodal").modal('hide');
}

/*
	모달 닫기 이벤트 발생 시 페이지 리로드
*/
$('#fileuploadmodal').on('hidden.bs.modal', function (e) {
  	loadFileUpload();
});
$('#filedetailmodal').on('hidden.bs.modal', function (e) {
  	loadFileUpload();
});
</script>
	<body>
	    <div class="col-md-10 col-md-offset-1">
	        <div class="panel panel-default panel-table">
	        	<!-- 패널 헤더 -->
	            <div class="panel-heading">
	                <div class="row">
	                    <div class="col col-xs-6">
	                        <h3 class="panel-title">파일공유 게시판</h3>
	                    </div>
	                    <!-- 새 파일 버튼 -->
	                    <div class="col col-xs-6 text-right">
	                        <button type="button" class="btn btn-sm btn-primary btn-create" onclick="loadFileUploadModal();">새 파일 업로드</button>
	                    </div>
	                </div>
	            </div>
	            <!-- 패널 바디 -->
	            <div class="panel-body">
	                <table class="table table-striped table-bordered table-list">
	                    <thead>                  
	                        <tr>                         
					<th>파일 번호</th>
	                            <th>파일 제목</th>
	                            <th>파일 설명</th>
	                            <th>글쓴이</th>
	                        </tr>         
	                    </thead>
	                    <tbody id = "datasection">                         
	                    </tbody>
	                </table>
	            </div>
	        </div>
	    </div>
	    <!-- 새 파일 업로드 모달 -->
		<div class="modal fade" id="fileuploadmodal">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- 모달 헤더 -->
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">새 파일 추가</h4>
					</div>
					<!-- 모달 바디 -->
					<div class="modal-body">
						<form id="uploadForm" method="post" enctype="multipart/form-data">
							파일 제목 : <input type="text" id="file_title" name="file_title">
							<br> 파일 상세 정보 : <br>
							<textarea rows="4" cols="50" id="file_content" name="file_content"></textarea>
							<label class="control-label"> 파일 선택 </ label> 
							<input id="fileinput" type="file" name="report" class="file">
						</form>
					</div>
				</div>
			</div>
		</div>
		<!--  파일 상세 모달 -->
			<div class="modal fade" id="filedetailmodal">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- 모달 헤더 -->
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">파일 상세</h4>
					</div>
					<!-- 모달 바디 -->
					<div class="modal-body">						
						<form id="modifyForm" method="post" enctype="multipart/form-data">
						<input type="hidden" id = "detail_seq_file_number" name = "seq_file_number">
							파일 제목 : <input type="text" id="detail_file_title" name="file_title" disabled="disabled">
							<br>
							파일 상세 정보 : 
							<br>
							<textarea rows="4" cols="50" id="detail_file_content" name="file_content" disabled="disabled"></textarea>
							<br>
							파일 생성자 : <input type="text" id="detail_file_reg_user_name" name="file_reg_user_name" disabled="disabled">	
							<br>
							파일 수정일자 : <input type="text" id="detail_file_udt_dt" name="file_udt_dt" disabled="disabled">	
							<br>
							파일 이름 : <input type="text" id="detail_file_name" name="file_name" disabled="disabled">		
						</form>											
					</div>
					<div class="modal-footer">
					<button type="button" id = "modifyBtn" class="btn btn-primary"
							onclick="modifyFileInfo();">정보 수정</button>
						<button type="button" id = "confirmBtn" class="btn btn-primary" onclick="updateFileInfo();"  style="visibility: hidden">확인</button>
						<button type="button" class="btn btn-primary" onclick="deleteFileInfo(); ">파일 삭제</button>
						<button type="button" class="btn btn-primary" onclick="downloadFile(); ">파일 다운</button>
						<button type="button" class="btn btn-primary" onclick="closeModal();">닫기</button>
					</div>
				</div>
			</div>
		</div>
    </body>
</html>