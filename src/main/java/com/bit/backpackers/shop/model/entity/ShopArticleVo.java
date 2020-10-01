package com.bit.backpackers.shop.model.entity;

import java.sql.Date;
import java.util.List;

public class ShopArticleVo {

	private int shopArticleId;
	private String shopArticleCode, shopArticleTitle, memberId, subCategoryCode;
	private Date shopArticleDate;
	private String shopArticleContent;
	private int shopArticlePrice;
	private List<ItemVo> itemList;

	public ShopArticleVo() {
	}
	
	public ShopArticleVo(int shopArticleId, String shopArticleCode, String shopArticleTitle, String memberId,
			String subCategoryCode, Date shopArticleDate, String shopArticleContent, int shopArticlePrice) {
		super();
		this.shopArticleId = shopArticleId;
		this.shopArticleCode = shopArticleCode;
		this.shopArticleTitle = shopArticleTitle;
		this.memberId = memberId;
		this.subCategoryCode = subCategoryCode;
		this.shopArticleDate = shopArticleDate;
		this.shopArticleContent = shopArticleContent;
		this.shopArticlePrice = shopArticlePrice;
	}

	public int getShopArticleId() {
		return shopArticleId;
	}

	public void setShopArticleId(int shopArticleId) {
		this.shopArticleId = shopArticleId;
	}

	public String getShopArticleCode() {
		return shopArticleCode;
	}

	public void setShopArticleCode(String shopArticleCode) {
		this.shopArticleCode = shopArticleCode;
	}

	public String getShopArticleTitle() {
		return shopArticleTitle;
	}

	public void setShopArticleTitle(String shopArticleTitle) {
		this.shopArticleTitle = shopArticleTitle;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getSubCategoryCode() {
		return subCategoryCode;
	}

	public void setSubCategoryCode(String subCategoryCode) {
		this.subCategoryCode = subCategoryCode;
	}

	public Date getShopArticleDate() {
		return shopArticleDate;
	}

	public void setShopArticleDate(Date shopArticleDate) {
		this.shopArticleDate = shopArticleDate;
	}

	public String getShopArticleContent() {
		return shopArticleContent;
	}

	public void setShopArticleContent(String shopArticleContent) {
		this.shopArticleContent = shopArticleContent;
	}

	public int getShopArticlePrice() {
		return shopArticlePrice;
	}

	public void setShopArticlePrice(int shopArticlePrice) {
		this.shopArticlePrice = shopArticlePrice;
	}

	@Override
	public String toString() {
		return "ShopArticleVo [shopArticleId=" + shopArticleId + ", shopArticleCode=" + shopArticleCode
				+ ", shopArticleTitle=" + shopArticleTitle + ", memberId=" + memberId + ", subCategoryCode="
				+ subCategoryCode + ", shopArticleDate=" + shopArticleDate + ", shopArticleContent="
				+ shopArticleContent + ", shopArticlePrice=" + shopArticlePrice + "]";
	}

}
