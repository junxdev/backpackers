package com.bit.backpackers.order.controller;

import java.sql.SQLException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bit.backpackers.cart.model.entity.CartProductVo;
import com.bit.backpackers.cart.service.CartService;
import com.bit.backpackers.order.OrderStatus;
import com.bit.backpackers.order.model.entity.OrderVo;
import com.bit.backpackers.order.model.entity.OrderedProductVo;
import com.bit.backpackers.order.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Inject
	OrderService orderService;
	@Inject
	CartService cartService;
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public String createOrder(OrderedProductVo product) throws SQLException {
//		log.info(productCode + quantity);
		orderService.putOrder(product);
		return "redirect:/order/checkout";
	}
	
	@RequestMapping(value = "/checkout")
	public String checkout(Model model, String orderCode) throws SQLException {
		orderService.getOrderDetail(model);
		return "order/checkout";
	}
	
	@RequestMapping(value = "/checkout", method = RequestMethod.POST)
	public String checkout(@ModelAttribute OrderVo order, RedirectAttributes redirectAttributes) throws SQLException {
		orderService.changeOrderStatus(order, OrderStatus.ORDERED);
		orderService.changeOrderStatus(order, OrderStatus.PAYED);
		redirectAttributes.addFlashAttribute("order", order);
		return "redirect:/order/receipt";
	}
	
	@RequestMapping(value = "/receipt")
	public String receipt(Model model) throws SQLException {
		OrderVo order = null;
		try {
			order = (OrderVo) model.asMap().get("order");
			orderService.getOrderDetailByOrderCode(model, order.getOrderCode());
		} catch (NullPointerException e) {
			return "redirect:/";
		}
		return "order/receipt";
	}
	
	@RequestMapping("/cart")
	public String showCart(Model model, HttpSession session) throws SQLException {
		String memberId = (String) session.getAttribute("username");
		cartService.getCartByMemberId(model, memberId);
		return "order/cart";
	}
	
	@RequestMapping(value = "/cart", method = RequestMethod.POST)
	@ResponseBody
	public String putItemIntoCart(@RequestBody CartProductVo bean) throws SQLException {
//		log.info(bean.getProductCode());
		cartService.putItemIntoCart(bean);
		return bean.toString();
//	public String putItemIntoCart(HttpServletRequest req) throws SQLException { 
//		String x = req.getParameter("productCode");
//		return x;
	}
	
}
