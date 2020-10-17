<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<%@ include file="/WEB-INF/views/template/head.jspf" %>
	<link type="text/css" rel="stylesheet" href="${root }/resources/css/shop.css"/>
	<style type="text/css">
	
	
		li{
		 list-style: none;
		}
		
		
	</style>
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
					<div class="row">
							<!-- 등록된 상품 페이지를 나열 -->
							<c:forEach items="${shopList }" var="shop">
							<div class="col-md-4">
							<c:set value="${productMap[shop.shopCode] }" var="productList"></c:set>
								<tr>
									<td>
										<ul>
											<!-- 상품 페이지에 등록된 상품을 나열 -->
											<c:forEach items="${productList }" var="product">
												<!-- 상품에 등록된 이미지가 없을 때 -->
												<c:if test="${not imageMap.containsKey(product.productCode)}">
													<li>
														<a href="${root }/shop/${shop.mainCategoryName }/${shop.subCategoryName }/${shop.shopCode}/${product.productCode }">
															<img src="${productImage }/no-image.jpg" style="width:300px;height:300px;"/>
														</a>
													</li>
												</c:if>
												<!-- 각 페이지에 등록된 상품들의 대표 이미지를 나열 -->
												<c:if test="${imageMap.containsKey(product.productCode)}">
													<li>
														<a href="${root }/shop/${shop.mainCategoryName }/${shop.subCategoryName }/${shop.shopCode}/${product.productCode }">
															<img src="${productImage }/${imageMap[product.productCode].imageURL }" style="width:300px;height:300px;"/>
														</a>
													</li>
												</c:if>
											</c:forEach>
										</ul>
									</td>
									<th>${shop.shopTitle }</th>
									<th>가격:${shop.shopPrice }</th>
								</tr>
								</div>
							</c:forEach>
						<!-- 카테고리에 등록된 상품이 없을 때 -->
						<script type="text/javascript">
							(function ab() {
								var itemList = document.querySelector('table').children.item(1);
							    if(itemList.childElementCount == 0) {
							    	itemList.innerHTML = '<tr><td>판매 중인 상품이 없습니다.</td><td></td></tr>';
							    }
							})();
						</script>
					</div>
				</div>
			</div>
		</div>
		<!-- Content ends -->
	<%@ include file="/WEB-INF/views/template/footer.jspf" %>
</body>
</html>