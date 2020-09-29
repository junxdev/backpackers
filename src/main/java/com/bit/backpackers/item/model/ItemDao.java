package com.bit.backpackers.item.model;

import java.sql.SQLException;
import java.util.List;

import com.bit.backpackers.DeptVo;
import com.bit.backpackers.item.model.entity.ItemVo;

public interface ItemDao {

	List<ItemVo> selectAll() throws SQLException;
}
