package com.bit.backpackers.test;

import java.sql.SQLException;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bit.backpackers.item.model.ItemDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/applicationContext.xml")
public class ItemTest {

	@Inject
	SqlSession sqlSession;
	
	@Test
	public void callItemList() throws SQLException {
		ItemDao dao = sqlSession.getMapper(ItemDao.class);
		dao.selectAll();
	}
}
