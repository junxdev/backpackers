package com.bit.backpackers.mypage.account.service;

import java.sql.SQLException;

import org.springframework.ui.Model;

import com.bit.backpackers.mypage.account.model.entity.AccountVo;

public interface AccountService {
	
//	void DetailService(Model model, String userId) throws SQLException;
	
	void EditService(AccountVo bean) throws SQLException;
	
	void DeleteService(AccountVo bean) throws SQLException;
	
//	int CheckPw(AccountVo bean) throws SQLException;
}
