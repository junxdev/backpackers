package com.bit.backpackers.shop.model.entity;

public class ItemVo {

	private int itemId;
	private String itemCode, itemName;
	private int price;
	private String mainCategoryCode, subCategoryCode, brandCode, firstOptionCode, secondOptionCode;
	
	public ItemVo() {
	}

	public ItemVo(int itemId, String itemCode, String itemName, int price, String mainCategoryCode,
			String subCategoryCode, String brandCode, String firstOptionCode, String secondOptionCode) {
		super();
		this.itemId = itemId;
		this.itemCode = itemCode;
		this.itemName = itemName;
		this.price = price;
		this.mainCategoryCode = mainCategoryCode;
		this.subCategoryCode = subCategoryCode;
		this.brandCode = brandCode;
		this.firstOptionCode = firstOptionCode;
		this.secondOptionCode = secondOptionCode;
	}

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public String getItemCode() {
		return itemCode;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getMainCategoryCode() {
		return mainCategoryCode;
	}

	public void setMainCategoryCode(String mainCategoryCode) {
		this.mainCategoryCode = mainCategoryCode;
	}

	public String getSubCategoryCode() {
		return subCategoryCode;
	}

	public void setSubCategoryCode(String subCategoryCode) {
		this.subCategoryCode = subCategoryCode;
	}

	public String getBrandCode() {
		return brandCode;
	}

	public void setBrandCode(String brandCode) {
		this.brandCode = brandCode;
	}

	public String getFirstOptionCode() {
		return firstOptionCode;
	}

	public void setFirstOptionCode(String firstOptionCode) {
		this.firstOptionCode = firstOptionCode;
	}

	public String getSecondOptionCode() {
		return secondOptionCode;
	}

	public void setSecondOptionCode(String secondOptionCode) {
		this.secondOptionCode = secondOptionCode;
	}

	@Override
	public String toString() {
		return "ItemVo [itemId=" + itemId + ", itemCode=" + itemCode + ", itemName=" + itemName + ", price=" + price
				+ ", mainCategoryCode=" + mainCategoryCode + ", subCategoryCode=" + subCategoryCode + ", brandCode="
				+ brandCode + ", firstOptionCode=" + firstOptionCode + ", secondOptionCode=" + secondOptionCode + "]";
	}
	
}
