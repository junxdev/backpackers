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
	
	@Test
	public void selectItemByShopArticleCode() throws SQLException {
		ShopArticleDao dao = sqlSession.getMapper(ShopArticleDao.class);
		for(ItemVo bean : dao.selectItemByShopArticleCode("20200930AA001")) {
			System.out.println(bean.toString());
		}
	}
	
	@Test
	public void selectOptions() throws SQLException {
		ShopArticleDao dao = sqlSession.getMapper(ShopArticleDao.class);
		List<ItemVo> itemList = dao.selectItemByShopArticleCode("20200930AA002");
		Map<String, Map<String, String>> itemMap = new HashMap<String, Map<String, String>>();
		Map<String, String> optionMap = new HashMap<String, String>();
		for(ItemVo item : itemList) {
			String firstOption = null;
			String secondOption = null;
			String itemCode = null;
			try {
				firstOption = item.getFirstOptionCode();
				secondOption = item.getSecondOptionCode();
				itemCode = item.getItemCode();
			} catch (NullPointerException e) {
				continue;
			}
			System.out.println(firstOption + ", " + secondOption + ", " + itemCode);
			if(itemMap.get(firstOption) == null) {
				optionMap.put(secondOption, itemCode);
				itemMap.put(firstOption, optionMap);
			} else {
				optionMap = itemMap.get(firstOption);
				optionMap.put(secondOption, itemCode);
				itemMap.put(firstOption, optionMap);
			}
//			System.out.println(itemMap.get("A01"));
		}
		Set<Entry<String, Map<String, String>>> entrySet = itemMap.entrySet();
		Iterator<Entry<String, Map<String, String>>> ite = entrySet.iterator();
		while(ite.hasNext()) {
			Map<String, String> map2 = ite.next().getValue();
			Set<Entry<String, String>> entrySet2 = map2.entrySet();
			Iterator<Entry<String, String>> ite2 = entrySet2.iterator();
			while(ite2.hasNext()) {
				Entry<String, String> entry = ite2.next();
				System.out.println(entry.getKey() + ", " + entry.getValue());
			}
		}
		Map<String, String> x;
		if((x = itemMap.get("A01")) != null) {
			String y;
			if( (y= x.get("C02")) != null) {
				System.out.println("Choice : " + y);
			}
		}
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
