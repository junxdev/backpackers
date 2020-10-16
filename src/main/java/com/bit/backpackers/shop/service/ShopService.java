package com.bit.backpackers.shop.service;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.backpackers.shop.model.entity.ReviewVo;
import com.bit.backpackers.shop.model.entity.ShopVo;

public interface ShopService {

	public void getShoplist(Model model) throws SQLException;
	public void getShoplist(Model model, String mainCategoryName) throws SQLException;
	public void getShoplist(Model model, String mainCategoryName, String subCategoryName) throws SQLException;
	public void getShop(Model model, String shopCode, String productCode) throws SQLException;
	// 상품 리뷰 작성
	public void registReview(ReviewVo bean) throws Exception;
	// 상품 리뷰 목록
	public List<ReviewVo> reviewList(int itemNo) throws Exception;
}
