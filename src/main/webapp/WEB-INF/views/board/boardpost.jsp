<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="../template/head.jspf" %>



<style type="text/css">
 .board_subject{
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
 .board_content{
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
 
 
 
 #delete_button{
  float: right;
 }
 
 .ex04{
  margin: 10px auto;
  width: 1554px; 
 }
 #reply_content{
  border: solid 2px white;
 }
 
 
 
</style>

<script type="text/javascript">
$(function() {	

 	$("#delete_button").click(function (){
		alert("삭제되었습니다.");
		$(location).attr('href', '123');
	});
 
	$("#replyUpdate").one("click",function (){
		alert("ok");
	
		
	$.ajax({
		    url :"/backpackers/board/${boardDitail.board_no}/replyedit",
		    type : "PUT",
		    contentType: "application/json; charset=UTF-8",
		    data : $("reply").serialize(),
		    dataType: "text",
		    success: function(result) {
		    	alert("수정되었습니다");
		    }
		}); 
	
		
		/* 	$.ajax({
			type:'put',
			url:'/board/${boardDitail.board_no}/edit',
			contentType: "application/json; charset=UTF-8",
			dataType: "text",
			data : $("reply").serialize()
			   success: function(result) {
	    	alert("삭제되었습니다.");
	    }
				
				if(result=='SUCCESS'){
					alert("수정되었습니다.");
	
				} 
			 
		}); */
		
	});
 	$("#replyDelete").click(function (){
 		alert("삭제되었습니다.");
		
	 }); 
	  
		
	});
	</script>
	
	
<title>게시글</title>
</head>
<body>
<%@ include file="/WEB-INF/views/template/nav.jspf" %>
<%@include file="../template/header.jspf" %>
<div class="ex1">
<pre class="board_subject">${boardDitail.board_subject}</pre>
</div>
<div class="ex2" >
<pre class="user_ID">${boardDitail.user_ID}</pre>
<pre class="board_date">${boardDitail.board_date}</pre>
<pre class="board_maketime">${boardDitail.board_maketime}</pre>
<pre class="board_views">${boardDitail.board_views}</pre>
<pre class="reply_num">댓글</pre>
</div>



<div class="ex3">
<pre class="board_content">
${boardDitail.board_content}
<pre class="board_hits">
<button  type="submit" class="btn btn-primary" id="board_hits_btn">${boardDitail.board_hits}</button>
추천수
</pre>
</pre>
</div>

<form method="post">
<pre class="reply_content_send">
<input type="text" class="form-control"  id="reply_content_send" name="reply_content" placeholder="댓글을 입력하시오">
<input type="hidden" name="board_no" value="${boardDitail.board_no}">
<button class="btn btn-primary" id="reply_content_btn" type="submit">댓글등록</button></pre>
</div>
</form>
<div class="delete">
<c:if test="${sessionScope.username == boardDitail.user_ID}">
<a href="./${boardDitail.board_no}/edit" class="btn btn-primary" role="button">수정</a>
<form method="post">
<input type="hidden" name="_method" value="delete">
<button type="submit" class="btn btn-danger" name="board_no" id="delete_button" value="${boardDitail.board_no}" >글삭제</button>
</c:if>
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
<form method="post" name="reply" action="${boardDitail.board_no}/replyedit">
<input type="hidden" name="_method" value="put">
<c:forEach items="${reply}" var="reply">
<tr>
<td style="width: 20%;">${reply.reply_id}</td>
<td style="width: 70%;"><input type="text" value="${reply.reply_content}"  id="reply_content" name="reply_content" ></td>
<td style="width: 10%;">${reply.reply_time}</td>
<c:if test="${sessionScope.username == reply.reply_id}">
<td><button type="submit" class="btn btn-primary" id="replyUpdate" name="reply_no" value="${reply.reply_no}">댓글수정</button></td>
</form>
<form method="post">
<input type="hidden" name="_method" value="delete">
<td><button type="submit" class="btn btn-danger" name="reply_no" id="replyDelete" value="${reply.reply_no}">댓글삭제</button></td>
</form> 
</c:if>
</tr>
</c:forEach>
</table>
</div>
<div class="ex06">

</div>

<%@include file="../template/footer.jspf" %>
</html>