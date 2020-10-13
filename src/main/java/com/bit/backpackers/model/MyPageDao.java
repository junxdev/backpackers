package com.bit.backpackers.model;

import java.sql.SQLException;

import com.bit.backpackers.model.entity.MyPageVo;

public interface MyPageDao {
	MyPageVo selectOne(String userId) throws SQLException;
	int updateOne(MyPageVo bean) throws SQLException;
	int deleteOne(String userId) throws SQLException;
}
