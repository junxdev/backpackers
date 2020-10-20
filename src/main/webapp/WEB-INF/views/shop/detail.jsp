<%@page import="com.bit.backpackers.product.model.entity.ProductVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/template/head.jspf"%>
<link type="text/css" rel="stylesheet"
	href="${root }/resources/css/radio-toolbar.css" />
<link type="text/css" rel="stylesheet"
	href="${root }/resources/css/shop.css" />
<style type="text/css">
.input-group {
	width: 50%;
}

.first-option img {
	border: 2px solid white;
}

.first-option-now>img {
	border: 2px solid black;
}

section.reviewForm {
	padding: 30px 0;
}

section.reviewForm div.input_area {
	margin: 10px 30px;
}

section.reviewForm textarea {
	font-size: 16px;
	font-family: '맑은 고딕', verdana;
	padding: 10px;
	width: 500px;;
	height: 30px;
}

section.reviewForm button {
	font-size: 20px;
	padding: 3px 3px;
	margin: 5px 0;
	background: #fff;
	border: 1px solid #ccc;
}

#review_upd_btn, #review_del_btn {
	float: right;
}

#reviewContent2{
 border: 1px none #ccc;
}

/* section.reviewList {
	padding: 30px 0;
}

section.reviewList ol {
	padding: 0;
	margin: 0;
}

section.reviewList ol li {
	padding: 10px 0;
	border-bottom: 2px solid #eee;
}

section.reviewList div.userInfo {
	
}

section.reviewList div.userInfo .userName {
	font-size: 24px;
	font-weight: bold;
}

section.reviewList div.userInfo .date {
	color: #999;
	display: inline-block;
	margin-left: 10px;
}

section.reviewList div.reviewContent {
	padding: 10px;
	margin: 20px 0;
} */
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/template/nav.jspf"%>
	<%@ include file="/WEB-INF/views/template/header.jspf"%>
	<!-- Content starts 필요 시 임의로 그리드 조정 -->
	<div class="row">
		<div class="col-xs-12 col-sm-6 col-md-8">
			<div class="shop-window">
				<!-- 1개의 상품을 출력 -->
				<!-- 등록된 이미지가 없을 때 -->
				<c:if test="${imageList.size() == 0 }">
					<img src="${productImage }/no-image.jpg"
						style="width: 300px; height: 300px;" />
				</c:if>
				<c:forEach items="${imageList }" var="image">
					<!-- 등록된 이미지들을 나열 -->
					<img src="${productImage }/${image.imageURL}"
						style="width: 300px; height: 300px;" />
				</c:forEach>
			</div>
		</div>
		<!-- image end -->
		<div class="col-xs-12 col-sm-6 col-md-4 shop-info">
			<div class="shop-title">
				<h2>${shop.shopTitle }</h2>
			</div>
			<!--  title end -->
			<div class="shop-price">
				<span>${shop.shopPrice }</span>
			</div>
			<!-- price end -->
			<div class="first-option">
				<!-- 대표 이미지 나열 -->
				<div>
					<span>${productList[0].firstOptionGroupName }</span>
				</div>
				<div>
					<c:forEach items="${productList }" var="product">
						<span> <!-- 등록된 대표 이미지가 없을 때 --> <c:choose>
								<c:when test="${product.productCode eq productCode }">
									<a class="first-option-now" title="${product.firstOptionName }"
										href="${root }/shop/${shop.mainCategoryName }/${shop.subCategoryName }/${shop.shopCode}/${product.productCode }">
								</c:when>
								<c:otherwise>
									<a title="${product.firstOptionName }"
										href="${root }/shop/${shop.mainCategoryName }/${shop.subCategoryName }/${shop.shopCode}/${product.productCode }">
								</c:otherwise>
							</c:choose> <c:if
								test="${not titleImageMap.containsKey(product.productCode) }">
								<img src="${productImage }/no-image.jpg"
									style="width: 50px; height: 50px;" />
							</c:if> <!-- 등록된 대표 이미지가 있을 때 --> <c:if
								test="${titleImageMap.containsKey(product.productCode) }">
								<img
									src="${productImage }/${titleImageMap[product.productCode].imageURL }"
									style="width: 50px; height: 50px;" />
							</c:if> </a>
						</span>
					</c:forEach>
				</div>
			</div>
			<!-- first option with image end -->
			<form id="orderItemForm">
				<div class="second-option">
					<!-- 1개의 상품을 출력 -->
					<input type="text" id="productCode" name="productCode"
						value="${productCode }" hidden="true">
					<!-- 등록된 옵션(주로 사이즈)들을 나열 -->
					<div>${optionList[0].optionGroupName }</div>
					<div class="radio-toolbar">
						<c:forEach items="${optionList }" var="option" varStatus="status">
							<input type="radio" id="itemOption${status.count }"
								name="secondOptionCode" value="${option.optionCode }">
							<label for="itemOption${status.count }" style="cursor: pointer"><span>${option.optionName }</span></label>
						</c:forEach>
					</div>
				</div>
				<!-- second option end -->
				<div class="quantity">
					<div>Quantity</div>
					<div class="input-group">
						<span class="input-group-btn">
							<button type="button" class="quantity-left-minus btn btn-default">
								<span class="glyphicon glyphicon-minus"></span>
							</button>
						</span> <input type="number" id="quantity" name="quantity"
							class="form-control input-number" value="1" min="1" max="100"
							readonly="readonly"
							style="background-color: white; cursor: not-allowed"> <span
							class="input-group-btn">
							<button type="button" class="quantity-right-plus btn btn-default">
								<span class="glyphicon glyphicon-plus"></span>
							</button>
						</span>
					</div>

					<script type="text/javascript">
						(function() {
							var quantitiy = 1;
							$('.quantity-right-plus').click(function(e) {
								e.preventDefault();
								var quantity = parseInt($('#quantity').val());
								$('#quantity').val(quantity + 1);
							});
							$('.quantity-left-minus').click(function(e) {
								e.preventDefault();
								var quantity = parseInt($('#quantity').val());
								if (quantity > 1) {
									$('#quantity').val(quantity - 1);
								}
							});

							$('#btnBuy')
									.click(
											function(e) {
												e.preventDefault();
												var pointvalue = ($('#itemOption1,#itemOption2,#itemOption3')
														.val());
												if (pointvalue == null) {

												}
											});
						})();
					</script>

				</div>
				<script type="text/javascript">
					(function() {
						var quantitiy = 1;
						$('.quantity-right-plus').click(function(e) {
							e.preventDefault();
							var quantity = parseInt($('#quantity').val());
							$('#quantity').val(quantity + 1);
						});
						$('.quantity-left-minus').click(function(e) {
							e.preventDefault();
							var quantity = parseInt($('#quantity').val());
							if (quantity > 1) {
								$('#quantity').val(quantity - 1);
							}
						});
					})();
				</script>
			</form>
			<div>
				<button id="btnBuy" class="btn btn-default">구매하기</button>
				<button id="btnCart" class="btn btn-default">장바구니에 담기</button>
				<script type="text/javascript">
					var orderItemForm = document
							.querySelector('#orderItemForm');
					function buyNow() {
						orderItemForm.action = '${root}/order';
						console.log(orderItemForm.action);
						orderItemForm.method = 'POST';
						console.log(orderItemForm.method);
						orderItemForm.submit();
					}
					(function() {
						document.querySelector('#btnBuy').addEventListener(
								'click', function() {
									console.log('buy before');
									buyNow();
									console.log('buy after');
								});
					})();
					(function() {
						document
								.querySelector('#btnCart')
								.addEventListener(
										'click',
										function() {
											console.log('works');
											var productCode = document
													.querySelector('#productCode').value;
											var secondOptionCode = document
													.querySelector('input[name="secondOptionCode"]:checked').value;
											var quantity = document
													.querySelector('#quantity').value;
											$
													.ajax({
														url : '/backpackers/order/cart',
														method : 'POST',
														data : JSON
																.stringify({
																	'productCode' : productCode,
																	'secondOptionCode' : secondOptionCode,
																	'quantity' : quantity
																}),
														//data: { 'productCode': 'test', 'optionCode': 'test', 'quantity': 'test'},
														contentType : 'application/json; charset=utf-8',
														dataType : 'text',
														beforeSend : function(
																xhr) {
															xhr
																	.setRequestHeader(
																			"ajax-need-login",
																			"true");
														},
														success : function(data) {
															var firstOption = document
																	.querySelector('.first-option-now').title;
															var secondOption = document
																	.querySelector('input[name="secondOptionCode"]:checked').nextElementSibling.innerText;
															document
																	.querySelector('.shop-message').innerText = '장바구니에 ${shop.shopTitle }('
																	+ firstOption
																	+ ', '
																	+ secondOption
																	+ ') 상품 '
																	+ quantity
																	+ '개를 담았습니다!';
															$('#shopModal')
																	.modal(
																			'show');
														},
														error : function(e) {
															if (e.status == 400) {
																location.href = '${root}/user/login'
															}
														}
													});
										});
					})();
				</script>
				<script type="text/javascript">
					$(document)
							.ready(
									function() {
										$("#review_btn")
												.click(
														function() {
															var reviewContent = $(
																	'#reviewContent')
																	.val();
															var shopCode = "${shop.shopCode}";
															var params = "reviewContent="
																	+ reviewContent
																	+ "&shopCode="
																	+ shopCode;
															$
																	.ajax({
																		url : "${root}/shop/insertReview",
																		method : 'POST',
																		data : {
																			reviewContent : reviewContent,
																			shopCode : "${shop.shopCode}"
																		},
																		success : function(
																				data) {
																			alert(data);
																		},
																		error : function(
																				error) {
																			alert("입력 실패");
																		}
																	});
														});
									});
				</script>
		<!-- 		<script>
					$(document).ready(function(){
						$("#").on('click', function(){
							alert("수정되었습니다");
							location.href="${root}";
						});
					});
				</script> -->

			</div>
		</div>
		<!-- info end -->
	</div>
	<!-- row end -->
	<!-- review -->
	<div id="review">
		<c:if test="${sessionScope.username == null }">
			<p>
				한줄평을 남기시려면 <a href="/backpackers/user/login">로그인</a>해주세요
			</p>
		</c:if>
		<c:if test="${sessionScope.username != null }">
			<section class="reviewForm">
				<form role="form" method="post">
					<%--  <input type="hidden" name="shopCode" id="shopCode" value="${shop.shopCode}" >  --%>
					<textarea name="reviewContent" id="reviewContent"></textarea>

					<!-- 					<div class="input_area"> -->
					<button type="submit" id="review_btn">한줄평 남기기</button>
					<!-- 					</div> -->
				</form>
			</section>
		</c:if>

		<section class="reviewList">
			<div class="userInfo">
				<table class="table">
					<tr>
						<th style="width: 10%;">아이디</th>
						<th style="width: 66%;">내용</th>
						<th style="width: 14%;">작성일</th>
						<th style="width: 5%;"></th>
						<th style="width: 5%;"></th>
					</tr>
					<c:forEach items="${review}" var="review">
						<form method="post"
							action="${root }/shop/${review.reviewNo}/update">
							<tr id="review_tr1">
								<td>${review.userId}</td>
								<td><input type="text" value="${review.reviewContent}"
									id="reviewContent2" name="reviewContent2"></td>
								<td>${review.reviewDate}</td>
								<c:if test="${sessionScope.username == review.userId }">
									<input type="hidden" name="_method" value="put">
									<td><button name="reviewNo" value="${review.reviewNo }"
											type="submit" id="review_upd_btn" class="btn btn-primary">수정하기</button></td>
								</c:if>
						</form>
						<form method="post"
							action="${root }/shop/${review.reviewNo }/delete">
							<c:if test="${sessionScope.username == review.userId }">
								<input type="hidden" name="_method" value="delete">
								<td><button name="reviewNo" value="${review.reviewNo }"
										type="submit" id="review_del_btn" class="btn btn-danger">삭제하기</button></td>
							</c:if>
						</form>
						</tr>
					</c:forEach>
				</table>
			</div>
		</section>
	</div>
	<!-- Content ends -->
	<%@ include file="/WEB-INF/views/template/footer.jspf"%>
	<!-- 쇼핑 모달 -->
	<div id="shopModal" class="modal fade" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="shop-message">장바구니</div>
				</div>
				<div class="modal-body">
					<a href="${root }/order/cart" role="button" class="btn btn-primary">장바구니
						보기</a>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
</body>
</html>