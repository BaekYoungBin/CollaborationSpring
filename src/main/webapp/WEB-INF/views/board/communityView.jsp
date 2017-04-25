<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
         <link rel="stylesheet" type="text/css" href="/grouping/resources/stylesheets/main.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
	
	
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
   $( function() {  
			goSearch('1');
        });
   function goSearch(page) {
		$("#page").val(page);
		var list = new Array();
		$.ajax({
			url : "/grouping/board/boardViewAjax.do"
			,data : $('#communityBoardSearchForm').serialize()
			,dataType : 'json'
			,type : "get"
			,success : function(jsonData){
				var dataform = JSON.stringify(jsonData.boardList);
				var temp = JSON.parse(dataform);
				alert(dataform);
				alert(temp);
				
				var text;
				$.each(temp, function(key, value){		 
					text +="<tr><td align='center'>";
					text +="<a class='btn btn-default'><em class='fa fa-pencil'></em></a>";
					text +="<a class='btn btn-danger'><em class='fa fa-trash'></em></a></td>";
					text +="<td>"+value.SEQ_BOARD_NUMBER+"</td>";
					text +="<td>"+value.board_title+"</td>";
					text +="<td>"+value.board_content+"</td>";
					text +="</tr>";			 
				});
				$("#datasection").html(text);
			},
			error : function(jsonData){
				
				
				
				alert("실패");

			}
			
	
			
		/* 	var html = '';
			var list = data.resultList;
			var totalResult = data.totalCount;	
			if(totalResult > 0) {
				for (var i=0; i<list.length; i++) {
					html += '<tr>';
					html += '	<td>' + list[i].rnum + '</td>';
					html += '	<td>' + list[i].serviceType +'</td>';
					html += '	<td>' + list[i].actionKindKr +'</td>';
					html += '	<td>' + list[i].ctn + '</td>';
					html += '	<td>' + list[i].hash +'</td>';
					html += '	<td>' + list[i].haVer  + '</td>';
					html += '	<td>' + list[i].osInfo  + '</td>';
					html += '	<td>' + list[i].model  + '</td>';
					html += '	<td>' + list[i].serviceUseLatestDate+ '</td>';
					html += '	<td>' + list[i].serviceUseCnt+ '</td>';
					html += '</tr>';
				}
			} else {
				html += "<tr>"
				html += "	<td colspan='10'> 검색조건에 부합되는 데이터가 없습니다.</td>";
				html += "</tr>"			
			}
			
			$("#userHistList").empty();
			$("#userHistList").append(html);
			$("#paging").empty();
			$("#paging").append(data.paging);
			$("#totCnt").text(totalResult); */
		});
		
		function prepare(data){
			alert(data);
			
			alert("들어왔다"+data.board_title);
			var text;
			$.each(function(index, data){		
				text +="<tr><td align='center'>";
				text +="<a class='btn btn-default'><em class='fa fa-pencil'></em></a>";
				text +="<a class='btn btn-danger'><em class='fa fa-trash'></em></a></td>";
				text +="<td>"+data.seq_board_number+"</td>";
				text +="<td>"+data.board_title+"</td>";
				text +="<td>"+data.board_content+"</td>";
				text +="</tr>";			
			});
			$("datasection").html(text);
		}
	}

    
    </script>
 <body>
 
        <div class="col-md-10 col-md-offset-1">

            <div class="panel panel-default panel-table">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col col-xs-6">
                            <h3 class="panel-title">커뮤니티 게시판</h3>
                        </div>
                        <div class="col col-xs-6 text-right">
                            <button type="button" class="btn btn-sm btn-primary btn-create">Create New</button>
                        </div>
                    </div>
                </div>
                <div class="panel-body">
                <form id="communityBoardSearchForm" name="communityBoardSearchForm" method="POST">
                	<input type="hidden" id="page" name="page" />
                    <table class="table table-striped table-bordered table-list">
                        <thead>
                        
                            <tr>
                                <th><em class="fa fa-cog"></em></th>
                                <th class="hidden-xs">글 번호</th>
                                <th>글 제목</th>
                                <th>상세 내용</th>
                            </tr> 
                            
                            
                        </thead>
                        <tbody id = "datasection">
                         
                        </tbody>
                    </table>
                    </form>

                </div>
                <div class="panel-footer">
                    <div class="row">
                        <div class="col col-xs-4">Page 1 of 5
                        </div>
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