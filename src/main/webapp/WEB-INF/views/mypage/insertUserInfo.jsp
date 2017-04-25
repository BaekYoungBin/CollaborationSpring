<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
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
        <script src="http://code.jquery.com/jquery-latest.js"></script><script src="http://code.jquery.com/jquery-latest.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <script src="../javascripts/Mypage.js"></script>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="../stylesheets/Additional_Frame.css">
        <link rel="stylesheet" type="text/css" href="../stylesheets/Mypage.css">

    </head>
<style>
    .user-row {
        margin-bottom: 14px;
    }

    .user-row:last-child {
        margin-bottom: 0;
    }

    .dropdown-user {
        margin: 13px 0;
        padding: 5px;
        height: 100%;
    }

    .dropdown-user:hover {
        cursor: pointer;
    }

    .table-user-information > tbody > tr {
        border-top: 1px solid rgb(221, 221, 221);
    }

    .table-user-information > tbody > tr:first-child {
        border-top: 0;
    }


    .table-user-information > tbody > tr > td {
        border-top: 0;
    }
    .toppad
    {margin-top:20px;
    }

    
    </style>
    
    <script>
        $(document).ready(function() {
            var panels = $('.user-infos');
            var panelsButton = $('.dropdown-user');
            panels.hide();

            //Click dropdown
            panelsButton.click(function() {
                //get data-for attribute
                var dataFor = $(this).attr('data-for');
                var idFor = $(dataFor);

                //current button
                var currentButton = $(this);
                idFor.slideToggle(400, function() {
                    //Completed slidetoggle
                    if(idFor.is(':visible'))
                    {
                        currentButton.html('<i class="glyphicon glyphicon-chevron-up text-muted"></i>');
                    }
                    else
                    {
                        currentButton.html('<i class="glyphicon glyphicon-chevron-down text-muted"></i>');
                    }
                })
            });


            $('[data-toggle="tooltip"]').tooltip();

            $('button').click(function(e) {
                e.preventDefault();
                alert("This is a demo.\n :-)");
            });
        });
    
    </script>
    <body>
    
        <div class="container">
            <div class="row">
             
                <div class="col-md-8" >
                 <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title">회원 정보 상세</h3>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-3 col-lg-3 " align="center"> <img alt="User Pic" src="http://babyinfoforyou.com/wp-content/uploads/2014/10/avatar-300x300.png" class="img-circle img-responsive">  <a data-original-title="Broadcast Message" data-toggle="tooltip" type="button" class="btn btn-sm btn-primary"><i class="glyphicon glyphicon-envelope"></i></a></div>
                               
                                <div class=" col-md-9 col-lg-9 "> 
                                    <table class="table table-user-information">
                                        <tbody>
                                            <tr>
                                                <td>회원 ID:</td>
                                                <td>baek</td>
                                            </tr>
                                            <tr>
                                                <td>가입 일자:</td>
                                                <td>06/23/2013</td>
                                            </tr>
                                            <tr>
                                                <td>이름</td>
                                                <td>백영빈</td>
                                            </tr>

                                            <tr>
                                            <tr>
                                                <td>이메일</td>
                                                <td>baek_it@naver.com</td>
                                            </tr>
<!--                                          
                                            <tr>
                                                <td>Email</td>
                                                <td><a href="mailto:info@support.com">info@support.com</a></td>
                                            </tr>-->
                                        </tr>

                                    </tbody>
                                </table>

                            <a href="#" class="btn btn-primary">회원 정보 수정</a>
                            <a href="#" class="btn btn-primary">회원 정보 삭제</a>
                        </div>
                    </div>
                </div>
             

            </div>
        </div>
        </div>
    </div>
    </body>
</html>

