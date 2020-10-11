package com.bit.backpackers.shop.test;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bit.backpackers.category.model.CategoryDao;
import com.bit.backpackers.category.model.entity.CategoryVo;
import com.bit.backpackers.item.model.entity.ItemVo;
import com.bit.backpackers.order.model.OrderedProductDao;
import com.bit.backpackers.shop.model.ShopDao;
import com.bit.backpackers.shop.model.entity.ShopVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/applicationContext.xml")
public class ShopTest {

	@Inject
	SqlSession sqlSession;
	
	@Test
	public void catMap() throws SQLException {
		CategoryDao dao = sqlSession.getMapper(CategoryDao.class);
		List<CategoryVo> list = dao.selectCategoryList();
//		System.out.println(list.size());
		for(CategoryVo bean : list) {
			System.out.println(bean.toString());
		}
	}
	
	@Test
	public void shopCategory() throws SQLException {
		ShopDao shop = sqlSession.getMapper(ShopDao.class);
		List<ShopVo> shopList = shop.selectShopList();
//		CategoryDao cat = sqlSession.getMapper(CategoryDao.class);
//		List<CategoryVo> catList = cat.selectCategoryList();
		
		for(ShopVo shopVo : shopList) {
			System.out.println(shopVo);
		}
	}
	
	@Test
	public void callItemList() throws SQLException {
		OrderedProductDao dao = sqlSession.getMapper(OrderedProductDao.class);
		List<ItemVo> list = dao.selectOrderedItems();
		System.out.println(list.get(0));
	}
	
	@Test
	public void callShopArticleList() throws SQLException {
		ShopDao dao = sqlSession.getMapper(ShopDao.class);
		List<ShopVo> list = dao.selectShopList();
		System.out.println(list.get(0));
	}
	
	@Test
	public void callShopArticle() throws SQLException {
		ShopDao dao = sqlSession.getMapper(ShopDao.class);
		System.out.println(dao.selectShop("20200930AA001"));
	}
	
	@Test
	public void string() {
		String a = null;
		String b = a;
		a= "hi";
		System.out.println(b);
		Map<String, String> map = new HashMap<String, String>();
		map.put("abc", "abcd");
		map.put("abc", "dcba");
		System.out.println(map.get("abc"));
	}
}
