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
						<div class="receipt-form"><!-- 주문상품내역 -->
							<table class="table">
								<thead>
									<tr>
										<th>상품</th>
										<th>가격</th>
										<th>수량</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td></td>
									</tr>
								</tbody>
							</table>
						</div><!-- 주문상품내역 end -->
						<div class="pricetag"><!-- 총 결제 금액 -->
							<span>총 결제 금액 : ${order.orderAmount }</span>
						</div><!-- 총 결제 금액 end -->
						<div class="delivery-info"><!-- 배송 정보 -->
							<span>배송 정보 작업 중 : 회원 api 필요</span>
						</div><!-- 배송 정보 end -->
						<div class="purchase-form"><!-- 버튼 -->
							<a href="${root }/shop" class="btn btn-default" role="btn">다른 상품 쇼핑하기</a>
						</div><!-- 버튼 end -->
					</div><!-- content end -->
				</div><!-- col end -->
			</div><!-- row end -->
		</section>
		<!-- Content ends -->
	<%@ include file="/WEB-INF/views/template/footer.jspf" %>
</body>
</html>