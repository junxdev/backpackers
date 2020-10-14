<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<%
	request.setAttribute("root", request.getContextPath());
%>
<head>
<%@ include file="/WEB-INF/views/template/head.jspf"%>
<%@ include file="/WEB-INF/views/template/nav.jspf"%>
<%@ include file="/WEB-INF/views/template/header.jspf"%>
<style type="text/css">



#loginForm { 
	position: relative;
	width: 50%;
	height: 50%;
	margin: 0 auto;
}

.login h1 { color: #fff; text-shadow: 0 0 10px rgba(0,0,0,0.3); letter-spacing:1px; text-align:center; }

</style>

<script type="text/javascript">
//아이디 AJAX 처리
function findId(){
    //querySelector :
    //   css선택자로 원하는 html element 객체를 불러온다.
    
    var userName = document.querySelector('#userName').value;
    var userEmail = document.querySelector('#userEmail').value;

	$.ajax({
   type:"POST",
   url : "/backpackers/user/findidAjax",
   dataType :"text",
 	data:{
	   userName:userName,
   	   userEmail:userEmail    
	},
	success:function(data){
		console.log(data);
	if(data != ''){
		alert("회원님의  아이디는"+data+"입니다.");
         var msg  = '회원님의 아이디는 ' + data + ' 입니다';
         
         $('.id-msg').append(msg);
        
      } else {
          document.querySelector("#id-msg").textContent = '일치하는 정보가 없습니다';
          document.querySelector('#id-msg').style.color = 'white';
      }
}
})
}

function findPw() {
    location.href="/backpackers/user/findpw";
}
</script>
</head>
<body>
	<div id="gtco_header" class="gtco-cover gtco-cover-xl" style="text-align: center;">
		<div id="loginForm" style="margin-top: 5%;">
		       	<h3>아이디 찾기</h3>
		<br><br><br><br><br>
			<form action="/backpackers/user/findidAjax" method="GET" class="form">
		       	<br>
				   	이름 &nbsp;&nbsp;&nbsp; <input id="userName" name="userName" class="lostInput" type="text">
					이메일 <input id="userEmail" name="userEmail" class="lostInput" type="text">
			    	<button  type="button" id="login-button" onclick="findId()" value="아이디찾기">아이디찾는다?</button>
			    	<br>
			    	<div id="id-msg" class="id-msg" style="font-size: 20px;  text-align: center;"></div>
			    	<br><br>
			    	<div id="id-msg-sec" class="id-msg-sec" style="font-size: 30px; text-align: left; color: blue;" onclick="findPw()">비밀번호 찾기로 이동</div>
		    </form>
		</div>
	</div>
</body>
</html>
