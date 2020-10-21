<%@page import="com.bit.backpackers.product.model.entity.ProductVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<%@ include file="/WEB-INF/views/template/head.jspf"%>
	<link type="text/css" rel="stylesheet" href="${root }/resources/css/radio-toolbar.css" />
	<link type="text/css" rel="stylesheet" href="${root }/resources/css/shop.css" />
	<style type="text/css">
		h2, .h2 {
		    font-size: 4rem;
		}
		
		.input-group {
			width: 50%;
		}
		
		.shop-info-section {
			margin-bottom: 1em;
		}
		
		.shop-info-section > div {
			margin-bottom: 0.5em;
		}
		
		.shop-title > h2 {
			font-weight: 900;
		}
		
		.shop-price {
			font-size: 3rem;
		}
		
		.shop-content {
			margin: 2em 0em 0em 0em ;
		}
		
		.first-option img {
			border: 2px solid white;
		}
		
		.first-option-now > img {
			border: 2px solid black;
		}
		
		.input-group-btn {
		   display: contents;
		}
		
		#btnBuy, #btnCart  {
			font-size: 1.5rem;
		}
		/* 
		.row {
		    display: block;
		}
		 */
		
		/* 
		body {
		    font-size: 20px;
		}
		
		.btn {
		    font-size: 1.5rem;
		}
		 */
		.carousel-control {    
			font-size: 1.5rem;
			opacity: 0;
		}
		/* 
		BODY {
		    MARGIN: revert;
		}
		 */
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
		
		.reviewContent2{
		 	border: 1px none #ccc;
		}
		
	</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/template/nav.jspf"%>
	<%@ include file="/WEB-INF/views/template/header.jspf"%>
	
	<div class="row">
		<div class="col-xs-12 col-sm-6 col-md-6 shop-item"> <!-- Carousel 시작 -->
			<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">				
				<div class="carousel-inner">
					<c:if test="${imageList.size() == 0 }">
						<div class="carousel-item active">
							<img src="${productImage }/no-image.jpg" class="d-block w-100"
								alt="상품이미지 없음" />
						</div>
					</c:if>
					<c:forEach items="${imageList }" var="image" varStatus="status">
						<!-- 등록된 이미지들을 나열 -->
						<c:if test="${status.index == 0}">
							<div class="carousel-item active">
								<img src="${productImage }/${image.imageURL}"
									class="d-block w-100" alt="상품이미지" />
							</div>
						</c:if>
						<c:if test="${status.index != 0}">
							<div class="carousel-item">
								<img src="${productImage }/${image.imageURL}"
									class="d-block w-100" alt="상품이미지" />
							</div>
						</c:if>
					</c:forEach>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev"> 
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div> <!-- Carousel 끝 -->
		<div class="col-xs-12 col-sm-5 col-sm-offset-1 col-md-5 col-md-offset-1 shop-info"> <!-- 상품 정보 시작 -->
			<div class="shop-info-section shop-title">
				<h2>${shop.shopTitle }</h2>
			</div> <!--  title end -->
			<div class="shop-info-section shop-price">
				<fmt:formatNumber value="${shop.shopPrice }" pattern="#,###"></fmt:formatNumber>원
			</div> <!-- price end -->
			<div class="shop-info-section first-option"> <!-- 대표 이미지 + 첫번째 옵션 나열 -->
				<div>${productList[0].firstOptionGroupName }</div>
				<div>
					<c:forEach items="${productList }" var="product">
						<span>
							<c:choose>
								<c:when test="${product.productCode eq productCode }">
									<a class="first-option-now" title="${product.firstOptionName }" 
									href="${root }/shop/${shop.mainCategoryName }/${shop.subCategoryName }/${shop.shopCode}/${product.productCode }">
								</c:when>
								<c:otherwise>
									<a title="${product.firstOptionName }"
									href="${root }/shop/${shop.mainCategoryName }/${shop.subCategoryName }/${shop.shopCode}/${product.productCode }">
								</c:otherwise>
							</c:choose>
							<c:if test="${not titleImageMap.containsKey(product.productCode) }"> <!-- 등록된 대표 이미지가 없을 때 --> 
								<img src="${noImage }" style="width: 100px; height: 100px;" />
							</c:if> <!-- 등록된 대표 이미지가 있을 때 --> 
							<c:if test="${titleImageMap.containsKey(product.productCode) }">
								<img src="${productImage }/${titleImageMap[product.productCode].imageURL }" style="width: 100px; height: 100px;" />
							</c:if> 
							</a>
						</span>
					</c:forEach>
				</div>
			</div> <!-- 대표 이미지 + 첫번째 옵션 나열 끝 -->
			<form id="orderItemForm">
				<div class="shop-info-section second-option"> <!-- 선택된 product의 두번째 옵션 출력 -->
					<input type="text" id="productCode" name="productCode" value="${productCode }" hidden="true">
					<div>${optionList[0].optionGroupName }</div> <!-- 등록된 옵션(주로 사이즈)들을 나열 -->
					<div class="radio-toolbar">
						<c:forEach items="${optionList }" var="option" varStatus="status">
							<input type="radio" id="itemOption${status.count }" name="secondOptionCode" value="${option.optionCode }">
							<label for="itemOption${status.count }" style="cursor: pointer"><span>${option.optionName }</span></label>
						</c:forEach>
					</div>
					<script type="text/javascript">
						document.querySelector('.radio-toolbar label').click();
					</script>
				</div> <!-- 선택된 product의 두번째 옵션 출력 끝 -->
				<div class="shop-info-section quantity"> <!-- 수량 선택 -->
					<div>Quantity</div>
					<div class="input-group">
						<span class="input-group-btn">
							<button type="button" class="quantity-left-minus btn btn-default">
								<span class="glyphicon glyphicon-minus"></span>
							</button>
						</span> 
						<input type="number" id="quantity" name="quantity"
							class="form-control input-number" value="1" min="1" max="100"
							readonly="readonly"
							style="background-color: white; cursor: not-allowed"> 
						<span class="input-group-btn">
							<button type="button" class="quantity-right-plus btn btn-default">
								<span class="glyphicon glyphicon-plus"></span>
							</button>
						</span>
					</div>
				</div> <!-- 수량 선택 끝 -->
			</form>
			<div>
				<button id="btnBuy" class="btn btn-default">구매하기</button>
				<button id="btnCart" class="btn btn-default">장바구니에 담기</button>
			</div>
		</div> <!-- 상품 정보 끝 -->
	</div> <!-- row 끝 -->
	<script type="text/javascript">
		var orderItemForm = document.querySelector('#orderItemForm');
		function buyNow() {
			orderItemForm.action = '${root}/order';
			console.log(orderItemForm.action);
			orderItemForm.method = 'POST';
			console.log(orderItemForm.method);
			orderItemForm.submit();
		}
		document.querySelector('#btnBuy').addEventListener('click', function() {
			buyNow();
		});								
		document.querySelector('#btnCart').addEventListener('click', function() {
			console.log('works');
			var productCode = document.querySelector('#productCode').value;
			var secondOptionCode = document.querySelector('input[name="secondOptionCode"]:checked').value;
			var quantity = document.querySelector('#quantity').value;
			$.ajax({
				url:'/backpackers/order/cart',
				method:'POST',
				data: JSON.stringify({ 'productCode': productCode, 'secondOptionCode': secondOptionCode, 'quantity': quantity}),
				//data: { 'productCode': 'test', 'optionCode': 'test', 'quantity': 'test'},
				contentType:'application/json; charset=utf-8',
				dataType:'text',
			  	beforeSend: function(xhr) {
			    	xhr.setRequestHeader("ajax-need-login", "true");
			  	},
				success:function(data){
					var firstOption = document.querySelector('.first-option-now').title;
					var secondOption = document.querySelector('input[name="secondOptionCode"]:checked').nextElementSibling.innerText;
					document.querySelector('.shop-message').innerText = '장바구니에 ${shop.shopTitle }(' 
							+ firstOption + ', ' + secondOption + ') 상품 ' + quantity + '개를 담았습니다!';
					$('#shopModal').modal('show');
					//$('.test-modal').modal('show');
				},
				error: function(e) {
					if(e.status == 400) {
						location.href = '${root}/user/login'
					}
				}
			});
		});
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
		$('.carousel').carousel({interval : 2000, pause : false});
	</script>
	<!-- content -->
	<div class="row">
		<div class="col-sm-12 shop-content">
			<h4>상품 소개</h4>
			 <hr class="my-4">
		</div>
		
		<div class="col-sm-12 shop-content">
			<h4>${shop.shopContent }</h4>
		</div>
	</div>	
	<!-- content -->
	<script type="text/javascript">
		$(document).ready(function() {
			$("#review_btn").click(function() {
				var reviewContent = $('#reviewContent').val();
				var shopCode = "${shop.shopCode}";
				var params = "reviewContent=" + reviewContent + "&shopCode=" + shopCode;
				$.ajax({
					url : "${root}/shop/insertReview",
					method : 'POST',
					data : {
						reviewContent : reviewContent,
						shopCode : "${shop.shopCode}"
					},
					success : function(data) {
						alert(data);
					},
					error : function(error) {
						alert("입력 실패");
					}
				});
			});
		});
	</script>
	<!-- review -->
	
	<div class="row">
		<div class="col-sm-12">
			<div class="shop-content"></div>
			<div class="shop-content"></div>
			<div id="review">
				<c:if test="${sessionScope.username == null }">
					<p>한줄평을 남기시려면 <a href="/backpackers/user/login">로그인</a>해주세요</p>
				</c:if>
				<c:if test="${sessionScope.username != null }">
					<section class="reviewForm">
						<form role="form" method="post">
							<%--  <input type="hidden" name="shopCode" id="shopCode" value="${shop.shopCode}" >  --%>
							<textarea name="reviewContent" id="reviewContent"></textarea>
		
							<button type="submit" id="review_btn">한줄평 남기기</button>
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
									<form method="post" action="${root }/shop/${review.reviewNo}/update">
								<tr id="review_tr1">
										<td>${review.userId}</td>
										<td>
											<input type="text" value="${review.reviewContent}" class="reviewContent2" name="reviewContent">
										</td>
										<td>${review.reviewDate}</td>
										<td>
											<c:if test="${sessionScope.username == review.userId }">
											<input type="hidden" name="_method" value="put">
											<input type="text" name="location" value="${requestScope['javax.servlet.forward.servlet_path']}" hidden="true"/>
											<button name="reviewNo" value="${review.reviewNo }" type="submit" 
											id="review_upd_btn" class="btn btn-primary">수정하기</button>
											</c:if>
										</td>
									</form>
										<td>
											<form method="post" action="${root }/shop/${review.reviewNo }/delete">
												<input type="text" name="location" value="${requestScope['javax.servlet.forward.servlet_path']}" hidden="true"/>
												<input type="hidden" name="_method" value="delete">
												<c:if test="${sessionScope.username == review.userId }">
												<button name="reviewNo" value="${review.reviewNo }" type="submit" 
												id="review_del_btn" class="btn btn-danger">삭제하기</button>
												</c:if>
											</form>
										</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</section>
			</div> <!-- <div id="review"> 끝-->
		</div> <!-- <div class="col-sm-12"> 끝 -->
	</div> <!-- <div class="row"> 끝 -->
	<%@ include file="/WEB-INF/views/template/footer.jspf"%>
	<!-- 쇼핑 모달 -->
	<div id="shopModal" class="modal" tabindex="-1" role="dialog">
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