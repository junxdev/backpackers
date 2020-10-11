package com.bit.backpackers.option.model;

import com.bit.backpackers.option.model.entity.OptionVo;

public interface OptionDao {
	
	public OptionVo selectOptionFilteredBy(String optionCode);

}
