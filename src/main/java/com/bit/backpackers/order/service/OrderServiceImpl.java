package com.bit.backpackers.order.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.backpackers.image.model.entity.ImageVo;
import com.bit.backpackers.item.model.entity.ItemVo;
import com.bit.backpackers.order.OrderedItem;
import com.bit.backpackers.order.Order;
import com.bit.backpackers.order.OrderStatus;
import com.bit.backpackers.order.model.OrderDao;
import com.bit.backpackers.order.model.OrderedProductDao;
import com.bit.backpackers.order.model.entity.OrderedProductVo;
import com.bit.backpackers.order.model.entity.OrderVo;
import com.bit.backpackers.product.Product;
import com.bit.backpackers.product.model.entity.ProductVo;
import com.bit.backpackers.shop.Shop;
import com.bit.backpackers.shop.model.entity.ShopVo;

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
	public String createOrder() throws SQLException {
		String orderCode = new Order().makeOrderCode();
		sqlSession.getMapper(OrderDao.class).insertOrder(orderCode);
		return orderCode;
	}
	
	@Override
	public String putOrder(OrderedProductVo product) throws SQLException {
		orderSupport.checkAnyOrder();
		String orderCode = createOrder();
		for(int i = 0; i < product.getQuantity(); i++) {
			sqlSession.getMapper(OrderDao.class).insertOrderItem(orderCode, product.getProductCode(), product.getSecondOptionCode());
		}
		return orderCode;
	}
	
	// CHECKING 중인 order 조회
	@Override
	public void getOrderDetail(Model model) throws SQLException {
		OrderVo order = sqlSession.getMapper(OrderDao.class).selectOrdersFilteredBy(OrderStatus.CHECKING);
		List<OrderedProductVo> orderedProductList = sqlSession.getMapper(OrderedProductDao.class).selectProductsFilteredBy(order.getOrderCode());
		for(OrderedProductVo product : orderedProductList) {
			product = (OrderedProductVo) orderSupport.nameOption(product);
		}
		model.addAttribute("order", order);
		model.addAttribute("productList", orderedProductList);
		model.addAttribute("imageList", productSupport.getTitleImageList(orderedProductList));
		model.addAttribute("shopList", productSupport.getShopList(orderedProductList));
	}
	
	// orderCode로 order 조회
	@Override
	public void getOrderDetailByOrderCode(Model model, String orderCode) throws SQLException {
		OrderVo order = sqlSession.getMapper(OrderDao.class).selectOrder(orderCode);
		List<OrderedProductVo> orderedProductList = sqlSession.getMapper(OrderedProductDao.class).selectProductsFilteredBy(orderCode);
		for(OrderedProductVo product : orderedProductList) {
			product = (OrderedProductVo) orderSupport.nameOption(product);
		}
		model.addAttribute("order", order);
		model.addAttribute("productList", orderedProductList);
		model.addAttribute("imageList", productSupport.getTitleImageList(orderedProductList));
		model.addAttribute("shopList", productSupport.getShopList(orderedProductList));
	}
	
	@Override
	public int changeOrderStatus(OrderVo order, OrderStatus status) {
		order.setOrderStatus(status);
		return sqlSession.getMapper(OrderDao.class).updateOrder(order);
	}
	
}
