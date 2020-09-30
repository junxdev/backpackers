<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<%@ include file="/WEB-INF/views/template/head.jspf"%>
<%@ include file="/WEB-INF/views/template/nav.jspf"%>
<%@ include file="/WEB-INF/views/template/header.jspf"%>
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<style type="text/css">
.container{
	margin-top:50px;
	margin-left: auto;
	margin-right: auto;
	padding: 10px 200px;

}

#btn1{
	margin-left: 200px;
	margin-right:30px;
	margin-top:50px;
	width: 130px; height: 50px;
}
#btn2 {
	margin-top:50px;
	width: 130px; height: 50px;
}
</style>

<title>회원가입</title>

<script type="text/javascript">
	$(document).ready(function() {

		$("#btn1").on("click", function() {
			if ($("#userId").val() == "") {
				alert("아이디를 입력해주세요.");
				$("#userId").focus();
				return false;
			}
			if ($("#userName").val() == "") {
				alert("이름을 입력해주세요.");
				$("#userName").focus();
				return false;
			}
			if ($("#userEmail").val() == "") {
				alert("이메일를 입력해주세요.");
				$("#userEmail").focus();
				return false;
			}
			if ($("#userPw").val() == "") {
				alert("비밀번호 입력해주세요.");
				$("#userPw").focus();
				return false;
			}
			if ($("#userPw2").val() == "") {
				alert("비밀번호 다시 입력해주세요.");
				$("#userPw2").focus();
				return false;
			}
		});
	});

	  function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
	  //아이디체크
	  $(".idCheck").click(function(){
		  
		  var query = {user_id : $("#user_id").val()};
		  
		  $.ajax({
		   url : "/user/idCheck",
		   type : "post",
		   data : query,
		   success : function(data) {
		   
		    if(data == 1) {
		     $(".result .msg").text("사용 불가");
		     $(".result .msg").attr("style", "color:#f00");    
		     $("#btn1").attr("disabled", "disabled");
		    } else {
		     $(".result .msg").text("사용 가능");
		     $(".result .msg").attr("style", "color:#00f");
		     $("#btn1").removeAttr("disabled");
		    }
		   }
		  });  // ajax 끝
		 });
	  
	  $("#user_id").keyup(function(){
		  $(".result .msg").text("아이디를 확인해주십시오.");
		  $(".result .msg").attr("style", "color:#000");
		  
		  $("#submit").attr("disabled", "disabled");
		  
		 });

	  
		 </script>
</head>
<%
	request.setAttribute("root", request.getContextPath());
%>
<body>
    <div class="container">
        <p>회원가입 페이지</p>

        <form  method="post">
            <div class="form-group has-feedback">
             <input type="text" id="userId" name="userId" class="form-control" placeholder="아아디">
                <span class="glyphicon glyphicon-exclamation-sign form-control-feedback"></span>
       			</div>
           
            <div class="form-group has-feedback">
                <input type="text" id="userName"  name="userName" class="form-control" placeholder="이름">
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="email" id="userEmail"  for="signupEmail" maxlength="50"  name="userEmail" class="form-control" placeholder="이메일">
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password"id="userPw"  name="userPw" class="form-control" placeholder="비밀번호">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" id="userPw2"  class="form-control" placeholder="비밀번호 확인">
                <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
            </div>
            
            <input type="text" id="sample6_postcode" placeholder="우편번호">
			<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
			<input type="text" id="sample6_address" placeholder="주소"><br>
			<input type="text" id="sample6_detailAddress" placeholder="상세주소">
			<input type="text" id="sample6_extraAddress" placeholder="참고항목">
		
			<div class="form-group has-feedback">
				<button type="submit" id="btn1" class="btn btn-primary btn-lg">가입</button>
				 <a href="${root }/user/login" id="btn2" class="btn btn-default btn-lg">취소</a>
				</div>
			
            <div class="row">  
                    <div class="checkbox icheck">
                        <label>
                            <input type="checkbox"> 약관에 <a href="#">동의</a>
                        </label>    
                </div>
        </form>
    </div>

<script>
    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '50%' // optional
        });
    });
</script>
</body>
</html>