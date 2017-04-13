<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="/grouping/resources/stylesheets/Post_Write.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="POST" action = "Post_Write">
<div id = wrap>

<table>
<tr>
<td>제목</td>

<td><input type=text id = post_subject name = post_subject style="width: 504px; "></td>
</tr>
</table>
<textarea id = post_detail name = post_detail style="width: 586px; height: 352px; "></textarea>



</div>
<input type="submit" id = confirm value="등록">
</form>
</body>
</html>