<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  <%@ include file="/WEB-INF/views/template/head.jspf"%>
<%@ include file="/WEB-INF/views/template/nav.jspf"%>
<%@ include file="/WEB-INF/views/template/header.jspf"%>
<style type="text/css">
* {
    margin: 0;
    padding: 0;
    font-family: sans-serif;
}

.register{
    width: 380px;
    height: 480px;
    position: relative;
    margin: 6% auto;
    background: #fff;
    padding: 5px;
    overflow: hidden;
}
#btn {
    width: 100px;
    height: 50px;
    background: linear-gradient(to right, #ff105f, #ffad06);
    border-radius: 10px;
    transition: .1s;
}
/* 

#logo {
	width: 300px;
	height: 200px;
	display: block;
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 50px;
} */
</style>
</head>
<body>

<div class="page-header section-dark" style="background-image: url('https://raw.githubusercontent.com/junxdev/backpackers/moving_files_from_camp/src/main/webapp/resources/img/antoine-barres.jpg');background-size: cover; background-repeat:no-repeat; background-position:center; min-height: 700px; " >
      <div class="container">
    
		<!-- /.login-logo -->
		 <form  class="register">
                <label>Email</label>
                <div class="input-group form-group-no-border">
                  <div class="input-group-prepend">
                    <span class="input-group-text">
                      <i class="nc-icon nc-email-85"></i>
                    </span>
                  </div>
                  <input type="email" class="form-control" placeholder="Email">
                </div>
                <label>Password</label>
                <div class="input-group form-group-no-border">
                  <div class="input-group-prepend">
                    <span class="input-group-text">
                      <i class="nc-icon nc-key-25"></i>
                    </span>
                  </div>
                  <input type="password" class="form-control" placeholder="Password">
                </div>
                <button id="btn" class="">Register</button>
              </form>
              <div class="forgot">
                <a href="#" class="btn btn-link btn-danger">Forgot password?</a>
              </div>
            </div>
    </div>
   
     
</body>
</html>