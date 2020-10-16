<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<!-- 글쓰기 api 오류 나서, 이 페이지는 template을 따로 넣었음 -->

<% request.setAttribute("root", request.getContextPath()); %>

	<link rel="stylesheet" type="text/css" href="/backpackers/resources/css/bootstrap.css">
	<script type="text/javascript" src="/backpackers/resources/js/jquery-1.12.4.js"></script>
	<script type="text/javascript" src="/backpackers/resources/js/bootstrap.js"></script>

<title>Backpackers : 3rd project by group 3</title>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.js"></script>
<script src="https://github.com/summernote/summernote/tree/master/lang/summernote-ko-KR.js"></script>
	
<style type="text/css">
 #board_subject{
 background-color: white;
  color: blue;
  text-align: center;
 }
 .user_ID,.board_date,.board_maketime,.board_views,.reply_num{
  width: 100px;
   background-color: white;
   color: blue;
  text-align: center;
 float: right;

 }
 #board_content{
  width: 1554px;    
   height: 400px;
   background-color: white;
  color: blue;
 }

.board_content_inside,.board_hits{
 background-color: white;
  color: blue;
}

.board_hits{
 
 margin: 0px auto;
 background-color: white;
  color: blue;
 width:100px; 
 height: 75px;
 text-align: center;
 position: relative;
 top:75%;
}

.reply_content_send{
background-color: white;
  color: blue;
  height: 130px;
}
#reply_content_send{
height: 75px;
}
 .reply_id,.reply_time{
  width: 100px;
 background-color: white;
  color: blue;
 }
 .reply_content{
  width: 200px;
  background-color: white;
  color: blue;
 }
 #reply_content_btn{
  float: right;
 
 }
 
 
 
 #update_button,#delete_button{
  float: right;
 }
 
 
 .ex04{
  margin: 10px auto;
  width: 1554px; 
 }

</style>
<script type="text/javascript">
 $(document).ready(function() {
	$('#summernote').summernote({
		height : 300,
		minHeight : null,
		maxHeight : null,
		focus : true,
		callbacks : {
			onImageUpload : function(files, editor, welEditable) {
				for (var i = 0; i < files.length; i++) {
					sendFile(files[i], this);
				}
			}
		}
	});
});

function sendFile(file, el) {
	console.log(file)
	var form_data = new FormData();
	form_data.append("file",file);
	$.ajax({
		data : form_data,
		type : "POST",
		url : '/backpackers/board/image',
		cache : false,
		contentType : false,
		enctype : 'multipart/form-data',
		processData : false,
		success : function(url) {
			$(el).summernote('insertImage', url, function($image) {
				$image.css('width', "50%");
				//$('#imageBoard > ul').append('<li><img src="'+url+'" width="480" height="auto"/></li>')
			});
		}
	});
} 
</script>
<title>게시글</title>
</head>
	

<body>
	
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${root }">Backpackers</a>
			</div>
				
				<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="${root }/gear">백패킹<span class="sr-only">(current)</span></a></li>
					<li><a href="${root }/sights/map">명소</a></li>
				  <li><a href="${root }/board/">게시판</a></li>
					<li><a href="${root }/#">쇼핑</a></li>
				</ul>
				<ul class="navbar-form navbar-right">
        <c:if test="${user != null}">
        	<c:if test="${user.grade == 1}">
		 ${user.userId }님 입장을 환영합니다
 		<button type="submit" class="btn btn-default"><a href="${root }/admin/adminPage">관리자 페이지</a></button>
		</c:if>
        	<c:if test="${user.grade == 0}">
		 ${user.userId }님 입장을 환영합니다
 		<button type="submit" class="btn btn-default"><a href="${root }/user/myPage">마이 페이지</a></button> 
		</c:if>	
        <button type="submit" class="btn btn-default"><a href="${root }/user/logout">로그아웃</a></button>
        </c:if>
		<c:if test="${user == null}"> 	  
		<button type="submit" class="btn btn-default"><a href="${root }/user/login">로그인</a></button>
        <button type="submit" class="btn btn-default"><a href="${root }/user/register">회원가입</a></button>	 	  
		</c:if>
        </ul>
			</div><!-- /.navbar-collapse -->
		</div><!-- /.container-fluid -->
	</nav>


<form method="post">
<div class="ex1">
<input class="form-control" id="board_subject" name="board_subject" value="${boardDitail.board_subject}">
</div>
<div class="ex2" >
<pre class="user_ID">${boardDitail.user_ID}</pre>
<pre class="board_date">${boardDitail.board_date}</pre>
<pre class="board_maketime">${boardDitail.board_maketime}</pre>
<pre class="board_views">${boardDitail.board_views}</pre>
<pre class="reply_num">댓글</pre>
</div>



<div class="ex3">
<input id="board_content" class="form-control" name="board_content" value="${boardDitail.board_content}"/>
<pre class="board_hits">
<button  type="submit" class="btn btn-primary" id="board_hits_btn">${boardDitail.board_hits}</button>
추천수
</pre>

</div>

<pre class="reply_content_send"><input type="text" class="form-control"  id="reply_content_send" name="reply_content" placeholder="댓글을 입력하시오"><button class="btn btn-primary" id="reply_content_btn" type="submit">댓글등록</button></pre>

</div>
<div class="put">
<input type="hidden" name="_method" value="put">
<button type="submit" class="btn btn-primary" id="update_button" name="boardupdate">글수정</button>
</form>
</div>
<div class="ex04">
<div>
<div class="ex05">
<!-- <pre class="reply">
<pre class="reply_id">답글아이디</pre>
<pre class="reply_content">답글내용</pre>
<pre class="reply_time">작성시간</pre>
</pre> -->
<table class="table">
<tr>
<td style="width: 20%;">댓글아이디</td>
<td style="width: 70%;">댓글내용</td>
<td style="width: 10%;">댓글단시간</td>
</tr>
</table>
</div>
<div class="ex06">

</div>

</div>
</div>
</body>
</html>