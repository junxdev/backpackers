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
.container {
	margin-left: auto;
	margin-right: auto;
	padding: 30px 250px;
}

.form-1 {margin: 0 auto;}

.text {
	text-align: center;
	margin-top: 60px;
	font-size: 20px;
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
        <div class="container">
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
				<div class="checkbox icheck">
					<label> <input type="checkbox" name="useCookie">
						로그인유지
					</label>
				</div>
				<button type="submit" class="btn btn-primary btn-lg btn-block">로그인</button>
					<a href="register" class="btn btn-default btn-lg btn-block" role="btn">회원가입</a>
			<div class="text">
				<a href="${root}/user/findid">아이디 찾기</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="${root}/user/findpw">비밀번호 찾기</a>
			</div>
			</form>
		</div>
		</div>
	
	
		

<!-- 네이버 로그인 화면으로 이동 시키는 URL -->
<!-- 네이버 로그인 화면에서 ID, PW를 올바르게 입력하면 callback 메소드 실행 요청 -->
<div id="naver_id_login" style="text-align:center"><a href="${url}">네이버</a></div>
<br>




	<!-- <div style="text-align: center">
		<p><h3>--------------------또는--------------------</h3></p>
	<div id="naverIdLogin"></div>
	네이버아이디로로그인 버튼 노출 영역
	<a id="kakao-login-btn"></a>
<a href="http://developers.kakao.com/logout"></a>
</div>
	네이버아디디로로그인 초기화 Script
	<script type="text/javascript">
		var naverLogin = new naver.LoginWithNaverId({
			clientId : "MriqWhhm1Oh7d_Jx1IYv",
			callbackUrl : "http://localhost:8080/backpackers/",
			isPopup : false, /* 팝업을 통한 연동처리 여부 */
			loginButton : {
				color : "green",
				type : 3,
				height : 49
			}
		/* 로그인 버튼의 타입을 지정 */
		});

		/* 설정정보를 초기화하고 연동을 준비 */
		naverLogin.init();
	</script>
		<script>
			var msg = "${msg}";
			if (msg === "REGISTERED") {
				alert("회원가입이 완료되었습니다. 로그인해주세요~");
			} else if (msg == "FAILURE") {
				alert("아이디와 비밀번호를 확인해주세요.");
			}

			$(function() {
				$('input').iCheck({
					checkboxClass : 'icheckbox_square-blue',
					radioClass : 'iradio_square-blue',
					increaseArea : '50%' // optional
				});
			});
		</script> -->


	<%@ include file="/WEB-INF/views/template/footer.jspf"%>
</body>
</html>


