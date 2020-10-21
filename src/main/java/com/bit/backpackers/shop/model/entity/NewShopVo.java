package com.bit.backpackers.shop.model.entity;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class NewShopVo {

	private int shopId;
	private String shopCode, shopTitle, mainCategoryCode, subCategoryCode;
	private Timestamp shopDate;
	private String shopContent;
	private int shopPrice;
	
	public NewShopVo(String shopCode, String shopTitle, String mainCategoryCode, String subCategoryCode,
			String shopContent, int shopPrice) {
		super();
		this.shopCode = shopCode;
		this.shopTitle = shopTitle;
		this.mainCategoryCode = mainCategoryCode;
		this.subCategoryCode = subCategoryCode;
		this.shopContent = shopContent;
		this.shopPrice = shopPrice;
	}
	
}
