package com.bit.backpackers.mypage.account.service;

import java.sql.SQLException;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.backpackers.mypage.account.model.AccountDao;
import com.bit.backpackers.mypage.account.model.entity.AccountVo;

@Service
public class AccountServiceImpl implements AccountService {
	@Inject
	SqlSession sqlSession;

//	@Override
//	public void DetailService(Model model, String userId) throws SQLException {
//		AccountDao dao = sqlSession.getMapper(AccountDao.class);
//		model.addAttribute("bean", dao.selectOne(userId));
//	}

	// Controller에서 보내는 파라미터들을 EditService(AccountVo bean)로 받고
	@Override
	public void EditService(AccountVo bean) throws SQLException {
		AccountDao dao = sqlSession.getMapper(AccountDao.class);
		// 받은 bean을 Dao로 보내준다
		dao.updateOne(bean);
	}

	@Override
	public void DeleteService(AccountVo bean) throws SQLException {
		AccountDao dao = sqlSession.getMapper(AccountDao.class);
		dao.deleteOne(bean);
	}

//	@Override
//	public int CheckPw(AccountVo bean) throws SQLException {
//		AccountDao dao = sqlSession.getMapper(AccountDao.class);
//		int result = dao.checkPw(bean);
//		return result;
//	}

}
