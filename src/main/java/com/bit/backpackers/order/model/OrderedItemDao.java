package com.bit.backpackers.order.model;

import java.sql.SQLException;
import java.util.List;

import com.bit.backpackers.DeptVo;
import com.bit.backpackers.item.model.entity.ItemVo;

public interface OrderedItemDao {

	List<ItemVo> selectOrderedItems() throws SQLException;
	List<ItemVo> selectOrderedItemsFilteredBy(String OrderCode) throws SQLException;
	
}
