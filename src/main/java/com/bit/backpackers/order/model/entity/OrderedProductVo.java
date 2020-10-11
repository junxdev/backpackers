package com.bit.backpackers.order.model.entity;

import com.bit.backpackers.item.model.entity.ItemVo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class OrderedProductVo {
	
	private String shopCode, productCode;
	private String firstOptionGroupCode, firstOptionGroupName, firstOptionCode, firstOptionName;
	private String secondOptionGroupCode, secondOptionGroupName, secondOptionCode, secondOptionName;
	private int quantity;
	
}
