package com.bit.backpackers.member.controller;

import java.lang.reflect.Member;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bit.backpackers.member.model.LoginDTO;
import com.bit.backpackers.member.model.entity.MemberVo;
import com.bit.backpackers.member.service.MemberService;

@Controller
@RequestMapping("/user")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	private final MemberService memberService;

	@Inject
	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}

	// 로그인 페이지
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET(@ModelAttribute("loginDTO") LoginDTO loginDTO) {
		System.out.println("00000003");
		return "/user/login";
	}
	// 로그인 처리
	 @RequestMapping(value = "/loginPost", method = RequestMethod.POST) 
	 public String loginPOST(@ModelAttribute LoginDTO loginDTO, HttpSession httpSession,
	 Model model) throws Exception { 
		MemberVo memberVo = memberService.login(loginDTO);
	 	
		if(memberVo != null) {
			System.out.println("로그인 성공");
			httpSession.setAttribute("user", memberVo);
			return "redirect:/";
		}
		System.out.println("로그인 실패");
		return "redirect:login";
	 }





	 
	


	// 회원가입 페이지
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerGET() throws Exception {
		System.out.println("00000001");
		return "user/register";
	}

	// 회원가입 처리
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(@ModelAttribute MemberVo memberVo, RedirectAttributes redirectAttributes)
			throws Exception {

//        String hashedPw = BCrypt.hashpw(memberVo.getUserPw(), BCrypt.gensalt());
//        memberVo.setUserPw(hashedPw);
		memberService.register(memberVo);
		redirectAttributes.addFlashAttribute("msg", "REGISTERED");

		System.out.println("00000002");
		return "redirect:/user/login";
	}

	// 회원 아이디 중복체크
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public int postIdCheck(HttpServletRequest req) throws Exception {
		System.err.println("idcheck11");
		logger.info("post idCheck");

		String userId = req.getParameter("userId");
		MemberVo idCheck = memberService.idCheck(userId);

		int result = 0;

		if (idCheck != null) {
			result = 1;
		}

		return result;
	}

}