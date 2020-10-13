package com.bit.backpackers.model.entity;

import java.sql.Date;

public class ItemReviewVo {
	private int review_no;
	private int item_no;
	private String review_title;
	private String review_content;
	private int member_no;
	private Date review_datetime;
	private String review_ip;
	
	public ItemReviewVo() {
	}
	
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public int getItem_no() {
		return item_no;
	}
	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public Date getReview_datetime() {
		return review_datetime;
	}
	public void setReview_datetime(Date review_datetime) {
		this.review_datetime = review_datetime;
	}
	public String getReview_ip() {
		return review_ip;
	}
	public void setReview_ip(String review_ip) {
		this.review_ip = review_ip;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + item_no;
		result = prime * result + member_no;
		result = prime * result + ((review_content == null) ? 0 : review_content.hashCode());
		result = prime * result + ((review_datetime == null) ? 0 : review_datetime.hashCode());
		result = prime * result + ((review_ip == null) ? 0 : review_ip.hashCode());
		result = prime * result + review_no;
		result = prime * result + ((review_title == null) ? 0 : review_title.hashCode());
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
		ItemReviewVo other = (ItemReviewVo) obj;
		if (item_no != other.item_no)
			return false;
		if (member_no != other.member_no)
			return false;
		if (review_content == null) {
			if (other.review_content != null)
				return false;
		} else if (!review_content.equals(other.review_content))
			return false;
		if (review_datetime == null) {
			if (other.review_datetime != null)
				return false;
		} else if (!review_datetime.equals(other.review_datetime))
			return false;
		if (review_ip == null) {
			if (other.review_ip != null)
				return false;
		} else if (!review_ip.equals(other.review_ip))
			return false;
		if (review_no != other.review_no)
			return false;
		if (review_title == null) {
			if (other.review_title != null)
				return false;
		} else if (!review_title.equals(other.review_title))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "ItemReviewVO [review_no=" + review_no + ", item_no=" + item_no + ", review_title=" + review_title
				+ ", review_content=" + review_content + ", member_no=" + member_no + ", review_datetime="
				+ review_datetime + ", review_ip=" + review_ip + "]";
	}

	public ItemReviewVo(int review_no, int item_no, String review_title, String review_content, int member_no,
			Date review_datetime, String review_ip) {
		super();
		this.review_no = review_no;
		this.item_no = item_no;
		this.review_title = review_title;
		this.review_content = review_content;
		this.member_no = member_no;
		this.review_datetime = review_datetime;
		this.review_ip = review_ip;
	}
	
}
