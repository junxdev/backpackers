package com.bit.backpackers.order.service;

import java.sql.SQLException;

import org.springframework.ui.Model;

import com.bit.backpackers.order.OrderStatus;
import com.bit.backpackers.order.model.entity.OrderedProductVo;

public interface OrderService {
	
	String createOrder() throws SQLException;
	void putOrder(String productCode, String optionCode, int quantity) throws SQLException;
	void getOrderDetailByOrderCode(Model model) throws SQLException; 

}
