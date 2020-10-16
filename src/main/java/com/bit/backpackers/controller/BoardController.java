package com.bit.backpackers.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bit.backpackers.model.entity.BoardVo;
import com.bit.backpackers.model.entity.ReplyVo;
import com.bit.backpackers.service.BoardService;
import com.bit.backpackers.service.ReplyService;
import com.bit.backpackers.util.BoardPager;
import com.bit.backpackers.util.Criteria;
import com.bit.backpackers.util.PageMaker;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Inject
	BoardService boardService;
    @Inject
    ReplyService replyService;
    
	
	 //게시판글쓰기
	 @RequestMapping(value = "/",method=RequestMethod.POST)
	 public String intsertinfo(@ModelAttribute BoardVo info, HttpSession session) {
		
		 String user_id=  (String) session.getAttribute("username");
//		 String user_id="kimdeayoung";
		 try {
			 info.setUser_ID(user_id);
			boardService.insertService(info);
		} catch (SQLException e) {
			System.out.println("�뜝�럡�뎽占썩뫅�삕!");
		}
		 System.out.println(info.toString());
		 return "redirect:./";
		 
	 }
	 @RequestMapping(value = "/boardwrite")
	 public void boardwrite() {}
	
	 
	 
//	 
//	 @RequestMapping(value = "{board_no}",method =RequestMethod.GET )
//		 public String board(@PathVariable int board_no,Model model) throws SQLException {
//		 boardService.ditailService(model, board_no);
//			 return "board/boardpost";
//		 }
	 
	 //댓글입력
	 @RequestMapping(value = "{board_no}",method =RequestMethod.POST )
	 public String replyinsert(@ModelAttribute ReplyVo reply,HttpSession session){
	 
	String reply_id=(String) session.getAttribute("username");
		 try {
			 reply.setReply_id(reply_id);
		replyService.insertReply(reply);
	} catch (SQLException e) {
		System.out.println("�뜝�럥六사뛾�룇裕뉛옙堉꾢뜝�럥�넮 �뜝�럥占싸우삕占쏙옙.");
	}
	 	 
	 return "redirect:{board_no}";
	 }
	 
	 @RequestMapping(value = "{board_no}",method =RequestMethod.GET)
	 public ModelAndView replylist(@PathVariable int board_no ,ModelAndView mav,Model model) throws SQLException {
		 List<ReplyVo> list=replyService.Replylist(board_no);
		 
		 boardService.ditailService(model, board_no);
		 boardService.increaseViewcnt(board_no);
		 mav.setViewName("board/boardpost");
		 mav.addObject("reply",list);
		 return mav;
		
	 }
	 
	 
	 @RequestMapping(value = "/{board_no}/edit",method =RequestMethod.GET )
	 public String boardedit(@PathVariable int board_no,Model model) throws SQLException {
	 boardService.ditailService(model, board_no);
	 
		 return "board/boardpostedit";
	 }
	 
	
	 //글수정
	 @RequestMapping(value = "{board_no}/edit",method = RequestMethod.PUT)
	 public String boardupdate(@PathVariable int board_no,Integer reply_no,@ModelAttribute BoardVo info,ReplyVo replyinfo,HttpServletRequest request) throws SQLException {
		 if(request.getParameter("boardupdate") != null) {
		   boardService.updateService(info);
		   System.out.println("보드업데이트");
	   }else {
		   replyService.updateReply(replyinfo);   
	   }
		 return "redirect:../{board_no}";
	 }
	 
//	 //댓글수정
//	 @RequestMapping(value = "/{reply_no}/replyedit",method = RequestMethod.PUT)
//	 public String replyupdate(@PathVariable Integer reply_no,@ModelAttribute ReplyVo replyinfo,HttpServletRequest request) throws SQLException {
//		 if(request.getParameter("reply_no") != null) {
//		   replyService.updateReply(replyinfo);
//		   System.out.println("댓글수정완료");
//	   }
//		 return "redirect:../";
//	 }
//	 
	 
	//글삭제,댓글삭제
	 @RequestMapping(value = "{board_no}",method = RequestMethod.DELETE)
		 public String delreply(@PathVariable int board_no,Integer reply_no,HttpServletRequest request) throws SQLException {
			if(request.getParameter("board_no") != null) {
				 boardService.deleteService(board_no);
				 return "redirect:./";
				
			}else {
				replyService.deleteReply(reply_no);
				return "redirect:./{board_no}";
			}
			
	 }
	 
	 //게시판 페이징
	 @RequestMapping(value="/")
	 public ModelAndView openBoardList(Criteria cri) throws Exception {
	         
	     ModelAndView mav = new ModelAndView("/board/board");
	   
	     PageMaker pageMaker = new PageMaker();
	     pageMaker.setCri(cri);
	     pageMaker.setTotalCount(boardService.countBoardListTotal());

	         
	     List<Map<String,Object>> list = boardService.selectBoardList(cri);
	     mav.addObject("list", list);
	     mav.addObject("pageMaker", pageMaker);
	    
	 
	     return mav;
	         
	 }
   
	  @RequestMapping(value = "/search")
      public ModelAndView list(@RequestParam(defaultValue ="title") String searchOption, @RequestParam(defaultValue="") String keyword,@RequestParam(defaultValue="1")int curPage)throws Exception {
		
		  ModelAndView mav =new ModelAndView();
		  int count=boardService.countBoardContent(searchOption, keyword);
		  
		  
		  BoardPager boardPager = new BoardPager(count, curPage);
			int start = boardPager.getPageBegin();
			int end = boardPager.getPageEnd();
		  
		  List<BoardVo> list= boardService.searchBoard(start, end,searchOption, keyword);
		  
		  Map<String,Object> map=new HashMap<String,Object>();
		  map.put("list",list);
		  map.put("searchOption",searchOption);
		  map.put("keyword",keyword);
		  map.put("count",count);
		  map.put("boardPager",boardPager);
		  mav.addObject("map",map);
		  mav.setViewName("board/boardsearch");
		
		  return mav;
	  }
      

		 
	 }
	 
	 

