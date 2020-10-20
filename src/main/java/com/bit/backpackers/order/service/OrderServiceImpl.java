package com.bit.backpackers.order.service;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.backpackers.cart.model.entity.CartProductVo;
import com.bit.backpackers.member.model.entity.MemberVo;
import com.bit.backpackers.order.Order;
import com.bit.backpackers.order.OrderStatus;
import com.bit.backpackers.order.model.OrderDao;
import com.bit.backpackers.order.model.OrderedProductDao;
import com.bit.backpackers.order.model.entity.OrderedProductVo;
import com.bit.backpackers.order.model.entity.OrderVo;
import com.bit.backpackers.product.Product;
import com.bit.backpackers.product.model.entity.ProductVo;
import com.bit.backpackers.shop.Shop;

@Service
public class OrderServiceImpl implements OrderService {
	
	Logger log = LoggerFactory.getLogger(OrderServiceImpl.class);

	@Inject
	SqlSession sqlSession;
	@Inject
	Product productSupport;
	@Inject
	Shop shopSupport;
	@Inject
	Order orderSupport;
	
	@Override
	public String orderThisNow(OrderedProductVo product, MemberVo user) throws SQLException {
		orderSupport.checkAnyOrder(user);
		
		String orderCode = orderSupport.createOrderCode();
		orderSupport.createOrder(orderCode, user);
		
		for(int i = 0; i < product.getQuantity(); i++) {
			sqlSession.getMapper(OrderDao.class).insertOrderItem(orderCode, product.getProductCode(), product.getSecondOptionCode());
		}
		return orderCode;
	}
	
	@Override
	public String orderCart(List<CartProductVo> cart, MemberVo user) throws SQLException {
		orderSupport.checkAnyOrder(user);
		
		String orderCode = orderSupport.createOrderCode();
		orderSupport.createOrder(orderCode, user);
		
		for(CartProductVo product : cart) {
			System.out.println("*****************" + cart.toString());
			for(int i = 0; i < product.getQuantity(); i++) {
				sqlSession.getMapper(OrderDao.class).insertOrderItem(orderCode, product.getProductCode(), product.getSecondOptionCode());
			}
		}
		return orderCode;
	}
	
	// CHECKING 중인 order 확인
	@Override
	public void getOrderDetail(Model model, MemberVo user) throws SQLException {
		OrderVo order = sqlSession.getMapper(OrderDao.class).selectOrdersFilteredBy(OrderStatus.CHECKING, user.getUserId());
		List<OrderedProductVo> orderedProductList = sqlSession.getMapper(OrderedProductDao.class).selectProductsFilteredBy(order.getOrderCode());
		orderSupport.nameOptionForProducts(orderedProductList);
		model.addAttribute("order", order);
		model.addAttribute("productList", orderedProductList);
		model.addAttribute("imageList", productSupport.getTitleImageList(orderedProductList));
		model.addAttribute("shopList", productSupport.getShopList(orderedProductList));
	}
	
	// orderCode로 order 확인
	@Override
	public List<OrderedProductVo> getOrderDetailByOrderCode(Model model, String orderCode) throws SQLException, NullPointerException {
		OrderVo order = sqlSession.getMapper(OrderDao.class).selectOrder(orderCode);
		List<OrderedProductVo> orderedProductList = sqlSession.getMapper(OrderedProductDao.class).selectProductsFilteredBy(orderCode);
		orderSupport.nameOptionForProducts(orderedProductList);
		model.addAttribute("order", order);
		model.addAttribute("productList", orderedProductList);
		model.addAttribute("imageList", productSupport.getTitleImageList(orderedProductList));
		model.addAttribute("shopList", productSupport.getShopList(orderedProductList));
		return orderedProductList;
	}
	
	@Override
	public int changeOrderStatus(OrderVo order, OrderStatus status) {
		order.setOrderStatus(status);
		return sqlSession.getMapper(OrderDao.class).updateOrder(order);
	}
	
}
