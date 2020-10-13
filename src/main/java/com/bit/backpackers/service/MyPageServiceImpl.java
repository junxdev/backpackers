package com.bit.backpackers.service;

import java.sql.SQLException;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.bit.backpackers.model.MyPageDao;
import com.bit.backpackers.model.entity.MyPageVo;

public class MyPageServiceImpl implements MyPageService {
	@Inject
	SqlSession sqlSession;

	@Override
	public void accountDetailService(Model model, String userId) throws SQLException {
		MyPageDao dao = sqlSession.getMapper(MyPageDao.class);
		model.addAttribute("bean", dao.selectOne(userId));
	}

	@Override
	public void accountEditService(MyPageVo bean) throws SQLException {
		MyPageDao dao = sqlSession.getMapper(MyPageDao.class);
		dao.updateOne(bean);
	}

	@Override
	public void accountDeleteService(String userId) throws SQLException {
		MyPageDao dao = sqlSession.getMapper(MyPageDao.class);
		dao.deleteOne(userId);
	}

}
