package com.bit.backpackers.mypage.qna.model.entity;

import java.security.Timestamp;

public class QuestionVo {
	private int item_no; // tbl_item(상품 정보)하고 조인
	private int question_no;
	private String member_id;
	private String question_title;
	private String question_content;
	private Timestamp question_date;

	public QuestionVo() {
	}

	public int getitemNo() {
		return item_no;
	}

	public void setitemNo(int item_no) {
		this.item_no = item_no;
	}

	public String getMemberId() {
		return member_id;
	}

	public void setMemberId(String member_id) {
		this.member_id = member_id;
	}

	public String getQuestionTitle() {
		return question_title;
	}

	public void setQuestionTitle(String question_title) {
		this.question_title = question_title;
	}

	public String getQuestionContent() {
		return question_content;
	}

	public void setQuestionContent(String question_content) {
		this.question_content = question_content;
	}

	public Timestamp getQuestionDate() {
		return question_date;
	}

	public void setQuestionDate(Timestamp question_date) {
		this.question_date = question_date;
	}

	public int getQuestionNo() {
		return question_no;
	}

	public void setQuestionNo(int question_no) {
		this.question_no = question_no;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((member_id == null) ? 0 : member_id.hashCode());
		result = prime * result + item_no;
		result = prime * result + ((question_content == null) ? 0 : question_content.hashCode());
		result = prime * result + ((question_date == null) ? 0 : question_date.hashCode());
		result = prime * result + question_no;
		result = prime * result + ((question_title == null) ? 0 : question_title.hashCode());
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
		QuestionVo other = (QuestionVo) obj;
		if (member_id == null) {
			if (other.member_id != null)
				return false;
		} else if (!member_id.equals(other.member_id))
			return false;
		if (item_no != other.item_no)
			return false;
		if (question_content == null) {
			if (other.question_content != null)
				return false;
		} else if (!question_content.equals(other.question_content))
			return false;
		if (question_date == null) {
			if (other.question_date != null)
				return false;
		} else if (!question_date.equals(other.question_date))
			return false;
		if (question_no != other.question_no)
			return false;
		if (question_title == null) {
			if (other.question_title != null)
				return false;
		} else if (!question_title.equals(other.question_title))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "QnaVo [item_no=" + item_no + ", question_no=" + question_no + ", member_id=" + member_id + ", question_title="
				+ question_title + ", question_content=" + question_content + ", replyContent=" + ", question_date="
				+ question_date + "]";
	}

	public QuestionVo(int item_no, int question_no, String member_id, String question_title, String question_content,
			Timestamp question_date) {
		super();
		this.item_no = item_no;
		this.question_no = question_no;
		this.member_id = member_id;
		this.question_title = question_title;
		this.question_content = question_content;
		this.question_date = question_date;
	}
}
