package com.bit.backpackers.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bit.backpackers.model.entity.LoginVo;
import com.bit.backpackers.model.entity.MemberVo;
import com.bit.backpackers.service.MemberService;

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
	public String loginGET(@ModelAttribute("LoginVo") LoginVo loginVo) {
		logger.info("login");
		return "/user/login";
	}
	// 로그인 처리
	 @RequestMapping(value = "/loginPost", method = RequestMethod.POST) 
	 public String loginPOST(@ModelAttribute LoginVo loginVo, HttpSession httpSession,RedirectAttributes rttr) throws Exception { 
		 logger.info("loginPost");
		MemberVo memberVo = memberService.login(LoginVo);
	 	
		if(memberVo != null) {
			System.out.println("로그인 성공");
			httpSession.setAttribute("user", memberVo);
			return "redirect:/";
		}
		System.out.println("로그인 실패");
		httpSession.setAttribute("user", null);
		rttr.addFlashAttribute("msg", false);
		return "user/loginPost";
	 }

	 //로그아웃
	 @RequestMapping(value = "/logout", method = RequestMethod.GET)
		public String logout(HttpSession session) throws Exception{
			
			session.invalidate();
			
			return "redirect:/";
		}
		// 마이 페이지
		@RequestMapping(value = "/myPage", method = RequestMethod.GET)
		public String mypage(@ModelAttribute("LoginVo") LoginVo loginVo)throws Exception {
			logger.info("admin Login");
			return "/user/myPage";
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
	
	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value="/idCheck", method = RequestMethod.POST)
	public int idCheck(MemberVo memberVo) throws Exception {
		int result = memberService.idCheck(memberVo);
		System.out.println("login check");
		return result;
	}
	
	// 패스워드 체크
		@ResponseBody
		@RequestMapping(value="/pwCheck", method = RequestMethod.POST)
		public int pwCheck(MemberVo memberVo) throws Exception {
			int result = memberService.pwCheck(memberVo);
			System.out.println("password check");
			return result;
		}
		
		// 회원 탈퇴 get
		@RequestMapping(value="/delete", method = RequestMethod.GET)
		public String memberDeleteView() throws Exception{
			return "user/delete";
		}
		
		// 회원 탈퇴 post
		@RequestMapping(value="/delete", method = RequestMethod.POST)
		public String Delete(MemberVo memberVo, HttpSession session, RedirectAttributes rttr) throws Exception{
			
			// 세션에 있는 member를 가져와 member변수에 넣어줍니다.
			MemberVo user = (MemberVo)session.getAttribute("user");
			// 세션에있는 비밀번호
			String sessionPass = user.getUserPw();
			// vo로 들어오는 비밀번호
			String voPass = memberVo.getUserPw();
			
			if(!(sessionPass.equals(voPass))) {
				rttr.addFlashAttribute("msg", false);
				return "redirect:/delete";
			}
			memberService.delete(memberVo);
			session.invalidate();
			return "redirect:/";
		}
	

	/*
	 * // 회원 아이디 중복체크
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "/idCheck", method = RequestMethod.POST) public int
	 * postIdCheck(HttpServletRequest req) throws Exception {
	 * System.err.println("idcheck11"); logger.info("post idCheck");
	 * 
	 * String userId = req.getParameter("userId"); MemberVo idCheck =
	 * memberService.idCheck(userId);
	 * 
	 * int result = 0;
	 * 
	 * if (idCheck != null) { result = 1; }
	 * 
	 * return result; }
	 */
		//이메일인증 
		//@RequestMapping(value = "/register", method = RequestMethod.POST)
	    public String RegisterPost(MemberVo memberVo,Model model,RedirectAttributes rttr) throws Exception{
	    
	        System.out.println("regesterPost 진입 ");
	        memberService.regist(memberVo);
	        rttr.addFlashAttribute("msg" , "가입시 사용한 이메일로 인증해주세요");
	        return "redirect:/";
	    }

	    //이메일 인증 코드 검증
	    //@RequestMapping(value = "/emailConfirm", method = RequestMethod.GET)
	    public String emailConfirm(MemberVo memberVo,Model model,RedirectAttributes rttr) throws Exception { 
	        
	        System.out.println("cont get user"+memberVo);
	        MemberVo vo = new MemberVo();
	        vo=memberService.userAuth(memberVo);
	        if(vo == null) {
	            rttr.addFlashAttribute("msg" , "비정상적인 접근 입니다. 다시 인증해 주세요");
	            return "redirect:/";
	        }
	        //System.out.println("usercontroller vo =" +vo);
	        model.addAttribute("login",vo);
	        return "/user/emailConfirm";
	    }

}
