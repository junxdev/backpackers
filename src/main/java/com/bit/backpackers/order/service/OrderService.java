package com.bit.backpackers.order.service;

import java.sql.SQLException;

import org.springframework.ui.Model;

import com.bit.backpackers.order.OrderStatus;
import com.bit.backpackers.order.model.entity.OrderItemVo;

public interface OrderService {
	
	String createOrder() throws SQLException;
	void putItemIntoOrder(OrderItemVo item) throws SQLException;
	void putOrder(String itemCode, int quantity) throws SQLException;
	void getItemsByOrderCode(Model model) throws SQLException; 

}
