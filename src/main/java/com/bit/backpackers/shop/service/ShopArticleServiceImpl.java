package com.bit.backpackers.shop.service;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.backpackers.shop.model.ShopArticleDao;
import com.bit.backpackers.shop.model.entity.ShopArticleVo;

@Service
public class ShopArticleServiceImpl implements ShopArticleService {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public void list(Model model) throws SQLException {
		List<ShopArticleVo> list = sqlSession.getMapper(ShopArticleDao.class).selectAll();
		model.addAttribute("shopArticleList", list);
	}

	@Override
	public void detail(Model model, String shopArticleCode) throws SQLException {
		ShopArticleVo bean = sqlSession.getMapper(ShopArticleDao.class).selectOne(shopArticleCode);
		model.addAttribute("bean", bean);
	}

}
