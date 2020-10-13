package com.bit.backpackers.service;

import java.sql.SQLException;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.bit.backpackers.model.ItemReviewDao;
import com.bit.backpackers.model.entity.ItemReviewVo;

public class ItemReviewServiceImpl implements ItemReviewService {
	@Inject
	SqlSession sqlSession;
	
	@Override
	public void listService(Model model) throws SQLException {
		ItemReviewDao dao = sqlSession.getMapper(ItemReviewDao.class);
		System.out.println(dao);
		model.addAttribute("list", dao.selectAll());
	}

	@Override
	public void oneAddService(ItemReviewVo bean) throws SQLException {
		ItemReviewDao dao = sqlSession.getMapper(ItemReviewDao.class);
		dao.insertOne(bean);
		bean.setReview_title("next"+bean.getReview_title());
	}

	@Override
	public void detailService(Model model, int itemReview_no) throws SQLException {
		ItemReviewDao dao = sqlSession.getMapper(ItemReviewDao.class);
		model.addAttribute("bean", dao.selectOne(itemReview_no));
	}

	@Override
	public void oneDelService(int itemReview_no) throws SQLException {
		ItemReviewDao dao = sqlSession.getMapper(ItemReviewDao.class);
		dao.deleteOne(itemReview_no);
		dao.deleteOne(itemReview_no-1);
	}

}
