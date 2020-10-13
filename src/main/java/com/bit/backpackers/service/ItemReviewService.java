package com.bit.backpackers.service;

import java.sql.SQLException;

import org.springframework.ui.Model;

import com.bit.backpackers.model.entity.ItemReviewVo;

public interface ItemReviewService {
	
	void listService(Model model) throws SQLException;
	void oneAddService(ItemReviewVo bean) throws SQLException;
	void detailService(Model model, int itemReview_no) throws SQLException;
	void oneDelService(int itemReview_no) throws SQLException;
}
