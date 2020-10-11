package com.bit.backpackers.order;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.bit.backpackers.option.model.OptionDao;
import com.bit.backpackers.option.model.entity.OptionVo;
import com.bit.backpackers.order.model.entity.OrderedProductVo;

@Component
public class Order {
	
	@Inject
	SqlSession sqlSession;

	public String makeOrderCode() {
		LocalDateTime now = LocalDateTime.now(ZoneId.of("Asia/Seoul"));
		String orderCode = now.format(DateTimeFormatter.ofPattern("yyyyMMddhhmmss"));
		return orderCode;
	}
	
	public OrderedProductVo findOption(OrderedProductVo orderedProduct) {
		OptionVo option = sqlSession.getMapper(OptionDao.class).selectOptionFilteredBy(orderedProduct.getFirstOptionCode());
		orderedProduct.setFirstOptionGroupName(option.getOptionGroupName());
		orderedProduct.setFirstOptionName(option.getOptionName());
		option = sqlSession.getMapper(OptionDao.class).selectOptionFilteredBy(orderedProduct.getSecondOptionCode());
		orderedProduct.setSecondOptionGroupName(option.getOptionGroupName());
		orderedProduct.setSecondOptionName(option.getOptionName());
		return orderedProduct;
	}
}
