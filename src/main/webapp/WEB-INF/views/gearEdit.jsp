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

<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  <!-- CSS Files -->
  <link href="./assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="./assets/css/paper-kit.css?v=2.2.0" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="./assets/demo/demo.css" rel="stylesheet" />

</head>
<body>
	<%@ include file="/WEB-INF/views/template/nav.jspf"%>
	<%@ include file="/WEB-INF/views/template/header.jspf"%>
	<!-- Content starts -->

<form class="form-horizontal" action="." method="post">
		<input type="hidden" name="_method" value="put">
	  <div class="form-group">
	    <label for="gearNo" class="col-sm-2 control-label">글번호 </label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" name="gearNo" id="gearNo" value="${bean.gearNo }" readonly="readonly"/>
	    </div>
    
		<div class="form-group">
			<label for="gearTitle" class="col-sm-2 control-label">제 목</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" name="gearTitle"
					id="gearTitle" value="${bean.gearTitle }"/>
			</div>
		</div>

		<div class="form-group">
			<textarea class="form-control" id="summernote" name="gearContent"
				placeholder="gearContent" maxlength="140" rows="7" >${bean.gearContent }</textarea>
		</div>
		
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-default">수 정</button>
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