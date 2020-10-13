<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="page-header">
		<h1>내 정보 수정</h1>
	</div>
	<form class="form-horizontal" method="post" action="../${bean.userId }">
		<input type="hidden" name="_method" value="put">
		<div class="form-group">
			<label for="userId" class="col-sm-2 control-label">아이디</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" name="userId" id="userId"
					value="${bean.userId }" readonly="readonly" />
			</div>
		</div>
		<div class="form-group">
			<label for="userPw" class="col-sm-2 control-label">비밀번호</label>
			<div class="col-sm-10">
				<input type="password" class="form-control" name="userPw" id="userPw" value="" />
			</div>
		</div>
		<div class="form-group">
			<label for="userPwChk" class="col-sm-2 control-label">비밀번호 확인</label>
			<div class="col-sm-10">
				<input type="password" class="form-control" name="userPwChk" id="userPwChk" value="" />
			</div>
		</div>
		<div class="form-group">
			<label for="userName" class="col-sm2 control-label">이 름</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" name="userName"
					id="userName" value="${bean.userName }" readonly="readonly" />
			</div>
		</div>
		<div class="form-group">
			<label for="userEmail" class="col-sm-2 control-label">이메일</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" name="userEmail"
					id="userEmail" value="${bean.userEmail }" />
			</div>
		</div>
		<div>
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-primary">수 정</button>
			</div>
		</div>
	</form>
</body>
</html>