package com.bit.backpackers.controller;

import java.sql.SQLException;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bit.backpackers.model.entity.MyPageVo;
import com.bit.backpackers.service.MyPageService;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

	@Inject
	MyPageService mypageService;
	
	@RequestMapping(value="/{userId}", method=RequestMethod.GET)
	public String accountDetail(@PathVariable String userId, Model model) throws SQLException {
		mypageService.accountDetailService(model, userId);
		return "mypage/detail";
	}
	
	@RequestMapping("/{userId}/edit")
	public String edit(@PathVariable String userId, Model model) throws SQLException{
		mypageService.accountDetailService(model, userId);
		return "mypage/edit";
	}
	
	@RequestMapping(value="/{userId}", method=RequestMethod.PUT)
	public ModelAndView update(@PathVariable String userId, @ModelAttribute MyPageVo bean) throws SQLException{
		mypageService.accountEditService(bean);
		return new ModelAndView("redirect."+userId);
	}
	
	@RequestMapping(value="/{userId}", method=RequestMethod.DELETE)
	public String delete(@PathVariable String userId, Model model) throws SQLException{
		mypageService.accountDeleteService(userId);
		return "redirect:./";
	}
	
	
	
}
