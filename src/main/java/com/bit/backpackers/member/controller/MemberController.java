package com.bit.backpackers.member.controller;

import com.bit.backpackers.member.model.entity.LoginDTO;
import com.bit.backpackers.member.model.entity.MemberVo;
import com.bit.backpackers.member.service.MemberService;
import common.exception.MailException;
import java.io.PrintStream;
import java.util.Map;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping({ "/user" })
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(AdminInterceptor.class);
	private final MemberService memberService;

	@Inject
	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}

	@RequestMapping(value = { "/login" }, method = { org.springframework.web.bind.annotation.RequestMethod.GET })
	public String loginGET(@ModelAttribute("loginDTO") LoginDTO loginDTO) {
		logger.info("login");
		return "/user/login";
	}

	@RequestMapping(value = { "/loginPost" }, method = { org.springframework.web.bind.annotation.RequestMethod.POST })
	public String loginPOST(@ModelAttribute LoginDTO loginDTO, HttpSession httpSession, RedirectAttributes rttr)
			throws Exception {
		logger.info("loginPost");
		MemberVo user = this.memberService.login(loginDTO);

		if (user != null) {
			System.out.println("로그인 성공");
			httpSession.setAttribute("user", user);

			return "redirect:/";
		}
		System.out.println("로그인 실패");
		httpSession.setAttribute("user", null);

		return "user/loginPost";
	}

	@RequestMapping(value = { "/logout" }, method = { org.springframework.web.bind.annotation.RequestMethod.GET })
	public String logout(HttpSession session) throws Exception {
		session.invalidate();

		return "redirect:/";
	}

	@RequestMapping(value = { "/myPage" }, method = { org.springframework.web.bind.annotation.RequestMethod.GET })
	public String mypage(@ModelAttribute("loginDTO") LoginDTO loginDTO) throws Exception {
		logger.info("user Login");
		return "/user/myPage";
	}

	@RequestMapping(value = { "/register" }, method = { org.springframework.web.bind.annotation.RequestMethod.GET })
	public String registerGET() throws Exception {
		System.out.println("00000001");
		return "user/register";
	}

	@RequestMapping(value = { "/registerPost" }, method = {
			org.springframework.web.bind.annotation.RequestMethod.POST })
	public String registerPOST(@ModelAttribute MemberVo memberVo, RedirectAttributes redirectAttributes)throws Exception {
		this.memberService.register(memberVo);
		redirectAttributes.addFlashAttribute("msg", "REGISTERED");

		System.out.println("00000002");
		return "/user/registerPost";
	}

	@ResponseBody
	@RequestMapping(value = { "/idCheck" }, method = { org.springframework.web.bind.annotation.RequestMethod.POST })
	public int idCheck(@ModelAttribute MemberVo memberVo) throws Exception {
		int result = this.memberService.idCheck(memberVo);
		System.out.println("login check");
		return result;
	}

	@RequestMapping(value = { "/findid" }, method = { org.springframework.web.bind.annotation.RequestMethod.GET })
	public String getFindId() {
		return "/user/findid";
	}
	//아이디찾기
	@RequestMapping({ "/findidAjax" })
	@ResponseBody
	public String findId(@RequestParam Map<String, Object> memberMap) throws Exception {
		MemberVo memberVo = this.memberService.findId(memberMap);
		String result = "fail";

		if (memberVo != null) {
			String res = memberVo.getUserId();
			System.out.println(res);

			if (res.equals(null)) {
				return "fail";
			}
			result = memberVo.getUserId();
		}
		return result;
	}

	@RequestMapping(value = { "/findpw" }, method = { org.springframework.web.bind.annotation.RequestMethod.GET })
	public String getFindPw() {
		return "/user/findpw";
	}

	@RequestMapping({ "/findpwAjax" })
	@ResponseBody
	public String FindPw(@RequestParam Map<String, Object> memberMap) throws Exception {
		MemberVo memberVo = this.memberService.findPw(memberMap);
		String result = "";

		if (memberVo != null) {
			String res = memberVo.getUserPw();

			if (res.equals(null)) {
				return "null";
			}
			result = memberVo.getUserPw();
		}

		return result;
	}

	@RequestMapping({ "/pwModify" })
	public ModelAndView modifyPw(MemberVo memberVo) throws Exception {
		ModelAndView mav = new ModelAndView();

		int res = this.memberService.modifyPw(memberVo);

		if (res < 0) {
			System.out.println("비밀번호 수정 실패");
			mav.setViewName("redirect:findpw");
		} else {
			System.out.println("비밀번호 수정 성공");
			mav.setViewName("redirect:login");
		}

		return mav;
	}

	@RequestMapping({ "/send" })
	public ModelAndView joinEmailCheck(String email, int code_check) throws MailException {
		ModelAndView mav = new ModelAndView();

		this.memberService.mailSending(email, code_check);

		System.out.println("메일 발송 성공");

		return mav;
	}
}