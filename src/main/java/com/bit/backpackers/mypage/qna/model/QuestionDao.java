package com.bit.backpackers.mypage.qna.model;

import java.sql.SQLException;
import java.util.List;

import com.bit.backpackers.mypage.qna.model.entity.QuestionVo;

public interface QuestionDao {
	// 문의글 목록
	List<QuestionVo> listAll() throws SQLException;
	// 문의글 작성
	void create(QuestionVo bean) throws SQLException;
	// 문의글 내용 보기
	QuestionVo read(int question_no) throws SQLException;
	// 문의글 삭제
	void delete(int question_no) throws SQLException;
}
