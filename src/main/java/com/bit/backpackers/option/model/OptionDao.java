package com.bit.backpackers.option.model;

import java.util.List;

import com.bit.backpackers.option.model.entity.OptionVo;
import com.bit.backpackers.product.model.entity.ProductVo;

public interface OptionDao {
	
	public OptionVo selectOptionFilteredBy(String optionCode);
	public List<OptionVo> selectOptionsByProduct(String productCode);

}
