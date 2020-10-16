<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../template/head.jspf"%>
<style type="text/css">
section.replyForm {
	padding: 30px 0;
}

section.replyForm div.input_area {
	margin: 10px 0;
}

section.replyForm textarea {
	font-size: 16px;
	font-family: '맑은 고딕', verdana;
	padding: 10px;
	width: 500px;;
	height: 150px;
}

section.replyForm button {
	font-size: 20px;
	padding: 5px 10px;
	margin: 10px 0;
	background: #fff;
	border: 1px solid #ccc;
}

section.replyList {
	padding: 30px 0;
}

section.replyList ol {
	padding: 0;
	margin: 0;
}

section.replyList ol li {
	padding: 10px 0;
	border-bottom: 2px solid #eee;
}

section.replyList div.userInfo {
}

section.replyList div.userInfo .userName {
	font-size: 24px;
	font-weight: bold;
}

section.replyList div.userInfo .date {
	color: #999;
	display: inline-block;
	margin-left: 10px;
}

section.replyList div.replyContent {
	padding: 10px;
	margin: 20px 0;
}
</style>
<title>후기게시판</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/template/nav.jspf"%>
	<%@include file="../template/header.jspf"%>

	<div id="review">
		<c:if test="${member == null }">
			<p>
				후기를 남기시려면 <a href="/member/signin">로그인</a>해주세요
			</p>
		</c:if>

		<c:if test="${member != null }">
			<section class="reviewForm">
				<form role="form" method="post" autocomplete="off">
					<!-- 상품 번호 컨트롤러에 전달(hidden) value=값 수정 필요 -->
					<input type="hidden" name="itemNo" value="${view.itemNo }">
					<div class="input_area">
						<textarea name="reviewContent" id="reviewContent"></textarea>
					</div>

					<div class="input_area">
						<button type="submit" id="review_btn">소감 남기기</button>
					</div>
				</form>
			</section>
		</c:if>
		<section class="reviewList">
			<ol>
				<c:forEach items="${review }" var="review">
					<li>
						<div class="userInfo">
							<span class="userName">${review.userName }</span> <span
								class="date"><fmt:formatDate
									value="${review.reviewDate }" pattern="yyyy-MM-dd" /></span>
						</div>
					</li>
				</c:forEach>
			</ol>
		</section>
	</div>
	<%@include file="../template/footer.jspf"%>
</body>
</html>