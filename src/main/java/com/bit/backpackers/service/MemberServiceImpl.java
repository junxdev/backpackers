package com.bit.backpackers.service;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Map;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.compiler.ast.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bit.backpackers.model.MemberDAO;
import com.bit.backpackers.model.entity.LoginDTO;
import com.bit.backpackers.model.entity.MemberVo;

import common.exception.MailException;




@Service
public class MemberServiceImpl implements MemberService {

	private final MemberDAO memberDAo;
	
	@Autowired
	JavaMailSender mailSender;
	
	@Autowired
	//BCryptPasswordEncoder passwordEncoder;
	
	public MemberServiceImpl(MemberDAO memberDAo) {
	this.memberDAo=memberDAo;
	}
	
	// ?šŒ?›ê°??… ì²˜ë¦¬
	@Override
	public void register(MemberVo memberVo) throws Exception {
		memberDAo.register(memberVo);
		
	}
	// ë¡œê·¸?¸ ì²˜ë¦¬
	@Override
	public MemberVo login(LoginDTO loginDTO) throws Exception {
		 return memberDAo.login(loginDTO);
	}
	
	/*
	 * @Override public MemberVo idCheck(String user_id) throws Exception {
	 * 
	 * return memberDAo.idCheck(user_id); }
	 */
	// ï¿½Î±ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ Ã³ï¿½ï¿½

	
	//?•„?´?”” ì¤‘ë³µì²´í¬
	@Override
	public int idCheck(MemberVo memberVo) throws Exception {
		MemberVo bean = memberDAo.idCheck(memberVo);
		int result = 0;
		if(bean != null) {
			result = 1;
		}
		return result;
	}


	@Override
	public MemberVo findId(Map<String, Object> memberMap) throws Exception {
		// ?…? ¥?•œ ?´ë¦?
		// String userName = (String) memberMap.get("userName");
		// ?…? ¥?•œ ?´ë©”ì¼
		// String userEmail = (String) memberMap.get("userEmail");

		MemberVo memberVo = memberDAo.findId(memberMap);

		return memberVo;
	}

	@Override
	public MemberVo findPw(Map<String, Object> memberMap) throws Exception {
		MemberVo memberVo = memberDAo.findPw(memberMap);

		// System.out.println("ë¹„ë?ë²ˆí˜¸?Š” " + member.getUserPw());

		return memberVo;
	}
	//ë¹„ë?ë²ˆí˜¸ ?ˆ˜? •
	@Override
	public int modifyPw(MemberVo memberVo) throws Exception {
		
		String password = memberVo.getUserPw();
		String secPw = "";
		
		if (password.equals(null)) {
			// ê°œì¸? •ë³? update
			memberDAo.modifyPw(memberVo);
		} else {
			 System.out.println(password + " ê²?ì¦?");

			// ë¹„ë?ë²ˆí˜¸ ?•”?˜¸?™”
			//secPw = passwordEncoder.encode(password);

			// System.out.println(secPw + "ë¹„ë?ë²ˆí˜¸ ?•”?˜¸?™” ?œ ê±? ?™•?¸");
			
			// ë¹„ë?ë²ˆí˜¸ set
			memberVo.setUserPw(password);
			
			// System.out.println(secPw + " ê²?ì¦?");
		}
		return memberDAo.modifyPw(memberVo);
	}


	//?´ë©”ì¼?¸ì¦?
	public void mailSending(String email, int code_check) throws MailException {

		String setfrom = "yoursitup90@gmail.com";
		String tomail = email;
		String title = "?´ë©”ì¼ ë³?ê²? ?¸ì¦ë©”?¼ ?…?‹ˆ?‹¤.";
		String htmlBody = "<h2> ?¸ì¦ë²ˆ?˜¸ë¥? ?…? ¥?•´ì£¼ì„¸?š”!</h2>" + " ?¸ì¦ë²ˆ?˜¸?Š” " + code_check + " ?…?‹ˆ?‹¤!";

		try {

			mailSender.send(new MimeMessagePreparator() {
				public void prepare(MimeMessage mimeMessage) throws MessagingException {
					MimeMessageHelper message = new MimeMessageHelper(mimeMessage, true, "UTF-8");
					// ë³´ë‚´?Š” ?´
					message.setFrom(setfrom);
					// ë°›ëŠ” ?´
					message.setTo(tomail);
					// ë©”ì¼ ? œëª?
					message.setSubject(title);
					// ë©”ì¼ ?‚´?š©
					// ?‘ë²ˆì§¸ booleanê°’ì? html ?—¬ë¶? (true : html , false : text)
					message.setText(htmlBody, true);
				};
			});
		} catch (Exception e) {
			e.printStackTrace();
			throw new MailException("M_ERROR_01");

		}
	}


	@Override
	public void delete(MemberVo memberVo) throws Exception {
		memberDAo.delete(memberVo);
		
	}





}
