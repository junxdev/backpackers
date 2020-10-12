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
	public void putOrder(String productCode, String optionCode, int quantity) throws SQLException {
		String orderCode = createOrder();
		for(int i = 0; i < quantity; i++) {
			sqlSession.getMapper(OrderDao.class).insertOrderItem(orderCode, productCode, optionCode);
		}
	}
	
	@Override
	public void getOrderDetailByOrderCode(Model model) throws SQLException {
		OrderVo order = sqlSession.getMapper(OrderDao.class).selectOrdersFilteredBy(OrderStatus.CHECKING);
		List<OrderedProductVo> orderedProductList = sqlSession.getMapper(OrderedProductDao.class).selectProductsFilteredBy(order.getOrderCode());
		List<ImageVo> orderedProductImageList = new ArrayList<ImageVo>();
		List<ShopVo> orderedProductShopList = new ArrayList<ShopVo>();
		for(OrderedProductVo product : orderedProductList) {
			log.info(product.getProductCode());
			orderedProductImageList.add(productSupport.getTitleImage(product.getProductCode()));
			orderedProductShopList.add(shopSupport.getShopFilteredBy(product.getProductCode()));
			product = orderSupport.findOption(product);
		}
		model.addAttribute("order", order);
		model.addAttribute("productList", orderedProductList);
		model.addAttribute("imageList", orderedProductImageList);
		model.addAttribute("shopList", orderedProductShopList);
	}
	
	@Override
	public int setOrderStatus(OrderVo order, OrderStatus status) {
		order.setOrderStatus(status);
		return sqlSession.getMapper(OrderDao.class).updateOrder(order);
	}
}
