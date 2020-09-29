package com.bit.backpackers.shop.model;

import java.sql.SQLException;
import java.util.List;

import com.bit.backpackers.DeptVo;
import com.bit.backpackers.shop.model.entity.ItemVo;
import com.bit.backpackers.shop.model.entity.ShopArticleVo;

public interface ShopArticleDao {

	List<ShopArticleVo> selectAll() throws SQLException;
	ShopArticleVo selectOne(String shopArticleCode) throws SQLException;
	
}
