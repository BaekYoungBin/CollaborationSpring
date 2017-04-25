<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="utf-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>

<!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame
Remove this if you use the .htaccess -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<title>내 정보</title>
<meta name="description" content="">
<meta name="author" content="PC-164">

<meta name="viewport" content="width=device-width; initial-scale=1.0">

<!-- Replace favicon.ico & apple-touch-icon.png in the root of your domain and delete these references -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="/grouping/resources/stylesheets/groupframe.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>

</head>

<body>
<div id = "wrapper">
	 <div class="col-md-9 col-md-offset-1">
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
            <div class="panel-body group-body">
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
           
        </div>

    </div>
    <div class="col-md-9 col-md-offset-1">
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
            <div class="panel-body group-body">
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
    
</div>
</body>
</html>