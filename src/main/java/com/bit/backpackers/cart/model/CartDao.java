package com.bit.backpackers.cart.model;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bit.backpackers.cart.model.entity.CartProductVo;
import com.bit.backpackers.product.model.entity.ProductVo;

import java.sql.SQLException;

public interface CartDao {
	
	void insertItem(@Param("productCode") String productCode, @Param("optionCode") String optionCode) throws SQLException;
	int removeItem(String productCode, String optionCode) throws SQLException;
	List<CartProductVo> selectCart() throws SQLException;

}
