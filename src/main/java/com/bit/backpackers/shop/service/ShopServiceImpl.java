package com.bit.backpackers.shop.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.backpackers.category.model.entity.CategoryVo;
import com.bit.backpackers.shop.model.ShopDao;
import com.bit.backpackers.shop.model.entity.ItemVo;
import com.bit.backpackers.shop.model.entity.ShopVo;

@Service
public class ShopServiceImpl implements ShopService {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public void getShoplist(Model model) throws SQLException {
		List<ShopVo> list = sqlSession.getMapper(ShopDao.class).selectShopList();
		model.addAttribute("shopList", list);
	}
	
	@Override
	public void getShoplist(Model model, String mainCategoryName) throws SQLException {
		List<ShopVo> list = sqlSession.getMapper(ShopDao.class).selectShopList(mainCategoryName);
		model.addAttribute("shopList", list);
	}
	
	@Override
	public void getShoplist(Model model, String mainCategoryName, String subCategoryName) throws SQLException {
		List<ShopVo> list = sqlSession.getMapper(ShopDao.class).selectShopList(mainCategoryName, subCategoryName);
		model.addAttribute("shopList", list);
	}
	
	@Override
	public void getShop(Model model, String shopCode, String productCode) throws SQLException {
		ShopDao dao = sqlSession.getMapper(ShopDao.class);
		ShopVo shop = dao.selectShop(shopCode);
		model.addAttribute("shop", shop);
		model.addAttribute("productCode", productCode);
		/*
		 * List<ItemVo> itemList = dao.selectItemByShopArticleCode(shopCode);
		 * Map<String, Map<String, String>> itemMap = new HashMap<String, Map<String,
		 * String>>(); Map<String, String> optionMap = new HashMap<String, String>();
		 * for(ItemVo item : itemList) { String firstOption = null; String
		 * beforeFirstOption = firstOption; String secondOption = null; String itemCode
		 * = null; try { firstOption = item.getFirstOptionCode(); secondOption =
		 * item.getSecondOptionCode(); itemCode = item.getItemCode(); } catch
		 * (NullPointerException e) { continue; } if(itemMap.get(firstOption) == null) {
		 * optionMap.put(secondOption, shopCode); itemMap.put(firstOption, optionMap); }
		 * else { optionMap = itemMap.get(firstOption); optionMap.put(secondOption,
		 * shopCode); itemMap.put(firstOption, optionMap); } }
		 * model.addAttribute("itemMap", itemMap);
		 */
	}

}
