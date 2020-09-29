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
				<div class="col-xs-12 col-sm-6 col-md-8">
					<div>
						img
					</div>
				</div>
				<div class="col-xs-6 col-md-4">
					<div>
						<h2>${bean.shopArticleTitle }</h2>
					</div>
					<div>
						<span>${bean.shopArticlePrice }</span>
					</div>
					<div>
						
					</div>
				</div>
	    	</div>
		</section>
		<!-- Content ends -->
	<%@ include file="/WEB-INF/views/template/footer.jspf" %>
</body>
</html>