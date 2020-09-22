package com.bit.backpackers.model;

import java.sql.SQLException;
import java.util.List;

import org.springframework.ui.Model;

import com.bit.backpackers.model.entity.BoardVo;

public interface BoardDao {

	 List<BoardVo> boardInfo() throws SQLException;
	 void insertboard(BoardVo info)throws SQLException;
	 BoardVo boardDetail(int board_no)throws SQLException;
	 int updateboard(BoardVo info)throws SQLException;
	 int deleteboard(int board_no)throws SQLException;
}
 