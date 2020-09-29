package com.bit.backpackers.shop.test;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bit.backpackers.shop.model.ItemDao;
import com.bit.backpackers.shop.model.ShopArticleDao;
import com.bit.backpackers.shop.model.entity.ItemVo;
import com.bit.backpackers.shop.model.entity.ShopArticleVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/applicationContext.xml")
public class ShopTest {

	@Inject
	SqlSession sqlSession;
	
	@Test
	public void callItemList() throws SQLException {
		ItemDao dao = sqlSession.getMapper(ItemDao.class);
		List<ItemVo> list = dao.selectAll();
		System.out.println(list.get(0));
	}
	
	@Test
	public void callShopArticleList() throws SQLException {
		ShopArticleDao dao = sqlSession.getMapper(ShopArticleDao.class);
		List<ShopArticleVo> list = dao.selectAll();
		System.out.println(list.get(0));
	}
	
	@Test
	public void callShopArticle() throws SQLException {
		ShopArticleDao dao = sqlSession.getMapper(ShopArticleDao.class);
		System.out.println(dao.selectOne("20200930AA001"));
	}
}
