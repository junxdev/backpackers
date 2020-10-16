<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="../template/head.jspf" %>
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
<%@ include file="/WEB-INF/views/template/nav.jspf" %>
<%@include file="../template/header.jspf" %>
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
<div class="form-group">
			<textarea class="form-control" id="summernote" name="board_content"
				 maxlength="140" rows="7">${boardDitail.board_content}</textarea>
		</div>
		
</div>
</div>
<div class="put">
<input type="hidden" name="_method" value="put">
<button type="submit" class="btn btn-primary" id="update_button" name="boardupdate">글수정</button>
</form>
</div>
<div class="ex04">
<div>

<div class="ex06">

</div>

<%@include file="../template/footer.jspf" %>
</html>