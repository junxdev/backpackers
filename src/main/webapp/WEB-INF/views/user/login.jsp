<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
	
<html>
<%
	request.setAttribute("root", request.getContextPath());
%>
<head>
<%@ include file="/WEB-INF/views/template/head.jspf"%>
<%@ include file="/WEB-INF/views/template/nav.jspf"%>
<%@ include file="/WEB-INF/views/template/header.jspf"%>

<title>Home</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
 <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style type="text/css">
#bg {
  position: absolute; 
  top: 0; 
  left: 0; 
  height:600px;
	
  /* Preserve aspet ratio */
  min-width: 100%;
  min-height: 100%;
}
	body{
    margin: 0;
    padding: 0;
    font-family: sans-serif;
    }

	#loginPage{
    width: 380px;
    height: 600px;
    position: relative;
    margin: 3% auto;
    background: #fff;
    padding: 5px;
    overflow: hidden;
	}

	#btn1 {
	margin-left: 100px;
	margin-right: 30px;
	margin-top: 30px;
	width: 200px;
	height: 60px;
	}

#btn2 {
	margin-top: 30px;
	width: 200px;
	height: 60px;
}

#logo {
	width: 300px;
	height: 200px;
	display: block;
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 50px;
}
</style>
</head>

<body>
<div class="page-header section-dark">
<img id="bg" alt="" src="../resources/img/antoine-barres.jpg">
    	<div class="container" id="loginPage">
		<div>
			<img id="logo" src="../resources/img/ikea.jpg" />
		</div>
		<!-- /.login-logo -->
		<div class="login-box-body">
			<form action="${root}/user/loginPost" method="post">
			<p class="login-box-msg">로그인 하기전 페이지</p>
				<div class="form-group has-feedback">
					<input type="text" name="userId" class="form-control"
						placeholder="아아디"> <span
						class="glyphicon glyphicon-exclamation-sign form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" name="userPw" class="form-control"
						placeholder="비밀번호"> <span
						class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<button type="submit" class="btn btn-primary btn-lg btn-block">로그인</button>
					<a href="register" class="btn btn-default btn-lg btn-block" role="btn">회원가입</a>
			<div class="text">
			 <button type="button" class="btn btn-default"><a href="${root}/user/findid">아이디 찾기</a></button>
			<button type="button" class="btn btn-default"><a href="${root}/user/findpw">비밀번호 찾기</a></button>
			</div>
			</form>
		</div>
		</div>
		</div>
	<%@ include file="/WEB-INF/views/template/footer.jspf"%>
</body>
</html>


