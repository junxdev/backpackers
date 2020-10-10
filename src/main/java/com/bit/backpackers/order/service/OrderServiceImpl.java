package com.bit.backpackers.order.service;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.backpackers.item.model.entity.ItemVo;
import com.bit.backpackers.order.OrderedItem;
import com.bit.backpackers.order.Order;
import com.bit.backpackers.order.OrderStatus;
import com.bit.backpackers.order.model.OrderDao;
import com.bit.backpackers.order.model.OrderedItemDao;
import com.bit.backpackers.order.model.entity.OrderItemVo;
import com.bit.backpackers.order.model.entity.OrderVo;

@Service
public class OrderServiceImpl implements OrderService {

	@Inject
	SqlSession sqlSession;
	OrderedItem item;
	
	@Override
	public String createOrder() throws SQLException {
		String orderCode = new Order().makeOrderCode();
		sqlSession.getMapper(OrderDao.class).insertOrder(orderCode);
		return orderCode;
	}
	
	@Override
	public void putItemIntoOrder(OrderItemVo item) throws SQLException {
		String orderCode = createOrder();
	}
	
	@Override
	public void putOrder(String itemCode, int quantity) throws SQLException {
		String orderCode = createOrder();
		for(int i = 0; i < quantity; i++) {
			sqlSession.getMapper(OrderDao.class).insertOrderItem(orderCode, itemCode);
		}
	}
	
	@Override
	public void getItemsByOrderCode(Model model) throws SQLException {
		OrderVo order = sqlSession.getMapper(OrderDao.class).selectOrdersFilteredBy(OrderStatus.CHECKING);
		List<ItemVo> orderedItemList = sqlSession.getMapper(OrderedItemDao.class).selectOrderedItemsFilteredBy(order.getOrderCode());
		model.addAttribute("orderedItemList", orderedItemList);
	}
}
