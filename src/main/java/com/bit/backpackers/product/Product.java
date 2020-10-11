package com.bit.backpackers.product;

import java.sql.SQLException;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.bit.backpackers.image.model.entity.ImageVo;
import com.bit.backpackers.product.model.ProductDao;

@Component
public class Product {
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Inject
	SqlSession sqlSession;
	
	public Product() {
		log.info("Component : " + this.getClass().getName());
	}
	
	public ImageVo getTitleImage(String productCode) throws SQLException {
		return sqlSession.getMapper(ProductDao.class).selectTitleImageFilteredBy(productCode);
	}

}
