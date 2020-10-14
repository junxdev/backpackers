package com.bit.backpackers.cart.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.backpackers.cart.model.CartDao;
import com.bit.backpackers.cart.model.entity.CartProductVo;
import com.bit.backpackers.image.model.entity.ImageVo;
import com.bit.backpackers.order.Order;
import com.bit.backpackers.order.model.OrderDao;
import com.bit.backpackers.order.model.OrderedProductDao;
import com.bit.backpackers.order.model.entity.OrderVo;
import com.bit.backpackers.order.model.entity.OrderedProductVo;
import com.bit.backpackers.product.Product;
import com.bit.backpackers.shop.Shop;
import com.bit.backpackers.shop.model.entity.ShopVo;

@Service
public class CartServiceImpl implements CartService {

	@Inject
	SqlSession sqlSession;
	@Inject
	Product productSupport;
	@Inject
	Shop shopSupport;
	@Inject
	Order orderSupport;

	@Override
	public void putItemIntoCart(CartProductVo bean) throws SQLException {
		for(int i = 0; i < bean.getQuantity(); i++) {
			sqlSession.getMapper(CartDao.class).insertItem(bean.getProductCode(), bean.getOptionCode());
		}
	}
	

	@Override
	public void getCartByMemberId(Model model, String memberId) throws SQLException {
		List<CartProductVo> cart = sqlSession.getMapper(CartDao.class).selectCart();
		List<ImageVo> orderedProductImageList = new ArrayList<ImageVo>();
		List<ShopVo> orderedProductShopList = new ArrayList<ShopVo>();
		for(CartProductVo product : cart) {
//			log.info(product.getProductCode());
			orderedProductImageList.add(productSupport.getTitleImage(product.getProductCode()));
			orderedProductShopList.add(shopSupport.getShopFilteredBy(product.getProductCode()));
//			product = orderSupport.findOption(product);
		}
//		model.addAttribute("order", order);
//		model.addAttribute("productList", orderedProductList);
		model.addAttribute("imageList", orderedProductImageList);
		model.addAttribute("shopList", orderedProductShopList);
	}
}
