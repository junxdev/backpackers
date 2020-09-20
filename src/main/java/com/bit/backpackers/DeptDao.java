package com.bit.backpackers;

import java.sql.SQLException;
import java.util.List;

public interface DeptDao {

	List<DeptVo> selectAll() throws SQLException;
}
