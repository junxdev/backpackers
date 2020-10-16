package com.bit.backpackers.shop.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.backpackers.image.model.entity.ImageVo;
import com.bit.backpackers.option.model.entity.OptionVo;
import com.bit.backpackers.order.Order;
import com.bit.backpackers.product.Product;
import com.bit.backpackers.product.model.ProductDao;
import com.bit.backpackers.product.model.entity.ProductVo;
import com.bit.backpackers.shop.model.ShopDao;
import com.bit.backpackers.shop.model.entity.ReviewVo;
import com.bit.backpackers.shop.model.entity.ShopVo;

@Service
public class ShopServiceImpl implements ShopService {
	
	
	@Inject
	SqlSession sqlSession;
	@Inject
	Product productSupport;
	@Inject
	Order orderSupport;
	@Inject
	private ShopDao dao;
	
	@Override
	public void getShoplist(Model model) throws SQLException {
		List<ShopVo> shopList = sqlSession.getMapper(ShopDao.class).selectShopList();
		Map<String, List<ProductVo>> productMap = new HashMap<String, List<ProductVo>>();
		Map<String, ImageVo> imageMap = new HashMap<String, ImageVo>();
		for(ShopVo shop : shopList) {
			List<ProductVo> productList = sqlSession.getMapper(ProductDao.class).selectByShopCode(shop.getShopCode());
			productMap.put(shop.getShopCode(), productList);
			productSupport.putTitleImageByProductListIntoImageMap(imageMap, productList);
		}
		model.addAttribute("shopList", shopList);
		model.addAttribute("productMap", productMap);
		model.addAttribute("imageMap", imageMap);
	}
	
	@Override
	public void getShoplist(Model model, String mainCategoryName) throws SQLException {
		List<ShopVo> shopList = sqlSession.getMapper(ShopDao.class).selectShopList(mainCategoryName);
		Map<String, List<ProductVo>> productMap = new HashMap<String, List<ProductVo>>();
		Map<String, ImageVo> imageMap = new HashMap<String, ImageVo>();
		for(ShopVo shop : shopList) {
			List<ProductVo> productList = sqlSession.getMapper(ProductDao.class).selectByShopCode(shop.getShopCode());
			productMap.put(shop.getShopCode(), productList);
			productSupport.putTitleImageByProductListIntoImageMap(imageMap, productList);
		}
		model.addAttribute("shopList", shopList);
		model.addAttribute("productMap", productMap);
		model.addAttribute("imageMap", imageMap);
	}
	
	@Override
	public void getShoplist(Model model, String mainCategoryName, String subCategoryName) throws SQLException {
		List<ShopVo> shopList = sqlSession.getMapper(ShopDao.class).selectShopList(mainCategoryName, subCategoryName);
		Map<String, List<ProductVo>> productMap = new HashMap<String, List<ProductVo>>();
		Map<String, ImageVo> imageMap = new HashMap<String, ImageVo>();
		for(ShopVo shop : shopList) {
			List<ProductVo> productList = sqlSession.getMapper(ProductDao.class).selectByShopCode(shop.getShopCode());
			productMap.put(shop.getShopCode(), productList);
			productSupport.putTitleImageByProductListIntoImageMap(imageMap, productList);
		}
		model.addAttribute("shopList", shopList);
		model.addAttribute("productMap", productMap);
		model.addAttribute("imageMap", imageMap);
	}
	
	@Override
	public void getShop(Model model, String shopCode, String productCode) throws SQLException {
		ShopVo shop = sqlSession.getMapper(ShopDao.class).selectShop(shopCode);
		
		List<ProductVo> productList = sqlSession.getMapper(ProductDao.class).selectByShopCode(shopCode);
		List<ImageVo> imageList = null;
		List<OptionVo> optionList = null;
		for(ProductVo product : productList) {
			if(product.getProductCode().equals(productCode)) {
				imageList = productSupport.getImages(product);
				optionList = productSupport.secondOptionListByProduct(product);
			}
			productSupport.nameFirstOption(product);
		}
		
		Map<String, ImageVo> titleImageMap = new HashMap<String, ImageVo>();
		productSupport.putTitleImageByProductListIntoImageMap(titleImageMap, productList);
		
		model.addAttribute("shop", shop);
		model.addAttribute("productCode", productCode);
		model.addAttribute("productList", productList);
		model.addAttribute("imageList", imageList);
		model.addAttribute("optionList", optionList);
		model.addAttribute("titleImageMap", titleImageMap);
	}
	
	// 상품 리뷰 작성
	@Override
	public void registReview(ReviewVo bean) throws Exception {
		dao.registReview(bean);
	}
	
	// 상품 리뷰 목록
	@Override
	public List<ReviewVo> reviewList(int itemNo) throws Exception {
		return dao.reviewList(itemNo);
	}

}
