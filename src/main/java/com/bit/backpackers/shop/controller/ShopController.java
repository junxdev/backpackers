package com.bit.backpackers.shop.controller;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;
<<<<<<< HEAD
import javax.servlet.http.HttpSession;
=======
import javax.servlet.http.HttpServletRequest;
>>>>>>> origin/master

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.backpackers.category.service.CategoryService;
import com.bit.backpackers.member.model.entity.MemberVo;
import com.bit.backpackers.shop.model.entity.ReviewVo;
import com.bit.backpackers.shop.service.ShopService;

@Controller
@RequestMapping("/shop")
public class ShopController {
	private static final Logger logger = LoggerFactory.getLogger(ShopController.class);

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
	
<<<<<<< HEAD
	@RequestMapping("/{mainCategory}/{subCategory}/{shopCode}/{productCode}")
	public String detail(@PathVariable String shopCode, @PathVariable String productCode, Model model) throws Exception {
=======
	@RequestMapping("/{mainCategoryName}/{subCategoryName}/{shopCode}/{productCode}")
	public String detail(@PathVariable String mainCategoryName, @PathVariable String subCategoryName, 
			@PathVariable String shopCode, @PathVariable String productCode, Model model) throws SQLException {
		try {
			categoryService.checkCategory(mainCategoryName, subCategoryName);
		} catch (NullPointerException e) {
			return "redirect:/shop/clothing/tops";
		}
>>>>>>> origin/master
		shopService.getShop(model, shopCode, productCode);
		List<ReviewVo> review = shopService.reviewList(shopCode);
		model.addAttribute("review", review);
		return "shop/detail";
	}
	
	// 리뷰 작성
	@RequestMapping(value = "/{mainCategory}/{subCategory}/{shopCode}/{productCode}", method = RequestMethod.POST)
	public String registReview(ReviewVo review, HttpSession session) throws Exception{
		// @PathVariable String shopCode, @PathVariable String productCode... 넣어야하나
		logger.info("regist Review");
		
		// member 세션에 저장된 유저 아이디 가져오기
		MemberVo user = (MemberVo)session.getAttribute("user");
		review.setUserId(user.getUserId());
		
		shopService.registReview(review);
		
		return "redirect:/shop/" + review.getItemNo();
	}
	

}
