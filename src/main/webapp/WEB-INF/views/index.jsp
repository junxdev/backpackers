<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<%@ include file="/WEB-INF/views/template/head.jspf" %>
</head>
<body>
	<%@ include file="/WEB-INF/views/template/nav.jspf" %>
	<%@ include file="/WEB-INF/views/template/header.jspf" %>
				<!-- Content starts -->
				
	<!-- (1) LoginWithNaverId Javscript SDK -->
<!-- (2) LoginWithNaverId Javscript 설정 정보 및 초기화
	<script>
		var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "{YOUR_CLIENT_ID}",
				callbackUrl: "{YOUR_REDIRECT_URL}",
				isPopup: false,
				callbackHandle: true
				/* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */
			}
		);

		/* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
		naverLogin.init();

		/* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */
		window.addEventListener('load', function () {
			naverLogin.getLoginStatus(function (status) {
				if (status) {
					/* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
					var email = naverLogin.user.getEmail();
					if( email == undefined || email == null) {
						alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
						/* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
						naverLogin.reprompt();
						return;
					}

					window.location.replace("http://" + window.location.hostname + 
                            ( (location.port==""||location.port==undefined)?"":":" + location.port) + "backpackers/");
				                                                    /* 인증이 완료된후 /sample/main.html 페이지로 이동하라는것이다. 본인 페이로 수정해야한다. */
                 } else {
					console.log("callback 처리에 실패하였습니다.");
				}
			});
		});
	</script>
	
	
	
 </body>
</html>
				<section class="container">
		<form method="post">
			<div class="form-group has-feedback">
				<i class="glyphicon glyphicon-user"></i><label class="control-label"
					for="userid">아이디</label> <input class="form-control" type="text"
					id="userid" name="userid" placeholder="아이디를 입력하세요" />
			</div>
			<div class="form-group has-feedback">
				<i class="glyphicon glyphicon-lock"></i><label class="control-label"
					for="userpass">패스워드</label> <input class="form-control"
					type="password" id="userpass" name="userpass"
					placeholder="비밀번호를 입력하세요" /> <input class="form-control"
					type="password" id="userpass" name="userpass"
					placeholder="비밀번호를 다시 입력하세요" />
			</div>
			<div class="form-group has-feedback">
			<i class="glyphicon glyphicon-text-color"></i>
				<label class="control-label" for="username">성명</label> <input
					class="form-control" type="text" id="username" name="username"
					placeholder="이름을 입력하세요" />
			</div>
			<div class="form-group">
				<i class="glyphicon glyphicon-envelope"></i><label
					class="control-label" for="signupEmail">Email</label> <input
					id="signupEmail" type="email" maxlength="50" class="form-control"
					placeholder="simple @ goole.com">
			</div>
			
			
<input type="text" id="sample6_postcode" placeholder="우편번호">
<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
<input type="text" id="sample6_address" placeholder="주소"><br>
<input type="text" id="sample6_detailAddress" placeholder="상세주소">
<input type="text" id="sample6_extraAddress" placeholder="참고항목">

			
			<div class="form-group has-feedback">
				<button type="submit" id="btn1" class="btn btn-primary btn-lg">입력</button>
				<button type="reset" id="btn2" class="btn btn-default btn-lg">취소</button>
			</div>

		</form>
	</section>
 -->
	<%@ include file="/WEB-INF/views/template/footer.jspf" %>
</body>
</html>