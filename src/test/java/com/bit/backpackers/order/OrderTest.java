package com.bit.backpackers.order;

import static org.junit.Assert.*;

import java.sql.SQLException;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bit.backpackers.option.model.OptionDao;
import com.bit.backpackers.option.model.entity.OptionVo;
import com.bit.backpackers.order.model.OrderDao;
import com.bit.backpackers.order.model.entity.OrderedProductVo;
import com.bit.backpackers.order.service.OrderService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/applicationContext.xml")
public class OrderTest {
	
	@Inject
	SqlSession sqlSession;

	/* OrderCode 생성 테스트 */
	@Test
	public void createOrderCode() {
		Order order = new Order();
		String orderCode = order.makeOrderCode();
		System.out.println(orderCode);
		assertNotNull(orderCode);
	}

	@Test
	public void createOrder() throws SQLException {
		String test = "20201008test";
		OrderDao dao = sqlSession.getMapper(OrderDao.class);
//		dao.insertOrder(test);
		String result = dao.selectOrder(test).getOrderCode();
		assertEquals(test, result);
	}
	
	@Test
	public void insertOrderItem() throws SQLException {
		String testOrderCode = "20201008test";
		String testItemCode = "item01";
		OrderDao dao = sqlSession.getMapper(OrderDao.class);
		dao.insertOrderItem(testOrderCode, testItemCode, testItemCode);
	}
	
	@Test
	public void selectOrderItem() throws SQLException {
		String testOrderCode = "20201008test";
		OrderDao dao = sqlSession.getMapper(OrderDao.class);
		dao.selectOrderItem(testOrderCode);
	}
	
	@Test
	public void findOption() {
		OrderedProductVo result = new OrderedProductVo();
		OptionVo option = sqlSession.getMapper(OptionDao.class).selectOptionFilteredBy("color-black");
		result.setFirstOptionGroupName(option.getOptionGroupName());
		result.setFirstOptionName(option.getOptionName());
		option = sqlSession.getMapper(OptionDao.class).selectOptionFilteredBy("size-roman-xl");
		result.setSecondOptionGroupName(option.getOptionGroupName());
		result.setSecondOptionName(option.getOptionName());
		assertEquals("Black", result.getFirstOptionName());
	}
}
