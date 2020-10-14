package com.bit.backpackers.order.service;

import java.sql.SQLException;

import org.springframework.ui.Model;

import com.bit.backpackers.order.OrderStatus;
import com.bit.backpackers.order.model.entity.OrderVo;
import com.bit.backpackers.order.model.entity.OrderedProductVo;

public interface OrderService {
	
	String createOrder() throws SQLException;
	String putOrder(OrderedProductVo product) throws SQLException;
	void getOrderDetail(Model model) throws SQLException;
	void getOrderDetailByOrderCode(Model model, String orderCode) throws SQLException;
	int changeOrderStatus(OrderVo order, OrderStatus status) throws SQLException;

}
