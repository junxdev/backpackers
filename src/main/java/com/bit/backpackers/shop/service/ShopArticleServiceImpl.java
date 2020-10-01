package com.bit.backpackers.shop.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.backpackers.shop.model.ShopArticleDao;
import com.bit.backpackers.shop.model.entity.ItemVo;
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
		ShopArticleDao dao = sqlSession.getMapper(ShopArticleDao.class);
		ShopArticleVo bean = dao.selectOne(shopArticleCode);
		model.addAttribute("bean", bean);
		
		List<ItemVo> itemList = dao.selectItemByShopArticleCode(shopArticleCode);
		Map<String, Map<String, String>> itemMap = new HashMap<String, Map<String, String>>();
		Map<String, String> optionMap = new HashMap<String, String>();
		for(ItemVo item : itemList) {
			String firstOption = null;
			String beforeFirstOption = firstOption;
			String secondOption = null;
			String itemCode = null;
			try {
				firstOption = item.getFirstOptionCode();
				secondOption = item.getSecondOptionCode();
				itemCode = item.getItemCode();
			} catch (NullPointerException e) {
				continue;
			}
			if(itemMap.get(firstOption) == null) {
				optionMap.put(secondOption, shopArticleCode);
				itemMap.put(firstOption, optionMap);
			} else {
				optionMap = itemMap.get(firstOption);
				optionMap.put(secondOption, shopArticleCode);
				itemMap.put(firstOption, optionMap);
			}
		}
		model.addAttribute("itemMap", itemMap);
	}

}
