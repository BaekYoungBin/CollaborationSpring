<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<html lang="en">
<head>
<meta charset="utf-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>

<!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame
Remove this if you use the .htaccess -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<meta name="description" content="">
<meta name="author" content="PC-164">

<meta name="viewport" content="width=device-width; initial-scale=1.0">

<!-- Replace favicon.ico & apple-touch-icon.png in the root of your domain and delete these references -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="../javascripts/Mypage.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="../stylesheets/Additional_Frame.css">
<link rel="stylesheet" type="text/css" href="../stylesheets/Mypage.css">

</head>

<body>
	<div class="container">
		<div class="row">

			<div class="col-md-8">
				<div class="panel panel-info">
					<div class="panel-heading">	
							<h3 class="panel-title">나의 담당 업무</h3>
					</div>
					<div class="panel-body">
						<div id="task">
						
							<div class="btn-group">
								<button id="prj_select_btn" type="button"
									class="btn btn-default dropdown-toggle" data-toggle="dropdown">
									그룹 선택 <span class="caret"></span>
								</button>
								<button id="prj_out_btn" type="button" class="btn btn-default">나가기</button>
								<ul id="prj_select_list" class="dropdown-menu" role="menu">
								</ul>
							</div>
							<ul id="task_list" class="list-group">
							</ul>
						</div>
					</div>


				</div>

			</div>


		</div>
	</div>
	</div>








</body>
</html>
</body>
</html>