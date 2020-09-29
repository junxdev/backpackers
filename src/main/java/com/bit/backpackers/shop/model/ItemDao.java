package com.bit.backpackers.shop.model;

import java.sql.SQLException;
import java.util.List;

import com.bit.backpackers.DeptVo;
import com.bit.backpackers.shop.model.entity.ItemVo;

public interface ItemDao {

	List<ItemVo> selectAll() throws SQLException;
}
