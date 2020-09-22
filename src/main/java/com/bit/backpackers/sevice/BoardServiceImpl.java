package com.bit.backpackers.sevice;

import java.sql.SQLException;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.backpackers.model.entity.BoardVo;
import com.bit.backpackers.model.BoardDao;
@Service
public class BoardServiceImpl implements BoardService{
 
	@Inject
  SqlSession sqlSession;	
	
	@Override
	public void listService(Model model) throws SQLException {
		BoardDao dao=sqlSession.getMapper(BoardDao.class);
		model.addAttribute("board",dao.boardInfo());
	}

	@Override
	public void insertService(BoardVo info) throws SQLException {
		BoardDao dao=sqlSession.getMapper(BoardDao.class);
		dao.insertboard(info);
		
	}

	@Override
	public void ditailService(Model model, int board_no) throws SQLException {
		BoardDao dao=sqlSession.getMapper(BoardDao.class);
		model.addAttribute("boardDitail",dao.boardDetail(board_no));
	}

	@Override
	public void updateService(BoardVo info) throws SQLException {
       BoardDao dao=sqlSession.getMapper(BoardDao.class);
       dao.updateboard(info);
	}

	@Override
	public void deleteService(int board_no) throws SQLException {
		BoardDao dao=sqlSession.getMapper(BoardDao.class);
		dao.deleteboard(board_no);
	}

}
