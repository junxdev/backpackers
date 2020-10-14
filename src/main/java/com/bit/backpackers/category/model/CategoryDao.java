package com.bit.backpackers.category.model;

import java.sql.SQLException;
import java.util.List;

import com.bit.backpackers.category.model.entity.CategoryVo;

public interface CategoryDao {

	List<CategoryVo> selectCategoryList() throws SQLException;
	
}
