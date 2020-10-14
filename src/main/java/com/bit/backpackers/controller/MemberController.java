package com.bit.backpackers.controller;

import java.lang.reflect.Member;
import java.util.Date;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import com.bit.backpackers.model.entity.LoginDTO;
import com.bit.backpackers.model.entity.MemberVo;
import com.bit.backpackers.service.MemberService;

import common.exception.MailException;

@Controller
@RequestMapping("/user")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(AdminInterceptor.class);
	private final MemberService memberService;

	@Inject
	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}

	// 로그?�� ?��?���?
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET(@ModelAttribute("loginDTO") LoginDTO loginDTO) {
		logger.info("login");
		return "/user/login";
	}

	// 로그?�� 처리
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public String loginPOST(@ModelAttribute LoginDTO loginDTO, HttpSession httpSession, RedirectAttributes rttr)
			throws Exception {
		logger.info("loginPost");
		MemberVo user = memberService.login(loginDTO);

		if (user != null) {
			System.out.println("�α��� ����");
			httpSession.setAttribute("user", user);
			httpSession.setAttribute("username",loginDTO.getUserId());
			// 로그?�� ?���?�? ?��?��?�� 경우
			return "redirect:/";
		} else {
			System.out.println("로그?�� ?��?��");
			httpSession.setAttribute("user", null);
			// rttr.addFlashAttribute("msg", false);
			return "user/loginPost";
		}
	}

	// 로그?��?��
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {

		session.invalidate();

		return "redirect:/";
	}

	// user마이 ?��?���?
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public String mypage(@ModelAttribute("loginDTO") LoginDTO loginDTO) throws Exception {
		logger.info("user Login");
		return "/user/myPage";
	}

	// ?��?���??�� ?��?���?
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerGET() throws Exception {
		System.out.println("00000001");
		return "user/register";
	}

	// ?��?���??�� 처리
	@RequestMapping(value = "/registerPost", method = RequestMethod.POST)
	public String registerPOST(@ModelAttribute MemberVo memberVo, RedirectAttributes redirectAttributes)
			throws Exception {

//        String hashedPw = BCrypt.hashpw(memberVo.getUserPw(), BCrypt.gensalt());
//        memberVo.setUserPw(hashedPw);
		memberService.register(memberVo);
		redirectAttributes.addFlashAttribute("msg", "REGISTERED");

		System.out.println("00000002");
		return "/user/registerPost";
	}

	// ?��?��?�� 중복 체크
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public int idCheck(@ModelAttribute MemberVo memberVo) throws Exception {
		int result = memberService.idCheck(memberVo);
		System.out.println("login check");
		return result;
	}
//?��?��?�� 찾기 ?��?���?
	@RequestMapping(value = "/findid", method = RequestMethod.GET)
	public String getFindId() {
		// System.out.println("findid Call");

		return "/user/findid";
	}
//?��?��?�� 찾기
	@RequestMapping(value = "/findidAjax")
	@ResponseBody
	public String findId(@RequestParam Map<String, Object> memberMap) throws Exception {
		//System.out.println(memberMap);
		
		MemberVo memberVo = memberService.findId(memberMap);
		String result = "";

		if(memberVo != null) {
			String res = memberVo.getUserId();
		
			if (res.equals(null)) {
				return "/user/login";
			} else {
				result = memberVo.getUserId();
			}
		}
		return result;
	
	}
//비�?번호 찾기 ?��?���?
	@RequestMapping(value = "/findpw", method = RequestMethod.GET)
	public String getFindPw() {
		// System.out.println("findpw Call");

		return "/user/findpw";
	}
//비�?번호 찾기
	@RequestMapping(value = "/findpwAjax")
	@ResponseBody
	public String FindPw(@RequestParam Map<String, Object> memberMap) throws Exception {
		
		MemberVo memberVo = memberService.findPw(memberMap);
		String result = "";

		if(memberVo != null) {
			String res = memberVo.getUserPw();
		
			if (res.equals(null)) {
				return "null";
			} else {
				result = memberVo.getUserPw();
			}
		}
		return result;
	}
	//비�?번호 �?�?
	@RequestMapping("/pwModify")
	public ModelAndView modifyPw(MemberVo memberVo) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		int res = memberService.modifyPw(memberVo);
		
		if (res < 0) {
			System.out.println("비�?번호 ?��?�� ?��?��");
			mav.setViewName("redirect:findpw");
		} else {
			System.out.println("비�?번호 ?��?�� ?���?");
			mav.setViewName("redirect:login");
		}
		
		return mav;
	}
	
	
	//메일발송
	@RequestMapping("/send")
	public ModelAndView joinEmailCheck(String email, int code_check) throws MailException {

		ModelAndView mav = new ModelAndView();

		memberService.mailSending(email, code_check);

		System.out.println("메일 발송 ?���?");
		

		return mav;
	}


	

	// ?��?�� ?��?�� get
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String memberDeleteView() throws Exception {
		return "user/delete";
	}

	// ?��?�� ?��?�� post
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String Delete(MemberVo memberVo, HttpSession session, RedirectAttributes rttr) throws Exception {

		// ?��?��?�� ?��?�� member�? �??��?? member�??��?�� ?��?��줍니?��.
		MemberVo user = (MemberVo) session.getAttribute("user");
		// ?��?��?��?��?�� 비�?번호
		String sessionPass = user.getUserPw();
		// vo�? ?��?��?��?�� 비�?번호
		String voPass = memberVo.getUserPw();

		if (!(sessionPass.equals(voPass))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/delete";
		}
		memberService.delete(memberVo);
		session.invalidate();
		return "redirect:/";
	}
}