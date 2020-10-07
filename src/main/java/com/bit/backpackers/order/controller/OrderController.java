package com.bit.backpackers.order.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.backpackers.order.model.entity.OrderItemVo;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/checkout")
	public String checkout(Model model) {
		return "order/detail";
	}
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	@ResponseBody
	public String createOrder(@RequestBody OrderItemVo bean) {
		log.info("*****************" + bean.toString());
		return "success";
	}

}
