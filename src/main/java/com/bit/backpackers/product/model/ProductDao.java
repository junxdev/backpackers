package com.bit.backpackers.product.model;

import java.sql.SQLException;

import com.bit.backpackers.image.model.entity.ImageVo;

public interface ProductDao {

	public ImageVo selectTitleImageFilteredBy(String productCode) throws SQLException;
	public ImageVo selectImageFilteredBy(String productCode) throws SQLException;
}
