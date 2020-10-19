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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Sansita+Swashed:wght@600;700;800&display=swap');


	body{
    margin: 0;
    padding: 0;
    }

	#loginPage{
    width: 400px;
    height: 500px;
    position: upset;
    margin: 50 50 50 500;
    background: #fff;
    padding: 5px;
    overflow: hidden;
	}

	#btn1 {
	margin-left: 50px;
	margin-top: 20px;
	width: 130px;
	text-align: center;
	}

	#btn2 {
	margin-left: 30px;
	margin-top: 20px;
	width: 130px;
	text-align: center;
	}
	#button1{
	margin-top: 50px;
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
<script type="text/javascript">
$(document).ready(function() {
	$("#button1").on("click", function() {
		if ($("#userId").val() == "") {
			swal("아이디를 입력해주세요.");
			$("#userId").focus();
			return false;
		}
		if ($("#userPw").val() == "") {
			swal("비밀번호를 입력해주세요.");
			$("#userPw").focus();
			return false;
		}		
	});
});


</script>
</head>

<body>
    	<div id="loginPage">
		<h2 style="font-family:'Sansita Swashed', cursive; text-align: center; margin-top:40px; font-size: 50px" >backpackers</h2>
		<!-- /.login-logo -->
		<div class="login-box-body">
			<form action="${root}/user/loginPost" method="post">
			<p class="login-box-msg">로그인 하기전 페이지</p>
				<div class="form-group has-feedback">
					<input type="text" name="userId"  id="userId" class="form-control"
						placeholder="아아디"> <span
						class="glyphicon glyphicon-exclamation-sign form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" name="userPw" id="userPw"  class="form-control"
						placeholder="비밀번호"> <span
						class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<button type="submit" class="btn btn-primary btn-lg btn-block" id="button1" value="N">로그인</button>
					<a href="register" class="btn btn-default btn-lg btn-block" role="btn">회원가입</a>
			<div class="text">
			 <button type="button" id="btn1"><a href="${root}/user/findid">아이디 찾기</a></button>
			 <button type="button" 	id="btn2"><a href="${root}/user/findpw">비밀번호 찾기</a></button>
			</div>
			</form>
		</div>
		</div>
</body>
	<%@ include file="/WEB-INF/views/template/footer.jspf"%>
</html>


