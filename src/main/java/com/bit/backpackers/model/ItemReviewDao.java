package com.bit.backpackers.model;

import java.sql.SQLException;
import java.util.List;

import com.bit.backpackers.model.entity.ItemReviewVo;

public interface ItemReviewDao {

	List<ItemReviewVo> selectAll() throws SQLException; // 내가 쓴 리뷰 목록
	ItemReviewVo selectOne(int itemReview_no) throws SQLException; // 클릭한 제품 리뷰 조회
	void insertOne(ItemReviewVo bean) throws SQLException; // 리뷰 작성
	//int updateOne(ItemReviewVo bean) throws SQLException; // 리뷰 수정(미정)
	int deleteOne(int itemReview_no) throws SQLException; // 리뷰 삭제(관리자권한)
	
}