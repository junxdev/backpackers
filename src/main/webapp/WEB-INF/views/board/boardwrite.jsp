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
 width: 350px;    
   height: 25px;
 
 }
 
 
 #board_content{
   
  width: 900px;    
   height: 400px;
   
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
<title>글쓰기</title>
</head>
<body>
<%@ include file="/WEB-INF/views/template/nav.jspf" %>
<%@include file="../template/header.jspf" %>

<form  class="form-horizontal" method="post" action="./">
<div class="ex1">
<input type="text" class="form-control" id="board_subject" name="board_subject" placeholder="제목을 입력해주세요">
</div>
<div class="ex2" style="">
	<div class="form-group">
			<textarea class="form-control" id="summernote" name="board_content"
				placeholder="내용을 입력해주세요" maxlength="140" rows="7"></textarea>
		</div>
</div>
<div class="ex3">
<button class="btn btn-primary" type="submit">등록</button>
<button class="btn btn-danger" type="reset">취소</button>
</div>
</form>


<%@include file="../template/footer.jspf" %>
</html>