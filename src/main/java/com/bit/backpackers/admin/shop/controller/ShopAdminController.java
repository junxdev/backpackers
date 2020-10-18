package com.bit.backpackers.admin.shop.controller;

import java.sql.SQLException;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.backpackers.admin.shop.service.ShopAdminService;

@Controller
@RequestMapping("/admin/shop")
public class ShopAdminController {
	
	@Inject
	ShopAdminService shopAdminService;

	@RequestMapping("")
	public String listShop(Model model) throws SQLException {
		shopAdminService.getShopList(model);
		return "admin/shop/list";
	}
	
	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String formShop(Model model) {
		return "admin/shop/list";
	}
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public String addShop() {
		return "redirect:./";
	}

	@RequestMapping(value = "/{shopCode}")
	public String shopDetail(Model model, @PathVariable String shopCode) throws SQLException {
		shopAdminService.getShop(model, shopCode);
		return "admin/shop/detail";
	}

	@RequestMapping(value = "/{shopCode}", method = RequestMethod.PUT)
	public String shopEdit() {
		return "redirect:.";
	}
	
	@RequestMapping(value = "/{shopCode}", method = RequestMethod.DELETE)
	public String shopDelete(@PathVariable String shopCode) {
		return "redirect:..";
	}
}
