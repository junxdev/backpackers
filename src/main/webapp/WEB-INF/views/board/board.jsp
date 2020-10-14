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
<c:forEach items="${list}" var="title">
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
<div class="search_board">
<form name="form1" method="post" action="./search">
<select class="form-control" name="searchOption">
  <option value="all"<c:out value="${map.searchOption == 'all'?'selected':''}"/> >전체</option>
  <option value="board_subject"<c:out value="${map.searchOption == 'board_subject'?'selected':''}"/> >제목</option>
  <option value="user_ID"<c:out value="${map.searchOption == 'user_ID'?'selected':''}"/> >이름</option>
  <option value="board_content"<c:out value="${map.earchOption == 'board_content'?'selected':''}"/> >내용</option>
</select>
 <input type="text" name="keyword" value="${map.keyword}" class="form-control" placeholder="검색">
 <button class="btn btn-primary" type="submit">검색</button>
 </form>
<p><a class="btn btn-primary" href="./boardwrite" role="button">글쓰기</a></p>
</div>
<div class="boardpaging">


<ul class="btn-group pagination">
    <c:if test="${pageMaker.prev }">
    <li>
        <a href='<c:url value="/board/?page=${pageMaker.startPage-1 }"/>'><i class="fa fa-chevron-left"></i></a>
    </li>
    </c:if>
    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
    <li>
        <a href='<c:url value="/board/?page=${pageNum }"/>'><i class="fa">${pageNum }</i></a>
    </li>
    </c:forEach>
    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
    <li>
        <a href='<c:url value="/board/?page=${pageMaker.endPage+1 }"/>'><i class="fa fa-chevron-right"></i></a>
    </li>
    </c:if>
</ul>



<!-- <nav>
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
</nav> -->

</div>

<%@include file="../template/footer.jspf" %>

</html>