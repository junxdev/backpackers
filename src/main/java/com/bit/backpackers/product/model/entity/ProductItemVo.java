package com.bit.backpackers.product.model.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class ProductItemVo {

	private String productCode, itemCode, optionGroupCode, optionGroupName, optionCode, optionName;

	public ProductItemVo(String productCode, String itemCode, String optionGroupCode, String optionCode) {
		super();
		this.productCode = productCode;
		this.itemCode = itemCode;
		this.optionGroupCode = optionGroupCode;
		this.optionCode = optionCode;
	}
	
}
