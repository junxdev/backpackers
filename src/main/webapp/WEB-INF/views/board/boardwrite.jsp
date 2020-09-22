<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="../template/head.jspf" %>
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
<input type="text" class="form-control" id="board_content"  name="board_content" placeholder="내용을 입력해주세요">
</div>
<div class="ex3">
<button class="btn btn-primary" type="submit">등록</button>
<button class="btn btn-danger" type="reset">취소</button>
</div>
</form>


<%@include file="../template/footer.jspf" %>
</html>