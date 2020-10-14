package com.bit.backpackers.mypage.qna.model;

import java.util.List;

import com.bit.backpackers.mypage.qna.model.entity.AnswerVo;

public interface AnswerDao {
	// 관리자 답변 목록
	List<AnswerVo> list(int questionNo);
	// 답변 작성
	void create(AnswerVo bean);
	// 답변 삭제
	void delete(int answerNo);
}
