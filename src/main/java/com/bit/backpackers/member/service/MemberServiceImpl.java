package com.bit.backpackers.member.service;

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

import com.bit.backpackers.member.model.MemberDAO;
import com.bit.backpackers.member.model.entity.LoginDTO;
import com.bit.backpackers.member.model.entity.MemberVo;

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
	
	// 회원가입 처리
	@Override
	public void register(MemberVo memberVo) throws Exception {
		memberDAo.register(memberVo);
		
	}
	// 로그인 처리
	@Override
	public MemberVo login(LoginDTO loginDTO) throws Exception {
		 return memberDAo.login(loginDTO);
	}
	
	/*
	 * @Override public MemberVo idCheck(String user_id) throws Exception {
	 * 
	 * return memberDAo.idCheck(user_id); }
	 */
	// �α��� ���� ó��

	
	//아이디 중복체크
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
		// 입력한 이름
		// String userName = (String) memberMap.get("userName");
		// 입력한 이메일
		// String userEmail = (String) memberMap.get("userEmail");

		MemberVo memberVo = memberDAo.findId(memberMap);

		return memberVo;
	}

	@Override
	public MemberVo findPw(Map<String, Object> memberMap) throws Exception {
		MemberVo memberVo = memberDAo.findPw(memberMap);

		// System.out.println("비밀번호는 " + member.getUserPw());

		return memberVo;
	}
	//비밀번호 수정
	@Override
	public int modifyPw(MemberVo memberVo) throws Exception {
		
		String password = memberVo.getUserPw();
		String secPw = "";
		
		if (password.equals(null)) {
			// 개인정보 update
			memberDAo.modifyPw(memberVo);
		} else {
			 System.out.println(password + " 검증");

			// 비밀번호 암호화
			//secPw = passwordEncoder.encode(password);

			// System.out.println(secPw + "비밀번호 암호화 된 거 확인");
			
			// 비밀번호 set
			memberVo.setUserPw(password);
			
			// System.out.println(secPw + " 검증");
		}
		return memberDAo.modifyPw(memberVo);
	}


	//이메일인증
	public void mailSending(String email, int code_check) throws MailException {

		String setfrom = "yoursitup90@gmail.com";
		String tomail = email;
		String title = "이메일 변경 인증메일 입니다.";
		String htmlBody = "<h2> 인증번호를 입력해주세요!</h2>" + " 인증번호는 " + code_check + " 입니다!";

		try {

			mailSender.send(new MimeMessagePreparator() {
				public void prepare(MimeMessage mimeMessage) throws MessagingException {
					MimeMessageHelper message = new MimeMessageHelper(mimeMessage, true, "UTF-8");
					// 보내는 이
					message.setFrom(setfrom);
					// 받는 이
					message.setTo(tomail);
					// 메일 제목
					message.setSubject(title);
					// 메일 내용
					// 두번째 boolean값은 html 여부 (true : html , false : text)
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
