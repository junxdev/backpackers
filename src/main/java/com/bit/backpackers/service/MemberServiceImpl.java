package com.bit.backpackers.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bit.backpackers.mail.MailHandler;
import com.bit.backpackers.mail.TempKey;
import com.bit.backpackers.model.MemberDao;
import com.bit.backpackers.model.entity.LoginVo;
import com.bit.backpackers.model.entity.MemberVo;




@Service
public class MemberServiceImpl implements MemberService {

	private final MemberDao memberDao;
	
	public MemberServiceImpl(MemberDao memberDao) {
	this.memberDao=memberDao;
	}
	
	 // 회원 가입 처리
	@Override
	public void register(MemberVo memberVo) throws Exception {
		memberDao.register(memberVo);
		
	}

	@Override
	public MemberVo login(LoginVo loginVo) throws Exception {
		 return memberDao.login(loginVo);
	}

	/*
	 * @Override public MemberVo idCheck(String user_id) throws Exception {
	 * 
	 * return memberDAo.idCheck(user_id); }
	 */

	@Override
	public int idCheck(MemberVo memberVo) throws Exception {
		int result = memberDao.idCheck(memberVo);
		return result;
	}

	@Override
	public int pwCheck(MemberVo memberVo) throws Exception {
		int result = memberDao.pwCheck(memberVo);
		return result;
	}

	@Override
	public void delete(MemberVo memberVo) throws Exception {
		memberDao.delete(memberVo);
		
	}

	@Transactional
	@Override 
	public void create(MemberVo memberVo, JavaMailSender mailSender) throws Exception {
		memberDao.create(memberVo); // 회원가입 DAO
		String key = new TempKey().getKey(50, false); // 인증키 생성
		memberDao.createAuthKey(memberVo.getUserEmail(), key); // 인증키 DB저장
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[홈페이지 이메일 인증]"); // 메일제목
		sendMail.setText( // 메일내용
				"<h1>메일인증</h1>" +
				"<a href='http://localhost/user/emailConfirm?userEmail=" + memberVo.getUserEmail() +
				"&key=" + key +
				"' target='_blenk'>이메일 인증 확인</a>");
		sendMail.setFrom("아이디@gmail.com", "보낼사람 이름"); // 보낸이
		sendMail.setTo(memberVo.getUserEmail()); // 받는이
		sendMail.send();
	}

	@Override
	public void userAuth(String userEmail) throws Exception {
		memberDao.userAuth(userEmail);
	}

	@Override
	public void signUp(MemberVo memberVo) throws MessagingException, UnsupportedEncodingException {
		// TODO Auto-generated method stub
		
	}



	@Override
	public MemberVo userAuth(MemberVo memberVo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void regist(MemberVo memberVo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void create(MemberVo memberVo) throws Exception {
		// TODO Auto-generated method stub
		
	}

}