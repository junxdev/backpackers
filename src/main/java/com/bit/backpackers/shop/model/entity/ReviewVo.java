package com.bit.backpackers.shop.model.entity;

import java.sql.Date;

public class ReviewVo {
	private int itemNo;
	private String userId;
	private int reviewNo;
	private String reviewContent;
	private Date reviewDate;

	public ReviewVo() {
	}

	public int getItemNo() {
		return itemNo;
	}

	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + itemNo;
		result = prime * result + ((reviewContent == null) ? 0 : reviewContent.hashCode());
		result = prime * result + ((reviewDate == null) ? 0 : reviewDate.hashCode());
		result = prime * result + reviewNo;
		result = prime * result + ((userId == null) ? 0 : userId.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ReviewVo other = (ReviewVo) obj;
		if (itemNo != other.itemNo)
			return false;
		if (reviewContent == null) {
			if (other.reviewContent != null)
				return false;
		} else if (!reviewContent.equals(other.reviewContent))
			return false;
		if (reviewDate == null) {
			if (other.reviewDate != null)
				return false;
		} else if (!reviewDate.equals(other.reviewDate))
			return false;
		if (reviewNo != other.reviewNo)
			return false;
		if (userId == null) {
			if (other.userId != null)
				return false;
		} else if (!userId.equals(other.userId))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "ReviewVo [itemNo=" + itemNo + ", userId=" + userId + ", reviewNo=" + reviewNo + ", reviewContent="
				+ reviewContent + ", reviewDate=" + reviewDate + "]";
	}

	public ReviewVo(int itemNo, String userId, int reviewNo, String reviewContent, Date reviewDate) {
		super();
		this.itemNo = itemNo;
		this.userId = userId;
		this.reviewNo = reviewNo;
		this.reviewContent = reviewContent;
		this.reviewDate = reviewDate;
	}

}
