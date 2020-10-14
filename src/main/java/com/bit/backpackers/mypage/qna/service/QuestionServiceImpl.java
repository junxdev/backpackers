package com.bit.backpackers.mypage.qna.service;

import java.sql.SQLException;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.backpackers.mypage.qna.model.QuestionDao;
import com.bit.backpackers.mypage.qna.model.entity.QuestionVo;

@Service
public class QuestionServiceImpl implements QuestionService {
	@Inject
	SqlSession sqlSession;
	
	@Override
	public void listService(Model model) throws SQLException {
		QuestionDao dao = sqlSession.getMapper(QuestionDao.class);
		System.out.println(dao);
		model.addAttribute("list", dao.listAll());
	}

	@Override
	public void createService(QuestionVo bean) throws SQLException {
		QuestionDao dao = sqlSession.getMapper(QuestionDao.class);
		dao.create(bean);
		
	}

	@Override
	public void read(Model model, int question_no) throws SQLException {
		QuestionDao dao = sqlSession.getMapper(QuestionDao.class);
		model.addAttribute("bean", dao.read(question_no));
	}

	@Override
	public void deleteService(int question_no) throws SQLException {
		QuestionDao dao = sqlSession.getMapper(QuestionDao.class);
		dao.delete(question_no);
	}

}
