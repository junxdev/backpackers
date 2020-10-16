package com.bit.backpackers.shop.model;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bit.backpackers.shop.model.entity.ReviewVo;
import com.bit.backpackers.shop.model.entity.ShopVo;

public interface ShopDao {

	List<ShopVo> selectShopList() throws SQLException;
	List<ShopVo> selectShopList(@Param("mainCategoryName") String mainCategoryName) throws SQLException;
	List<ShopVo> selectShopList(@Param("mainCategoryName") String mainCategoryName, @Param("subCategoryName") String subCategoryName) throws SQLException;
	ShopVo selectShop(String shopCode) throws SQLException;
	ShopVo selectShopByProductCode(String productCode) throws SQLException;
	// 상품 리뷰 작성
	void registReview(ReviewVo bean) throws Exception;
	// 상품 리뷰 목록
	List<ReviewVo> reviewList(int itemNo) throws Exception;
}
