package com.bit.backpackers.member.controller;

import java.lang.reflect.Member;
import java.util.Date;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bit.backpackers.member.model.entity.LoginDTO;
import com.bit.backpackers.member.model.entity.MemberVo;
import com.bit.backpackers.member.service.MemberService;

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

	// 로그인 페이지
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET(@ModelAttribute("loginDTO") LoginDTO loginDTO) {
		logger.info("login");
		return "/user/login";
	}

	// 로그인 처리
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public String loginPOST(@ModelAttribute LoginDTO loginDTO, HttpSession httpSession, RedirectAttributes rttr)
			throws Exception {
		logger.info("loginPost");
		MemberVo user = memberService.login(loginDTO);

		if (user != null) {
			System.out.println("로그인 성공");
			httpSession.setAttribute("user", user);
			return "redirect:/";
		} else {
			System.out.println("로그인 실패");
			httpSession.setAttribute("user", null);
			// rttr.addFlashAttribute("msg", false);
			return "user/loginPost";
		}
	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {

		session.invalidate();

		return "redirect:/";
	}

	// user마이 페이지
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public String mypage(@ModelAttribute("loginDTO") LoginDTO loginDTO) throws Exception {
		logger.info("user Login");
		return "/user/myPage";
	}

	// 회원가입 페이지
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerGET() throws Exception {
		System.out.println("00000001");
		return "user/register";
	}

	// 회원가입 처리
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

	// �븘�씠�뵒 以묐났 泥댄겕
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public int idCheck(@ModelAttribute MemberVo memberVo) throws Exception {
		int result = memberService.idCheck(memberVo);
		System.out.println("login check");
		return result;
	}
//�븘�씠�뵒 李얘린 �럹�씠吏�
	@RequestMapping(value = "/findid", method = RequestMethod.GET)
	public String getFindId() {
		// System.out.println("findid Call");

		return "/user/findid";
	}
//�븘�씠�뵒 李얘린
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
//鍮꾨�踰덊샇 李얘린 �럹�씠吏�
	@RequestMapping(value = "/findpw", method = RequestMethod.GET)
	public String getFindPw() {
		// System.out.println("findpw Call");

		return "/user/findpw";
	}
//鍮꾨�踰덊샇 李얘린
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
	//鍮꾨�踰덊샇 蹂�寃�
	@RequestMapping("/pwModify")
	public ModelAndView modifyPw(MemberVo memberVo) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		int res = memberService.modifyPw(memberVo);
		
		if (res < 0) {
			System.out.println("鍮꾨�踰덊샇 �닔�젙 �떎�뙣");
			mav.setViewName("redirect:findpw");
		} else {
			System.out.println("鍮꾨�踰덊샇 �닔�젙 �꽦怨�");
			mav.setViewName("redirect:login");
		}
		
		return mav;
	}
	
	
	//硫붿씪諛쒖넚
	@RequestMapping("/send")
	public ModelAndView joinEmailCheck(String email, int code_check) throws MailException {

		ModelAndView mav = new ModelAndView();

		memberService.mailSending(email, code_check);

		System.out.println("硫붿씪 諛쒖넚 �꽦怨�");
		

		return mav;
	}


	

	// �쉶�썝 �깉�눜 get
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String memberDeleteView() throws Exception {
		return "user/delete";
	}

	// �쉶�썝 �깉�눜 post
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String Delete(MemberVo memberVo, HttpSession session, RedirectAttributes rttr) throws Exception {

		// �꽭�뀡�뿉 �엳�뒗 member瑜� 媛��졇�� member蹂��닔�뿉 �꽔�뼱以띾땲�떎.
		MemberVo user = (MemberVo) session.getAttribute("user");
		// �꽭�뀡�뿉�엳�뒗 鍮꾨�踰덊샇
		String sessionPass = user.getUserPw();
		// vo濡� �뱾�뼱�삤�뒗 鍮꾨�踰덊샇
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