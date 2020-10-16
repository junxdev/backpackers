package com.bit.backpackers.shop.controller;

import java.sql.SQLException;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

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
		return "redirect:/shop/clothing/tops";
	}
	
	@RequestMapping("/{mainCategoryName}")
	public String list(@PathVariable String mainCategoryName, Model model) throws SQLException {
		try {
			categoryService.checkCategory(mainCategoryName);
		} catch (NullPointerException e) {
			return "redirect:/shop/clothing/tops";
		}
		categoryService.getCategoryList(model);
		shopService.getShoplist(model, mainCategoryName);
		return "shop/list";
	}
	
	@RequestMapping("/{mainCategoryName}/{subCategoryName}")
	public String list(@PathVariable String mainCategoryName, 
			@PathVariable String subCategoryName, Model model) throws SQLException {
		try {
			categoryService.checkCategory(mainCategoryName, subCategoryName);
		} catch (NullPointerException e) {
			return "redirect:/shop/clothing/tops";
		}
		categoryService.getCategoryList(model);
		shopService.getShoplist(model, mainCategoryName, subCategoryName);
		return "shop/list";
	}
	
	@RequestMapping("/{mainCategoryName}/{subCategoryName}/{shopCode}/{productCode}")
	public String detail(@PathVariable String mainCategoryName, @PathVariable String subCategoryName, 
			@PathVariable String shopCode, @PathVariable String productCode, Model model) throws SQLException {
		try {
			categoryService.checkCategory(mainCategoryName, subCategoryName);
		} catch (NullPointerException e) {
			return "redirect:/shop/clothing/tops";
		}
		shopService.getShop(model, shopCode, productCode);
		return "shop/detail";
	}
}