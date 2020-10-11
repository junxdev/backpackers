package com.bit.backpackers.order.controller;

import java.sql.SQLException;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.backpackers.order.OrderStatus;
import com.bit.backpackers.order.model.entity.OrderedProductVo;
import com.bit.backpackers.order.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Inject
	OrderService orderService;
	
	@RequestMapping(value = "/checkout")
	public String checkout(Model model) throws SQLException {
		orderService.getOrderDetailByOrderCode(model);
		return "order/checkout";
	}
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public String createOrder(String productCode, String optionCode, int quantity) throws SQLException {
		log.info(productCode + quantity);
		orderService.putOrder(productCode, optionCode, quantity);
		return "redirect:/order/checkout";
	}
	
}
