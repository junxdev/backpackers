package com.bit.backpackers.shop.service;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.backpackers.shop.model.entity.ShopArticleVo;

public interface ShopArticleService {

	public void list(Model model) throws SQLException;
	public void detail(Model model, String shopArticleCode) throws SQLException;
	
}
