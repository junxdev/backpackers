<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>

<head>
<%@ include file="/WEB-INF/views/template/head.jspf"%>
<%@ include file="/WEB-INF/views/template/nav.jspf"%>
<%@ include file="/WEB-INF/views/template/header.jspf"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style type="text/css">
#loginForm {
	position: relative;
	width: 50%;
	height: 50%;
	margin: 0 auto;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		$("#button1").on("click", function() {
			if ($("#userName").val() == "") {
				swal("이름을 입력해주세요.");
				$("#userName").focus();
				return false;
			}
			if ($("#userEmail").val() == "") {
				swal("이메일를 입력해주세요.");
				$("#userEmail").focus();
				return false;
			}
		});
	});
	//아이디 AJAX 처리
	function findId() {
		//querySelector :
		//   css선택자로 원하는 html element 객체를 불러온다.

		var userName = document.querySelector('#userName').value;
		var userEmail = document.querySelector('#userEmail').value;

		$.ajax({
			type : "POST",
			url : "/backpackers/user/findidAjax",
			dataType : "text",
			data : {
				userName : userName,
				userEmail : userEmail
			},
			success : function(data) {
				console.log(data);
				if (data == 'fail') {
					swal("로그인 실패", "아이디 또는 이메일이 일치하지 않습니다.");

				} else if (data != '') {
					swal("로그인성공", "회원님의  아이디는" + data + "입니다.");
					//var msg  = '회원님의 아이디는 ' + data + ' 입니다';
					//var msg1  = '아이디 와 이메일을 입력하세요';
					//$('.id-msg').append(msg);
				}
			}
		})
	}

	function findPw() {
		location.href = "/backpackers/user/findpw";
	}
</script>
</head>
<body>
	<div id="gtco_header" class="gtco-cover gtco-cover-xl"
		style="text-align: center;">
		<div id="loginForm" style="margin-top: 5%;">
			<h3>아이디 찾기</h3>
			<br> <br> <br> <br> <br>
			<form action="/backpackers/user/findidAjax" method="GET" class="form">
				<br> 이름 &nbsp;&nbsp;&nbsp; <input id="userName" name="userName"
					class="lostInput" type="text"> 이메일 <input id="userEmail"
					name="userEmail" class="lostInput" type="text">
				<button type="button" id="button1" onclick="findId()">아이디찾기</button>
				<br>
				<div id="id-msg" class="id-msg"
					style="font-size: 20px; text-align: center;"></div>
				<div id="id-msg1" class="id-msg1"
					style="font-size: 20px; text-align: center;"></div>
				<br> <br>
				<div id="id-msg-sec" class="id-msg-sec"
					style="font-size: 30; text-align: ceter; color: black;"
					onclick="findPw()">비밀번호 찾기로 이동</div>
			</form>
		</div>
	</div>
</body>
</html>
