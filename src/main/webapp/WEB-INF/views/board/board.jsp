<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="../template/head.jspf" %>
<style type="text/css">

</style>
<title>게시판</title>
</head>
<body>
<%@ include file="/WEB-INF/views/template/nav.jspf" %>
<%@include file="../template/header.jspf" %>
<table class="table">
<tr>
<th>번호</th>
<th>제목</th>
<th>글쓴이</th>
<th>작성일</th>
<th>조회</th>
<th>주천</th>
</tr>
<c:forEach items="${board}" var="title">
<tr>
<td>${title.board_no}</td>
<td><a href="./${title.board_no}">${title.board_subject}</a></td>
<td>${title.user_ID}</td>
<td>${title.board_date}</td>
<td>${title.board_views}</td>
<td>${title.board_hits}</td>

</tr>
</c:forEach>
</table>
<div class="ex1">
<select class="form-control">
  <option>검색</option>
  <option>전체</option>
  <option>작성자</option>
  <option>글제목</option>
  
</select>
 <input type="text" class="form-control" placeholder="검색">
 
<p><a class="btn btn-primary" href="./boardwrite" role="button">글쓰기</a></p>
</div>
<div class="boardpaging">
<nav>
  <ul class="pagination">
    <li>
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>

</div>

<%@include file="../template/footer.jspf" %>

</html>