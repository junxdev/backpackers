package com.bit.backpackers.shop.controller;

import java.sql.SQLException;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.backpackers.shop.service.ShopArticleService;

@Controller
@RequestMapping("/shop")
public class ShopArticleController {

	@Inject
	ShopArticleService service;
	
	@RequestMapping("")
	public String list(Model model) throws SQLException {
		service.list(model);
		return "shop/list";
	}
	
	@RequestMapping("/{shopArticleCode}")
	public String detail(Model model, @PathVariable String shopArticleCode) throws SQLException {
		service.detail(model, shopArticleCode);
		return "shop/detail";
	}
}
