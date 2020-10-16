package com.bit.backpackers.shop.model;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bit.backpackers.shop.model.entity.ReviewVo;
import com.bit.backpackers.shop.model.entity.ShopVo;

@Repository
public class ShopDaoImpl implements ShopDao {

	// mapper
	private static String namespace = "com.bit.backpackers.mapper.shopMapper";

	@Inject
	SqlSession sqlSession;

	// 상품 리뷰 작성
	@Override
	public void registReview(ReviewVo bean) throws Exception {
		sqlSession.insert(namespace + ".registReview", bean);
	}

	// 상품 리뷰 목록
	@Override
	public List<ReviewVo> reviewList(String shopCode) throws Exception {
		return sqlSession.selectList(namespace + ".reviewList", shopCode);
	}

	@Override
	public List<ShopVo> selectShopList() throws SQLException {
		return null;
	}

	@Override
	public List<ShopVo> selectShopList(String mainCategoryName) throws SQLException {
		return null;
	}

	@Override
	public List<ShopVo> selectShopList(String mainCategoryName, String subCategoryName) throws SQLException {
		return null;
	}

	@Override
	public ShopVo selectShop(String shopCode) throws SQLException {
		return null;
	}

	@Override
	public ShopVo selectShopByProductCode(String productCode) throws SQLException {
		return null;
	}
}
