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
		.product-form {
			border: 1px solid black;
			border-radius: 5px;
			padding: 1em;
		}
		.product-item-form {
			border: 1px solid black;
			border-radius: 5px;
			padding: 1em;
		}
	</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/template/nav.jspf" %>
	<%@ include file="/WEB-INF/views/template/header.jspf" %>
		<!-- Content starts 필요 시 임의로 그리드 조정 -->
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12">
				<div class="content">
					<form class="form-horizontal">
						<div class="form-group"> <!-- shop form -->
							<label for="shopCode" class="col-sm-2 control-label">판매코드</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="shopCode" value="${shop.shopCode }"/>
							</div>
						</div>
						<div class="form-group">
							<label for="shopTitle" class="col-sm-2 control-label">판매제목</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="shopTitle" value="${shop.shopTitle }"/>
							</div>
						</div>
						<div class="form-group">
							<label for="shopPrice" class="col-sm-2 control-label">판매가격</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="shopPrice" value="${shop.shopPrice }"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">대분류</label>
							<div class="col-sm-9 col-md-4">
								<select class="form-control" name="mainCategoryCode">
									<c:forEach items="${mainCategoryMap }" var="mainCategory">
									<option value="${mainCategory.key }">${mainCategory.value.mainCategoryName }</option>
									</c:forEach>
								</select>
							</div>
							<label class="col-sm-2 col-md-1 control-label">소분류</label>
							<div class="col-sm-9 col-md-4">
								<select class="form-control" name="subCategoryCode">
								</select>
							</div>
							<script type="text/javascript">
								var options = {
									<c:forEach items="${subCategoryMap }" var="subCategory">
							        '${subCategory.key}' : '<c:forEach items="${subCategory.value }" var="list"><option value="${list.subCategoryCode}">${list.subCategoryName}</option></c:forEach>',
									</c:forEach>
								};
								document.querySelector('select').value = '${shop.mainCategoryCode}';
								document.querySelectorAll('select')[1].innerHTML = options[document.querySelector('select').value];
								document.querySelectorAll('select')[1].value = '${shop.subCategoryCode}';
								document.querySelector('select').addEventListener('change', function() {
									var mainCategoryCode = this.value;
									document.querySelectorAll('select')[1].innerHTML = options[mainCategoryCode];
								});
							</script>
						</div> <!-- shop form -->
						<div class="product-form-control"> <!-- product form -->
							<div class="form-group"> <!-- product add button -->
								<label for="productCode" class="col-sm-2 control-label">상품</label>
								<div class="col-sm-9">
									<button class="btn btn-primary">추가</button>
								</div>
							</div> <!-- product add button -->
							<div class="form-group"> <!-- product info form -->
								<div class="col-sm-offset-2 col-sm-9">
									<div class="row">
										<div class="product-form">
											<c:forEach items="${productList }" var="product" varStatus="status">
											<div class="form-group">
												<label for="productCode${status.index}" class="col-sm-2 control-label">상품코드</label>
												<div class="col-sm-8">
													<input type="text" class="form-control" id="productCode${status.index}" name="productCode" value="${product.productCode }"/>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">옵션 그룹</label>
												<div class="col-sm-10 col-md-4">
													<select class="form-control first-option-group${status.index}" name="optionGroupCode">
														<c:forEach items="${optionGroupList }" var="optionGroup">
														<option value="${optionGroup.optionGroupCode }">${optionGroup.optionGroupName }</option>
														</c:forEach>
													</select>
												</div>
												<label class="col-sm-2 control-label">옵션 선택</label>
												<div class="col-sm-10 col-md-4">
													<select class="form-control first-option${status.index}" name="firstOptionCode">
													</select>
												</div>
												<script type="text/javascript">
												var options = {
													<c:forEach items="${optionMap }" var="option">
											        '${option.key}' : '<c:forEach items="${option.value }" var="list"><option value="${list.optionCode}">${list.optionName}</option></c:forEach>',
													</c:forEach>
												};
												console.log('${product.optionGroupCode}' + '   ' + '${status.index}');
												document.querySelector('.first-option-group${status.index}').value = '${product.optionGroupCode}';
												document.querySelector('.first-option${status.index}').innerHTML = options[document.querySelector('.first-option-group${status.index}').value];
												document.querySelector('.first-option${status.index}').value = '${product.optionCode}';
												document.querySelector('.first-option-group${status.index}').addEventListener('change', function() {
													var firstOptionGroupCode = this.value;
													document.querySelector('.first-option${status.index}').innerHTML = options[firstOptionGroupCode];
												});
												</script>
												
											</div>
											<div class="form-group"> <!-- product item add button -->
												<label for="productCode" class="col-sm-2 control-label">옵션</label>
												<div class="col-sm-10">
													<button class="btn btn-primary">추가</button>
												</div>
											</div> <!-- product item add button -->
											<div class="form-group"> 
												<div class="col-sm-offset-2 col-sm-8">
													<div class="row">
														<div class="product-item-form">
															<c:forEach items="${productItemMap[product.productCode] }" var="productItem" varStatus="status">
															<div class="form-group">
																<label class="col-sm-1 control-label">옵션 그룹</label>
																<div class="col-sm-10 col-md-2">
																	<select class="form-control second-option-group${status.index}" name="optionGroupCode">
																		<c:forEach items="${optionGroupList }" var="optionGroup">
																		<option value="${optionGroup.optionGroupCode }">${optionGroup.optionGroupName }</option>
																		</c:forEach>
																	</select>
																</div>
																<label class="col-sm-1 control-label">옵션</label>
																<div class="col-sm-10 col-md-2">
																	<select class="form-control second-option${status.index}" name="optionCode">
																	</select>
																</div>
																<script type="text/javascript">
																console.log('${status.index}')
																	document.querySelector('.second-option-group${status.index}').value = '${productItem.optionGroupCode}';
																	document.querySelector('.second-option${status.index}').innerHTML = options[document.querySelector('.second-option-group${status.index}').value];
																	document.querySelector('.second-option${status.index}').value = '${productItem.optionCode}';
																	document.querySelector('.second-option-group${status.index}').addEventListener('change', function() {
																		var secondOptionGroupCode = this.value;
																		document.querySelector('.second-option${status.index}').innerHTML = options[secondOptionGroupCode];
																	});
																</script>
																<label class="col-sm-1 control-label">옵션</label>
																<div class="col-sm-3">
																	<input type="text" class="form-control" id="item${status.index}" name="itemCode" value="${productItem.itemCode }"/>
																</div>
															</div>
															</c:forEach>
														</div>
													</div>
												</div>
											</div>
											</c:forEach>
										</div>
									</div>
								</div>
							</div> <!-- product info form -->
						</div> <!-- product form -->
						<div class="form-group"> <!-- form button -->
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-default">Sign in</button>
							</div>
						</div> <!-- form button -->
					</form>
				</div>
			</div>
		</div>
		<!-- Content ends -->
	<%@ include file="/WEB-INF/views/template/footer.jspf" %>
</body>
</html>