<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
     
         <link rel="stylesheet" type="text/css" href="/grouping/resources/stylesheets/main.css">

	
	
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
			,type : "post"
			,async:false
			,success : function(jsonData){
				var dataform = JSON.stringify(jsonData.boardList);
				var temp = JSON.parse(dataform);
				var text;

				$.each(temp, function(key, value){	
					text +="<tr>";
					text +="<td>"+value.seq_board_number+"</td>"; /* //javascript:asdf(); */
					text +="<td><a href='javascript:loadBoardDetail("+value.seq_board_number+");'>"+value.board_title+"</a></td>";
					text +="<td>"+value.board_content+"</td>";
					text +="<td>"+value.board_reg_user_name+"</td>";
					text +="</tr>";			 
				});
				$("#datasection").html(text);
			},
			error : function(jsonData){		
				alert("실패");
			}
		});
		
	
		
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
                            <button type="button" class="btn btn-sm btn-primary btn-create" onclick="loadComunityWrite();">새 글쓰기</button>
                        </div>
                    </div>
                </div>
                <div class="panel-body">
                <form id="communityBoardSearchForm" name="communityBoardSearchForm" method="POST">
                	<input type="hidden" id="page" name="page" />
                    <table class="table table-striped table-bordered table-list">
                        <thead>                  
                            <tr>                         
                                <th class="hidden-xs">글 번호</th>
                                <th>글 제목</th>
                                <th>상세 내용</th>
                                <th>글쓴이</th>
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