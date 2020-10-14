package com.bit.backpackers.category.service;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.backpackers.category.model.CategoryDao;
import com.bit.backpackers.category.model.entity.CategoryVo;
import com.bit.backpackers.shop.model.ShopDao;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public void getCategoryList(Model model) throws SQLException {
		List<CategoryVo> list = sqlSession.getMapper(CategoryDao.class).selectCategoryList();
		model.addAttribute("categoryList", list);
	}
	
}