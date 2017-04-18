<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  	<link rel="stylesheet" type="text/css" href="/grouping/resources/stylesheets/main.css">
</head>

    <body>
        <div class="prjview">
            <div class="buttonBox">
                <button id="projectMore">프로젝트 더 보기</button>
                <button id="projectAdd">프로젝트 등록</button>
            </div>
         
            <div id="favoriteProject">
                <span class='hh'>즐겨찾기한 프로젝트</span>
                <c:forEach items="${projectlist}" var="pl">
                    <div class='prj' id='${pl.project_id }'>
                        <!-- 		<img class='del' src='../images/delete.png'>  -->
                        <span class='title'> ${pl.project_name}</span>
                        <hr>
                        <div class='detail'>${pl.project_detail}</div>
                        <form action='main.html'><input class='join' type='button' value='프로젝트 입장' /></form>
                    </div>
                </c:forEach>
            </div>
            
            <div id="newestProject">
                <span class='hh'>최근 사용한 프로젝트</span>
                <c:forEach items="${projectlist}" var="pl">
                    <div class='prj' id='${pl.project_id }'>
                        <!-- 		<img class='del' src='../images/delete.png'>  -->
                        <span class='title'> ${pl.project_name}</span>
                        <hr>
                        <div class='detail'>${pl.project_detail}</div>
                        <input class='join' type='button' value='프로젝트 입장' />
                    </div>
                </c:forEach>
            </div>
        </div>

    </body>
</html>