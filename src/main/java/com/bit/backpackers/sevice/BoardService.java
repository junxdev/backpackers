package com.bit.backpackers.sevice;

import java.sql.SQLException;

import org.springframework.ui.Model;

import com.bit.backpackers.model.entity.BoardVo;

public interface BoardService {

	
	void listService(Model model) throws SQLException;
	void insertService(BoardVo info)throws SQLException;
	void ditailService(Model model,int board_no)throws SQLException;
	void updateService(BoardVo info)throws SQLException;
	void deleteService(int board_no)throws SQLException;
}
