package com.bit.backpackers.admin.shop.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.backpackers.admin.shop.model.ShopAdminDao;
import com.bit.backpackers.admin.shop.model.entity.ShopVo;
import com.bit.backpackers.category.Category;
import com.bit.backpackers.image.model.entity.ImageVo;
import com.bit.backpackers.item.Item;
import com.bit.backpackers.option.Option;
import com.bit.backpackers.product.Product;
import com.bit.backpackers.product.model.ProductDao;
import com.bit.backpackers.product.model.entity.NewProductItemVo;
import com.bit.backpackers.product.model.entity.NewProductVo;
import com.bit.backpackers.shop.model.ShopDao;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class ShopAdminServiceImpl implements ShopAdminService {

	@Inject
	SqlSession sqlSession;
	@Inject
	Category categorySupport;
	@Inject
	Option optionSupport;
	@Inject
	Product productSupport;
	@Inject
	Item itemSupport;
	
	@Override
	public void getShopList(Model model) throws SQLException {
		List<ShopVo> shopList = sqlSession.getMapper(ShopAdminDao.class).selectAll();
		model.addAttribute("shopList", shopList);
		model.addAttribute("mainCategoryMap", categorySupport.getMainCategoryMap());
		model.addAttribute("subCategoryMap", categorySupport.getSubCategoryMap());
	}
	
	@Override
	public void getShop(Model model, String shopCode) throws SQLException {
		ShopVo shop = sqlSession.getMapper(ShopAdminDao.class).selectOne(shopCode);
		model.addAttribute("shop", shop);
		model.addAttribute("mainCategoryMap", categorySupport.getMainCategoryMap());
		model.addAttribute("subCategoryMap", categorySupport.getSubCategoryByMainCategoryMap());
		model.addAttribute("productList", sqlSession.getMapper(ProductDao.class).selectProductByShopCode(shopCode));
		model.addAttribute("productItemMap", productSupport.getProductItemMapByShopCode(shopCode));
		model.addAttribute("optionGroupList", optionSupport.getOptionGroupList());
		model.addAttribute("optionMap", optionSupport.getOptionByOptionGroupMap());
	}
	
	@Override
	public void getShopForm(Model model) throws SQLException {
		model.addAttribute("mainCategoryMap", categorySupport.getMainCategoryMap());
		model.addAttribute("subCategoryMap", categorySupport.getSubCategoryByMainCategoryMap());
		model.addAttribute("optionGroupList", optionSupport.getOptionGroupList());
		model.addAttribute("optionMap", optionSupport.getOptionByOptionGroupMap());
	}
	
	@Override
	public String getItem(String itemCode) throws SQLException {
		return itemSupport.getItemJson();
	}
	
	@Override
	public String createShop(String jsonShop) throws SQLException, ParseException, JsonParseException, JsonMappingException, IOException {
		JSONParser parser = new JSONParser();
		ObjectMapper mapper = new ObjectMapper();
		JSONObject tempObj = null;
		
		JSONObject obj = (JSONObject) parser.parse(jsonShop);
		
		// 판매글 정보 추출 및 저장
		tempObj = (JSONObject) obj.get("shop");
		ShopVo shop = mapper.readValue(tempObj.toJSONString(), ShopVo.class);
		sqlSession.getMapper(ShopDao.class).insertShop(shop);
		
		// 판매글에서 판매할 상품 목록 추출 및 저장
		JSONArray tempList = (JSONArray) obj.get("productList");
		List<NewProductVo> productList = new ArrayList<NewProductVo>();
		for(int i = 0; i < tempList.size(); i++) {
			tempObj = (JSONObject) tempList.get(i);
			NewProductVo product = mapper.readValue(tempObj.toJSONString(), NewProductVo.class);
			productList.add(product);
		}
		sqlSession.getMapper(ProductDao.class).insertProducts(productList);
		
		// 각 상품에서 옵션별로 연결된 아이템 추출 및 저장
		tempList = (JSONArray) obj.get("itemList");
		List<NewProductItemVo> itemList = new ArrayList<NewProductItemVo>();
		for(int i = 0; i < tempList.size(); i++) {
			tempObj = (JSONObject) tempList.get(i);
			NewProductItemVo item = mapper.readValue(tempObj.toJSONString(), NewProductItemVo.class);
			itemList.add(item);
		}
		sqlSession.getMapper(ProductDao.class).insertProductItems(itemList);
		
		// 각 상품별 이미지 추출 및 저장
		tempList = (JSONArray) obj.get("imgURLList");
		List<ImageVo> imgList = new ArrayList<ImageVo>();
		for(int i = 0; i < tempList.size(); i++) {
			tempObj = (JSONObject) tempList.get(i);
			ImageVo image = mapper.readValue(tempObj.toJSONString(), ImageVo.class);
			imgList.add(image);
		}
		sqlSession.getMapper(ProductDao.class).insertProductImages(imgList);
		
		return shop.getShopCode() + "/" + productList.get(0).getProductCode();
	}
	
	@Override
	public int updateShop(ShopVo shop) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public int deleteShop(String shopCode) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
