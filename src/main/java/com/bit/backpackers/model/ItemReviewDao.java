package com.bit.backpackers.model;

import java.sql.SQLException;
import java.util.List;

import com.bit.backpackers.model.entity.ItemReviewVo;

public interface ItemReviewDao {

	List<ItemReviewVo> selectAll() throws SQLException; // ���� �� ���� ���
	ItemReviewVo selectOne(int itemReview_no) throws SQLException; // Ŭ���� ��ǰ ���� ��ȸ
	void insertOne(ItemReviewVo bean) throws SQLException; // ���� �ۼ�
	//int updateOne(ItemReviewVo bean) throws SQLException; // ���� ����(����)
	int deleteOne(int itemReview_no) throws SQLException; // ���� ����(�����ڱ���)
	
}