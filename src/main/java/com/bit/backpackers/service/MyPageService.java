package com.bit.backpackers.service;

import java.sql.SQLException;

import org.springframework.ui.Model;

import com.bit.backpackers.model.entity.MyPageVo;

public interface MyPageService {
	
	void accountDetailService(Model model, String userId) throws SQLException;
	
	void accountEditService(MyPageVo bean) throws SQLException;
	
	void accountDeleteService(String userId) throws SQLException;
	
}
