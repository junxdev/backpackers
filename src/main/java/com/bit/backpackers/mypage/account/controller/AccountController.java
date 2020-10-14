package com.bit.backpackers.mypage.account.controller;

import java.sql.SQLException;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bit.backpackers.mypage.account.model.entity.AccountVo;
import com.bit.backpackers.mypage.account.service.AccountService;

@Controller
@RequestMapping("/account")
public class AccountController {

	private static final Logger logger = LoggerFactory.getLogger(AccountController.class);
	
	@Inject
	AccountService accountService;
	
//	@RequestMapping(value="/detail", method=RequestMethod.GET)
//	public String detail(@PathVariable String userId, Model model) throws SQLException {
//		accountService.DetailService(model, userId);
//		return "account/detail";
//	}
	
	// 수정할 정보 받기
	@RequestMapping(value="/edit", method=RequestMethod.GET)
	public void  beforeEdit() throws SQLException {
		logger.info("get edit");
	}
	
	// 수정 정보 보내기
	@RequestMapping(value="/edit", method=RequestMethod.POST)
	public String edit(HttpSession session, AccountVo bean) throws SQLException{
		logger.info("post edit");
		accountService.EditService(bean);
		session.invalidate();
		return "redirect:/";
	}
	
	// 탈퇴 정보 받기 
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public void beforeDelete() throws SQLException{
		logger.info("get delete");
	}
	
	// 탈퇴 post
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String delete(HttpSession session, AccountVo bean, RedirectAttributes rttr) throws SQLException{
		logger.info("post delete");
		
		AccountVo member = (AccountVo)session.getAttribute("member");
		String Pw1 = member.getUserPw();
		String Pw2 = member.getUserPw();
		
		if(!(Pw1.equals(Pw2))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/account/delete";
		}
		accountService.DeleteService(bean);
		return "redirect:/";
	}
	
//	@ResponseBody
//	@RequestMapping(value="/checkPw", method=RequestMethod.POST)
//	public int checkPw(AccountVo bean) throws SQLException{
//		int result = accountService.CheckPw(bean);
//		return result;
//	}
	
	
}
