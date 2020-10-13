package com.bit.backpackers;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

//@Repository
public class DeptDaoImpl {

	@Inject
	SqlSession sqlSession;
	
//	@Override
//	public List<DeptVo> selectAll() throws SQLException {
//		return null;
//	}
}
