package com.bit.backpackers.shop.model;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;



import com.bit.backpackers.category.model.entity.CategoryVo;
import com.bit.backpackers.item.model.entity.ItemVo;


import com.bit.backpackers.shop.model.entity.ShopVo;

public interface ShopDao {

	List<ShopVo> selectShopList() throws SQLException;
	List<ShopVo> selectShopList(@Param("mainCategoryName") String mainCategoryName) throws SQLException;
	List<ShopVo> selectShopList(@Param("mainCategoryName") String mainCategoryName, @Param("subCategoryName") String subCategoryName) throws SQLException;
	ShopVo selectShop(String shopCode) throws SQLException;
	ShopVo selectShopByProductCode(String productCode) throws SQLException;
	
}
