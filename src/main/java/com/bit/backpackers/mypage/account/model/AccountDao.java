package com.bit.backpackers.mypage.account.model;

import java.sql.SQLException;

import com.bit.backpackers.mypage.account.model.entity.AccountVo;

public interface AccountDao {
//	AccountVo selectOne(String userId) throws SQLException;
	void updateOne(AccountVo bean) throws SQLException;
	void deleteOne(AccountVo bean) throws SQLException;
//	int checkPw(AccountVo bean) throws SQLException;
}
