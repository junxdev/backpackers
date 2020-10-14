<%@page import="com.bit.backpackers.product.model.entity.ProductVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<%@ include file="/WEB-INF/views/template/head.jspf" %>
	<link type="text/css" rel="stylesheet" href="${root }/resources/css/radio-toolbar.css"/>
	<style type="text/css">
		.input-group {
			width: 50%;
		}
		.modalHidden {
			display: none;
		}
		.modalShow {
			position: 
			display: block;
		}
	</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/template/nav.jspf" %>
	<%@ include file="/WEB-INF/views/template/header.jspf" %>
		<!-- Content starts 필요 시 임의로 그리드 조정 -->
		<section>
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-8">
					<div>
						<!-- 1개의 상품을 출력 -->
						<c:forEach items="${shop.productList }" var="product">
							<c:if test="${product.productCode eq productCode }">
								<!-- 등록된 이미지가 없을 때 -->
								<c:if test="${product.productImageList.size() == 0 }">
									<img src="${root }/resources/img/no-image.jpg" style="width:300px;height:300px;"/>
								</c:if>
								<!-- 등록된 이미지들을 나열 -->
								<c:forEach items="${product.productImageList }" var="image">
									<img src="${root }/resources/img/${image.imageURL}"  style="width:300px;height:300px;"/>
								</c:forEach>
							</c:if>
						</c:forEach>
					</div>
				</div><!-- image end -->
				<div class="col-xs-12 col-sm-6 col-md-4">
					<div>
						<h2>${shop.shopTitle }</h2>
					</div><!--  title end -->
					<div>
						<span>${shop.shopPrice }</span>
					</div><!-- price end -->
					<div>
						<div>
							<span>${shop.productList[0].optionGroupName }</span>
						</div>
						<c:forEach items="${shop.productList }" var="product" >
							<!-- 등록된 이미지가 없을 때 -->
							<span>
								<c:if test="${product.productImageList.size() == 0 }">
									<a title="${product.optionName }" href="${root }/shop/${shop.mainCategoryName }/${shop.subCategoryName }/${shop.shopCode}/${product.productCode }">
										<img src="${root }/resources/img/no-image.jpg" style="width:50px;height:50px;"/>
									</a>
								</c:if>
								<!-- 등록된 이미지 중 대표 이미지를 나열 -->
								<c:forEach items="${product.productImageList }" var="image" end="0">
									<c:if test="${image.imageOrder == 0 }">
										<a title="${product.optionName }" href="${root }/shop/${shop.mainCategoryName }/${shop.subCategoryName }/${shop.shopCode}/${product.productCode }">
											<img src="${root }/resources/img/${image.imageURL}"  style="width:50px;height:50px;"/>
										</a>
									</c:if>
								</c:forEach>
							</span>
						</c:forEach>
					</div><!-- first option with image end -->
					<form id="orderItemForm">
					<div>
						<!-- 1개의 상품을 출력 -->
						<c:forEach items="${shop.productList }" var="product">
							<c:if test="${product.productCode eq productCode }">
							<input type="text" id="productCode" name="productCode" value="${product.productCode }" hidden="true">
							<!-- 등록된 옵션(주로 사이즈)들을 나열 -->
								<div>${product.productItemList[0].optionGroupName }</div>
								<div class="radio-toolbar">
									<c:forEach items="${product.productItemList }" var="item" varStatus="status">
									    <input type="radio" id="itemOption${status.count }" name="optionCode" value="${item.optionCode }">
									    <label for="itemOption${status.count }"  style="cursor:pointer"><span>${item.optionName }</span></label> 
									</c:forEach>
								</div>
							</c:if>
						</c:forEach>
					</div><!-- second option end -->
					<div>
						<div>Quantity</div>
						<div class="input-group">
							<span class="input-group-btn">
								<button type="button" class="quantity-left-minus btn btn-default">
									<span class="glyphicon glyphicon-minus"></span>
								</button>
							</span>
							<input type="number" id="quantity" name="quantity" class="form-control input-number" value="1" min="1" max="100" readonly="readonly" style="background-color:white;cursor:not-allowed">
							<span class="input-group-btn">
								<button type="button" class="quantity-right-plus btn btn-default">
									<span class="glyphicon glyphicon-plus"></span>
								</button>
							</span>
						</div>
						<script type="text/javascript">
							(function() {
								var quantitiy = 1;
								$('.quantity-right-plus').click(function(e){
									e.preventDefault();
									var quantity = parseInt($('#quantity').val());
							    	$('#quantity').val(quantity + 1);
								});
								$('.quantity-left-minus').click(function(e){
							        e.preventDefault();
							        var quantity = parseInt($('#quantity').val());
						            if(quantity > 1){
						            	$('#quantity').val(quantity - 1);
						            }
						    	});
							})();
						</script>
					</div>
					</form>
					<div>
						<button id="btnBuy" class="btn btn-default">구매하기</button>
						<button id="btnCart" class="btn btn-default">장바구니에 담기</button>
						<script type="text/javascript">
							var orderItemForm = document.querySelector('#orderItemForm');
							function buyNow() {
								orderItemForm.action = '${root}/order';
								console.log(orderItemForm.action);
								orderItemForm.method = 'POST';
								console.log(orderItemForm.method);
								orderItemForm.submit();
							}
							(function() {
								document.querySelector('#btnBuy').addEventListener('click', function() {
									console.log('buy before');
									buyNow();
									console.log('buy after');
								});								
							})();
							(function() {
								document.querySelector('#btnCart').addEventListener('click', function() {
									console.log('works');
									var productCode = document.querySelector('#productCode').value;
									var optionCode = document.querySelector('input[name="optionCode"]:checked').value;
									var quantity = document.querySelector('#quantity').value;
									$.ajax({
										url:'/backpackers/order/cart',
										method:'POST',
										data: JSON.stringify({ 'productCode': productCode, 'optionCode': optionCode, 'quantity': quantity}),
										//data: { 'productCode': 'test', 'optionCode': 'test', 'quantity': 'test'},
										contentType:'application/json; charset=utf-8',
										dataType:'text',
										success:function(data){
											$('#myModal').modal('show');
										}
									});
								});
							})();
						</script>
					</div>
				</div><!-- info end -->
	    	</div><!-- row end -->
		</section>
		<!-- Content ends -->
	<%@ include file="/WEB-INF/views/template/footer.jspf" %>
	<div id="myModal" class="modal fade" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">Modal title</h4>
				</div>
				<div class="modal-body">
					<p>One fine body&hellip;</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
</body>
</html>