package com.bit.backpackers.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.backpackers.member.model.entity.LoginDTO;
import com.bit.backpackers.member.service.MemberService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminInterceptor.class);
	private  MemberService memberService;
	
	// 관리자 페이지
		@RequestMapping(value = "/adminPage", method = RequestMethod.GET)
		public String adminpage(@ModelAttribute("loginDTO") LoginDTO loginDTO)throws Exception {
			logger.info("admin Login");
			return "/admin/adminPage";
		}
		
}
