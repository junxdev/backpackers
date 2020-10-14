package com.bit.backpackers.mypage.qna.service;

import java.sql.SQLException;

import org.springframework.ui.Model;

import com.bit.backpackers.mypage.qna.model.entity.QuestionVo;

public interface QuestionService {
	void listService(Model model) throws SQLException;
	void createService(QuestionVo bean) throws SQLException;
	void read(Model model, int question_no) throws SQLException;
	void deleteService(int question_no) throws SQLException;
}
