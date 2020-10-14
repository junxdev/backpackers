package com.bit.backpackers.mypage.qna.model.entity;

import java.security.Timestamp;

public class AnswerVo {
	private int itemNo;
	private int questionNo;
	private int answerNo;
	private String adminId;
	private String answerContent;
	private Timestamp answerDate;

	public AnswerVo() {
	}
	public int getItemNo() {
		return itemNo;
	}
	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}
	public int getQuestionNo() {
		return questionNo;
	}
	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}
	public int getAnswerNo() {
		return answerNo;
	}
	public void setAnswerNo(int answerNo) {
		this.answerNo = answerNo;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getAnswerContent() {
		return answerContent;
	}
	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}
	public Timestamp getAnswerDate() {
		return answerDate;
	}
	public void setAnswerDate(Timestamp answerDate) {
		this.answerDate = answerDate;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((adminId == null) ? 0 : adminId.hashCode());
		result = prime * result + ((answerContent == null) ? 0 : answerContent.hashCode());
		result = prime * result + ((answerDate == null) ? 0 : answerDate.hashCode());
		result = prime * result + answerNo;
		result = prime * result + itemNo;
		result = prime * result + questionNo;
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
		AnswerVo other = (AnswerVo) obj;
		if (adminId == null) {
			if (other.adminId != null)
				return false;
		} else if (!adminId.equals(other.adminId))
			return false;
		if (answerContent == null) {
			if (other.answerContent != null)
				return false;
		} else if (!answerContent.equals(other.answerContent))
			return false;
		if (answerDate == null) {
			if (other.answerDate != null)
				return false;
		} else if (!answerDate.equals(other.answerDate))
			return false;
		if (answerNo != other.answerNo)
			return false;
		if (itemNo != other.itemNo)
			return false;
		if (questionNo != other.questionNo)
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "AnswerVo [itemNo=" + itemNo + ", questionNo=" + questionNo + ", answerNo=" + answerNo + ", adminId="
				+ adminId + ", answerContent=" + answerContent + ", answerDate=" + answerDate + "]";
	}
	public AnswerVo(int itemNo, int questionNo, int answerNo, String adminId, String answerContent, Timestamp answerDate) {
		super();
		this.itemNo = itemNo;
		this.questionNo = questionNo;
		this.answerNo = answerNo;
		this.adminId = adminId;
		this.answerContent = answerContent;
		this.answerDate = answerDate;
	}
}