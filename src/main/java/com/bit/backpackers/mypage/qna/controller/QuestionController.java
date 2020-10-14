package com.bit.backpackers.mypage.qna.controller;

import java.sql.SQLException;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.backpackers.mypage.qna.model.entity.QuestionVo;
import com.bit.backpackers.mypage.qna.service.QuestionService;

@Controller
@RequestMapping("/qna")
public class QuestionController {
	private static final Logger logger = LoggerFactory.getLogger(QuestionController.class);
	
	@Inject
	QuestionService questionService;
	
	// 질문 리스트
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list(Model model) throws SQLException {
		logger.info("list");
		return "qna/list";
	}
	
	// 질문 내용
	@RequestMapping(value="/readview", method=RequestMethod.GET)
	public String read( Model model, int question_no) throws SQLException{
		logger.info("read");
		return "qna/readview";
	}
	
	// 질문 작성 화면
	@RequestMapping(value = "/writeview", method=RequestMethod.GET)
	public void writeView() throws SQLException{
		logger.info("wirteView");
	}
	
	// 질문 작성
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String write(QuestionVo bean) throws SQLException{
		logger.info("write");
		questionService.createService(bean);
		return "redirect:/";
	}
}
