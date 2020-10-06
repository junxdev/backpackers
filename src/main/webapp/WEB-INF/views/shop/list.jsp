<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		<div class="row">
			<div class="col-xs-6 col-sm-6 col-md-2">
				<div class="category">
					<ul>
						<c:forEach items="${categoryList }" var="bean">
							<li><a href="${root }/shop/${bean.mainCategoryName }">${fn:toUpperCase(bean.mainCategoryName) }</a>
								<ul>
									<c:forEach items="${bean.subCategoryList }" var="subCategoryName">
										<li><a href="${root }/shop/${bean.mainCategoryName }/${subCategoryName }">${fn:toUpperCase(subCategoryName) }</a></li>
									</c:forEach>
								</ul>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-10">
				<div class="content">
					<table class="table">
						<thead>
							<tr>
								<th>이름</th>
								<th>가격</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${shopList }" var="shop">
								<tr>
									<td>
										<ul><span>${shop.shopTitle }</span>
											<c:forEach items="${shop.productList }" var="product">
												<c:forEach items="${product.productImageList }" var="image">
													<c:if test="${image.imageOrder == 0 }">
														<li>
															<a href="${root }/shop/${shop.mainCategoryName }/${shop.subCategoryName }/${product.productCode }">
																<img src="${root }/resources/img/${image.imageURL }" style="width:300px;height:300px;"/>
															</a>
														</li>
													</c:if>
													<c:if test="${image.imageOrder > 0 }">
														<li>
															${image.imageURL }
														</li>	
													</c:if>
												</c:forEach>
											</c:forEach>
										</ul>
									</td>
									<td>${shop.shopPrice }</td>
								</tr>
							</c:forEach>
						</tbody>
						<script type="text/javascript">
							(function ab() {
								var itemList = document.querySelector('table').children.item(1);
							    if(itemList.childElementCount == 0) {
							    	itemList.innerHTML = '<tr><td>판매 중인 상품이 없습니다.</td><td></td></tr>';
							    }
							})();
						</script>
					</table>
				</div>
			</div>
		</div>
		<!-- Content ends -->
	<%@ include file="/WEB-INF/views/template/footer.jspf" %>
</body>
</html>