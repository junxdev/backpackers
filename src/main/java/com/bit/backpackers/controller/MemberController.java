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

	// Î°úÍ∑∏?ù∏ ?éò?ù¥Ïß?
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET(@ModelAttribute("loginDTO") LoginDTO loginDTO) {
		logger.info("login");
		return "/user/login";
	}

	// Î°úÍ∑∏?ù∏ Ï≤òÎ¶¨
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public String loginPOST(@ModelAttribute LoginDTO loginDTO, HttpSession httpSession, RedirectAttributes rttr)
			throws Exception {
		logger.info("loginPost");
		MemberVo user = memberService.login(loginDTO);

		if (user != null) {
			System.out.println("∑Œ±◊¿Œ º∫∞¯");
			httpSession.setAttribute("user", user);
			httpSession.setAttribute("username",loginDTO.getUserId());
			// Î°úÍ∑∏?ù∏ ?ú†Ïß?Î•? ?Ñ†?Éù?ï† Í≤ΩÏö∞
			return "redirect:/";
		} else {
			System.out.println("Î°úÍ∑∏?ù∏ ?ã§?å®");
			httpSession.setAttribute("user", null);
			// rttr.addFlashAttribute("msg", false);
			return "user/loginPost";
		}
	}

	// Î°úÍ∑∏?ïÑ?õÉ
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {

		session.invalidate();

		return "redirect:/";
	}

	// userÎßàÏù¥ ?éò?ù¥Ïß?
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public String mypage(@ModelAttribute("loginDTO") LoginDTO loginDTO) throws Exception {
		logger.info("user Login");
		return "/user/myPage";
	}

	// ?öå?õêÍ∞??ûÖ ?éò?ù¥Ïß?
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerGET() throws Exception {
		System.out.println("00000001");
		return "user/register";
	}

	// ?öå?õêÍ∞??ûÖ Ï≤òÎ¶¨
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

	// ?ïÑ?ù¥?îî Ï§ëÎ≥µ Ï≤¥ÌÅ¨
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public int idCheck(@ModelAttribute MemberVo memberVo) throws Exception {
		int result = memberService.idCheck(memberVo);
		System.out.println("login check");
		return result;
	}
//?ïÑ?ù¥?îî Ï∞æÍ∏∞ ?éò?ù¥Ïß?
	@RequestMapping(value = "/findid", method = RequestMethod.GET)
	public String getFindId() {
		// System.out.println("findid Call");

		return "/user/findid";
	}
//?ïÑ?ù¥?îî Ï∞æÍ∏∞
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
//ÎπÑÎ?Î≤àÌò∏ Ï∞æÍ∏∞ ?éò?ù¥Ïß?
	@RequestMapping(value = "/findpw", method = RequestMethod.GET)
	public String getFindPw() {
		// System.out.println("findpw Call");

		return "/user/findpw";
	}
//ÎπÑÎ?Î≤àÌò∏ Ï∞æÍ∏∞
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
	//ÎπÑÎ?Î≤àÌò∏ Î≥?Í≤?
	@RequestMapping("/pwModify")
	public ModelAndView modifyPw(MemberVo memberVo) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		int res = memberService.modifyPw(memberVo);
		
		if (res < 0) {
			System.out.println("ÎπÑÎ?Î≤àÌò∏ ?àò?†ï ?ã§?å®");
			mav.setViewName("redirect:findpw");
		} else {
			System.out.println("ÎπÑÎ?Î≤àÌò∏ ?àò?†ï ?Ñ±Í≥?");
			mav.setViewName("redirect:login");
		}
		
		return mav;
	}
	
	
	//Î©îÏùºÎ∞úÏÜ°
	@RequestMapping("/send")
	public ModelAndView joinEmailCheck(String email, int code_check) throws MailException {

		ModelAndView mav = new ModelAndView();

		memberService.mailSending(email, code_check);

		System.out.println("Î©îÏùº Î∞úÏÜ° ?Ñ±Í≥?");
		

		return mav;
	}


	

	// ?öå?õê ?Éà?á¥ get
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String memberDeleteView() throws Exception {
		return "user/delete";
	}

	// ?öå?õê ?Éà?á¥ post
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String Delete(MemberVo memberVo, HttpSession session, RedirectAttributes rttr) throws Exception {

		// ?Ñ∏?Öò?óê ?ûà?äî memberÎ•? Í∞??†∏?? memberÎ≥??àò?óê ?Ñ£?ñ¥Ï§çÎãà?ã§.
		MemberVo user = (MemberVo) session.getAttribute("user");
		// ?Ñ∏?Öò?óê?ûà?äî ÎπÑÎ?Î≤àÌò∏
		String sessionPass = user.getUserPw();
		// voÎ°? ?ì§?ñ¥?ò§?äî ÎπÑÎ?Î≤àÌò∏
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