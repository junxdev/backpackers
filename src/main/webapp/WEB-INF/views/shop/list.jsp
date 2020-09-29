<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<%@ include file="/WEB-INF/views/template/head.jspf" %>
</head>
<body>
	<%@ include file="/WEB-INF/views/template/nav.jspf" %>
	<%@ include file="/WEB-INF/views/template/header.jspf" %>
		<!-- Content starts 필요 시 임의로 그리드 조정 -->
		<section>
			<div class="row">
				<div class="col-md-12">
					<div class="content">
						<table class="table">
							<thead>
								<tr>
									<th>이름</th>
									<th>가격</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${shopArticleList }" var="bean">
									<tr>
										<td><a href="shop/${bean.shopArticleCode }">${bean.shopArticleTitle }</a></td>
										<td>${bean.shopArticlePrice }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</section>
		<!-- Content ends -->
	<%@ include file="/WEB-INF/views/template/footer.jspf" %>
</body>
</html>