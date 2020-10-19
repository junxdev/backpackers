<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="../template/head.jspf" %>
<style type="text/css">


#boardsubject{
text-align: center;

}

</style>


<script>

function list(page) {
	 location.href="/backpackers/board/search?page="+page+"&searchOption=${map.searchOption}"+"&keyword=${map.keyword}"; 
}
</script>
<title>게시판</title>
</head>
<body>
<%@ include file="/WEB-INF/views/template/nav.jspf" %>
<%@include file="../template/header.jspf" %>
${map.count}개의 게시물이 검색되었습니다.
<table class="table table-striped">
<tr>
<th style="width: 10%;">번호</th>
<th style="width: 55%;" id="boardsubject">제목</th>
<th style="width: 10%;">글쓴이</th>
<th style="width: 10%;">작성일</th>
<th style="width: 10%;">조회</th>
</tr>
<c:forEach items="${map.list}" var="title">
<tr>
<td>${title.board_no}</td>
<td id="boardsubject"><a href="./${title.board_no}">${title.board_subject}</a></td>
<td>${title.user_ID}</td>
<td>${title.board_date}</td>
<td>${title.board_views}</td>
</tr>
</c:forEach>
</table>
<div class="search_board">
<form name="form1" method="post" action="./search">
<select class="form-control" name="searchOption">
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
<table>

<%-- 
		<tr>
			<td colspan="5">
				<!-- 처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력-->
				<c:if test="${map.boardPager.curBlock > 1}">
					<a href="javascript:list('1')">[처음]</a>
				</c:if>
				
				<!-- 이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
				<c:if test="${map.boardPager.curBlock > 1}">
					<a href="javascript:list('${map.boardPager.prevPage}')">[이전]</a>
				</c:if>
				<!-- **하나의 블럭 시작페이지부터 끝페이지까지 반복문 실행 -->
				<c:forEach var="num" begin="${map.boardPager.blockBegin}" end="${map.boardPager.blockEnd}">
					<!-- 현재페이지이면 하이퍼링크 제거 -->
					<c:choose>
						<c:when test="${num == map.boardPager.curPage}">
							<span style="color: red">${num}</span>&nbsp;
						</c:when>
						<c:otherwise>
							<a href="javascript:list('${num}')">${num}</a>&nbsp;
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<!-- 다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
				<c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
					<a href="javascript:list('${map.boardPager.nextPage}')">[다음]</a>
				</c:if>
				
				<!-- 끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
				<c:if test="${map.boardPager.curPage <= map.boardPager.totPage}">
					<a href="javascript:list('${map.boardPager.totPage}')">[끝]</a>
				</c:if>
			</td>
		</tr> --%>
	





</table>

</div>

<%@include file="../template/footer.jspf" %>

</html>