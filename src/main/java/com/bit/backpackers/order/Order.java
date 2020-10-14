package com.bit.backpackers.order;

import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.bit.backpackers.option.model.OptionDao;
import com.bit.backpackers.option.model.entity.OptionVo;
import com.bit.backpackers.order.model.OrderDao;
import com.bit.backpackers.order.model.entity.OrderVo;
import com.bit.backpackers.order.model.entity.OrderedProductVo;
import com.bit.backpackers.product.model.entity.ProductVo;

@Component
public class Order {
	
	@Inject
	SqlSession sqlSession;

	public String makeOrderCode() {
		LocalDateTime now = LocalDateTime.now(ZoneId.of("Asia/Seoul"));
		String orderCode = now.format(DateTimeFormatter.ofPattern("yyyyMMddhhmmss"));
		return orderCode;
	}
	
	public ProductVo nameOption(ProductVo product) {
		OptionVo option = sqlSession.getMapper(OptionDao.class).selectOptionFilteredBy(product.getFirstOptionCode());
		product.setFirstOptionGroupName(option.getOptionGroupName());
		product.setFirstOptionName(option.getOptionName());
		option = sqlSession.getMapper(OptionDao.class).selectOptionFilteredBy(product.getSecondOptionCode());
		product.setSecondOptionGroupName(option.getOptionGroupName());
		product.setSecondOptionName(option.getOptionName());
		return product;
	}
	
	public void checkAnyOrder() throws SQLException {
		OrderDao dao = sqlSession.getMapper(OrderDao.class);
		OrderVo order = dao.selectOrdersFilteredBy(OrderStatus.CHECKING);
		if(order != null) {
			order.setOrderStatus(OrderStatus.CANCELED);
			dao.updateOrder(order);
		}
	}
}
