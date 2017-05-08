<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
   $( function() {  
	   $("#fileinput").fileinput();
	   var list = new Array();
	   $.getJSON('/grouping/file/selectFileList.do',
			 function(jsonData){
		   var dataform = JSON.stringify(jsonData);
			var temp = JSON.parse(dataform);

		var text;
		var i = 1;
			
				$.each(temp, function(key, value){	
					text +="<tr>";
					text +="<td>"+i+"</td>"; /* //javascript:asdf(); */
					text +="<td><a href='javascript:loadFileDetail("+value.seq_file_number+");'>"+value.file_title+"</a></td>";
					text +="<td>"+value.file_content+"</td>";
					text +="<td>"+value.file_reg_user_name+"</td>";
					text +="</tr>";		
					i++;
				});
				$("#datasection").html(text);
			
		});
        });
   
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
  
function loadFileUploadModal(){
	$("#fileuploadmodal").modal('show');
}
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
    			$("#fileuploadmodal").modal('hide');
    			} 
    	});

    })
  
    function modifyFileInfo(){
 		$("#detail_file_title").removeAttr('disabled');
		$("#detail_file_content").removeAttr('disabled');		
		$("#modifyBtn").css("visibility", "hidden");
		$("#confirmBtn").css("visibility", "visible"); 		
}
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
 	function downloadFile(){
 		location.href="/grouping/file/fileDownload.do?seq_file_number="+$("#detail_seq_file_number").val();
 		$("#filedetailmodal").modal('hide');
    }
    function closeModal(){
    	$("#filedetailmodal").modal('hide');
    }
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
                <div class="panel-heading">
                    <div class="row">
                        <div class="col col-xs-6">
                            <h3 class="panel-title">파일공유 게시판</h3>
                        </div>
                        <div class="col col-xs-6 text-right">
                            <button type="button" class="btn btn-sm btn-primary btn-create" onclick="loadFileUploadModal();">새 파일 업로드</button>
                        </div>
                    </div>
                </div>
                <div class="panel-body">
                <form id="communityBoardSearchForm" name="communityBoardSearchForm" method="POST">
                	<input type="hidden" id="page" name="page" />
                    <table class="table table-striped table-bordered table-list">
                        <thead>                  
                            <tr>                         
								<th class="hidden-xs">파일 번호</th>
                                <th>파일 제목</th>
                                <th>파일 설명</th>
                                <th>글쓴이</th>
                            </tr>         
                        </thead>
                        <tbody id = "datasection">
                         
                        </tbody>
                    </table>
                    </form>

                </div>
            </div>

        </div>
        <!-- 새 파일 업로드 모달 -->
	<div class="modal fade" id="fileuploadmodal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">새 파일 추가</h4>
				</div>
				<div class="modal-body">
					
					<form id="uploadForm" method="post" enctype="multipart/form-data">
						파일 제목 : <input type="text" id="file_title" name="file_title">
						<br>
						파일 상세 정보 : 
						<br>
						<textarea rows="4" cols="50" id="file_content" name="file_content"></textarea>
						<label class = "control-label"> 파일 선택 </ label>
						<input id = "fileinput" type = "file" name = "report" class = "file" >  		
					</form>

					
					
					
				</div>

			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	
	<!--  파일 상세 모달 -->
		<div class="modal fade" id="filedetailmodal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">파일 상세</h4>
				</div>
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
					<button type="button" id = "confirmBtn" class="btn btn-primary"
						onclick="updateFileInfo();"  style="visibility: hidden">확인</button>
					<button type="button" class="btn btn-primary"
						onclick="deleteFileInfo(); ">파일 삭제</button>
						<button type="button" class="btn btn-primary"
						onclick="downloadFile(); ">파일 다운</button>
						<button type="button" class="btn btn-primary"
						onclick="closeModal();">닫기</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	
	
	
	
	
    </body>
</html>