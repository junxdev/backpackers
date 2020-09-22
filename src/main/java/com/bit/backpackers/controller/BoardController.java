package com.bit.backpackers.controller;

import java.sql.SQLException;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.backpackers.model.entity.BoardVo;
import com.bit.backpackers.sevice.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Inject
	BoardService boardService;
	
	 @RequestMapping(value = "/")
	 public String boardmain(Model model)  {
		try {
			boardService.listService(model);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 return "board/board";
	 }
	 
	 @RequestMapping(value = "/",method=RequestMethod.POST)
	 public String intsertinfo(@ModelAttribute BoardVo info) {
		 try {
			boardService.insertService(info);
		} catch (SQLException e) {
			System.out.println("½ÇÆÐ");
		}
		 System.out.println(info.toString());
		 return "redirect:./";
		 
	 }
	 @RequestMapping(value = "/boardwrite")
	 public void boardwrite() {}
	
	 
	 @RequestMapping(value = "{board_no}",method =RequestMethod.GET )
		 public String board(@PathVariable int board_no,Model model) throws SQLException {
		 boardService.ditailService(model, board_no);
			 return "board/boardpost";
		 }
		 
		 
	 }
	 
	 

