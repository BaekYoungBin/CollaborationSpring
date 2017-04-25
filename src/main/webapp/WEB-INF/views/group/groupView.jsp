<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="/grouping/resources/stylesheets/main.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>

</head>

<body>
	<div class="prjview">
		<div class="buttonBox">
			<button type="button" id="projectMore" class="btn btn-info btn-lg"
				data-toggle="modal" data-target="#viewmoreprj">프로젝트 더 보기</button>
			<div id="viewmoreprj" class="modal fade" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Modal Header</h4>
						</div>
						<div class="modal-body">
							<p>Some text in the modal.</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
			<button type="button" id="projectAdd" class="btn btn-info btn-lg"
				data-toggle="modal" data-target="#regprj">프로젝트 생성</button>
			<div id="regprj" class="modal fade" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">새 프로젝트 생성</h4>
						</div>
						<form  action="/grouping/group/groupRegister.do" method ="POST">
							<div class="modal-body">
							<div class="form-group">
							그룹 이름: <input type="text" class="form-control" id="grp_title" name="grp_title">
							</div>
							<div class="form-group">
							그룹 정보:	<textarea class="form-control" rows="5" id="grp_content" name="grp_content"></textarea>
							</div>
							</div>
							<div class="modal-footer">
								<input type="submit" value="SUBMIT" class="btn" />
							</div>
						</form>

					</div>

				</div>
			</div>

		</div>
  
            <div id="newestProject">
                <span class='hh'>최근 사용한 프로젝트</span>
                <c:forEach items="${newstGroup}" var="grp">
                    <div class='prj' id='${grp.seq_grp_number }'>
                        <!-- 		<img class='del' src='../images/delete.png'>  -->
                        <span class='title'> ${grp.grp_title}</span>
                        <hr>
                        <div class='detail'>${rp.grp_content}</div>
                        <input class='join' type='button' value='프로젝트 입장' />
                    </div>
                </c:forEach>
            </div>
         <div id="favoriteProject">
                <span class='hh'>즐겨찾기한 프로젝트</span>
                <c:forEach items="${favoriteGroup}" var="grp">
                    <div class='prj' id='${grp.seq_grp_number }'>
                        <!-- 		<img class='del' src='../images/delete.png'>  -->
                        <span class='title'> ${grp.grp_title}</span>
                        <hr>
                        <div class='detail'>${grp.grp_content}</div>
                        <form action='main.html'><input class='join' type='button' value='프로젝트 입장' /></form>
                    </div>
                </c:forEach>
            </div>
          
	</div>

</body>
</html>