<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <html>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="<c:url value=" /resources/javascripts/index.js "/>"></script>
  		<link rel="stylesheet" type="text/css" href="/grouping/resources/stylesheets/main.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <head>
            <title>비밀번호 찾기</title>    
        </head>
        <body>

    <hr>
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="text-center">Forgot Password</h1>
            </div>
                                <div class="panel-body">
                                    <form class="form">
                                        <fieldset>
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-envelope color-blue"></i></span>

                                                    <input id="emailInput" placeholder="email address" class="form-control" type="email" oninvalid="setCustomValidity('Please enter a valid email address!')" onchange="try{setCustomValidity('')}catch(e){}" required="">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <input class="btn btn-lg btn-primary btn-block" value="Send My Password" type="submit">
                                            </div>
                                        </fieldset>
                                    </form>

                                </div>
                            </div>
                        </div>

</body>

        </html>