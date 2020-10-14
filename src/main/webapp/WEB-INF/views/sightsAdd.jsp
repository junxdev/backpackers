<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/template/head.jspf"%>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.js"></script>
<script src="https://github.com/summernote/summernote/tree/master/lang/summernote-ko-KR.js"></script>
	

</head>
<body>
	<%@ include file="/WEB-INF/views/template/nav.jspf"%>
	<%@ include file="/WEB-INF/views/template/header.jspf"%>
	<!-- Content starts -->

<form class="form-horizontal" method="post">
    
		<div class="form-group">
			<label for="title" class="col-sm-2 control-label">명  소</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" name="title"
					id="title" />
			</div>
		</div>
		
		<div class="form-group">
			<label for="latlng" class="col-sm-2 control-label">좌  표</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" name="latlng"
					id="latlng" />
			</div>
		</div>
		
		<div class="form-group">
			<label for="ellipsis" class="col-sm-2 control-label">주  소</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" name="ellipsis"
					id="ellipsis" />
			</div>
		</div>
		
		<div class="form-group">
			<label for="link" class="col-sm-2 control-label">Link</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" name="link"
					id="link" />
			</div>
		</div>

		<div class="form-group">
			<textarea class="form-control" id="summernote" name="sightsContent"
				placeholder="sightsContent" maxlength="140" rows="7"></textarea>
		</div>
		
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-default" a href="./gear">확 인</a></button>
				<button type="reset" class="btn btn-default">취 소</button>
			</div>
		</div>
	</form>
 
	<!-- Content ends -->
	<%@ include file="/WEB-INF/views/template/footer.jspf"%>




<script>
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
		url : '/backpackers/gear/image',
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
</body>
</html>