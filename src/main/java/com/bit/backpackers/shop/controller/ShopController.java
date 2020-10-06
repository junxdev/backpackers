package com.bit.backpackers.shop.controller;

import java.sql.SQLException;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.backpackers.category.service.CategoryService;
import com.bit.backpackers.shop.service.ShopService;

@Controller
@RequestMapping("/shop")
public class ShopController {

	@Inject
	ShopService shopService;
	
	@Inject
	CategoryService categoryService;
	
	@RequestMapping("")
	public String list(Model model) throws SQLException {
		shopService.getShoplist(model);
		categoryService.getCategoryList(model);
		return "shop/list";
	}
	
	@RequestMapping("/{mainCategoryName}")
	public String list(@PathVariable String mainCategoryName, Model model) throws SQLException {
		shopService.getShoplist(model, mainCategoryName);
		categoryService.getCategoryList(model);
		return "shop/list";
	}
	
	@RequestMapping("/{mainCategoryName}/{subCategoryName}")
	public String list(@PathVariable("mainCategoryName") String mainCategoryName, 
			@PathVariable("subCategoryName") String subCategoryName, Model model) throws SQLException {
		shopService.getShoplist(model, mainCategoryName, subCategoryName);
		categoryService.getCategoryList(model);
		return "shop/list";
	}
	
	@RequestMapping("/{mainCategory}/{subCategory}/{shopCode}")
	public String detail(@PathVariable("shoptCode") String shopCode, Model model) throws SQLException {
		shopService.getShop(model, shopCode);
		return "shop/detail";
	}
}
