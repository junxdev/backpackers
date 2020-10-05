package com.bit.backpackers.member.service;

import java.io.UnsupportedEncodingException;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.compiler.ast.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bit.backpackers.member.mail.MailHandler;
import com.bit.backpackers.member.mail.TempKey;
import com.bit.backpackers.member.model.MemberDAO;
import com.bit.backpackers.member.model.entity.LoginDTO;
import com.bit.backpackers.member.model.entity.MemberVo;




@Service
public class MemberServiceImpl implements MemberService {

	private final MemberDAO memberDAo;
	
	public MemberServiceImpl(MemberDAO memberDAo) {
	this.memberDAo=memberDAo;
	}
	
	 // ȸ�� ���� ó��
	@Override
	public void register(MemberVo memberVo) throws Exception {
		memberDAo.register(memberVo);
		
	}

	@Override
	public MemberVo login(LoginDTO loginDTO) throws Exception {
		 return memberDAo.login(loginDTO);
	}

	/*
	 * @Override public MemberVo idCheck(String user_id) throws Exception {
	 * 
	 * return memberDAo.idCheck(user_id); }
	 */

	@Override
	public int idCheck(MemberVo memberVo) throws Exception {
		int result = memberDAo.idCheck(memberVo);
		return result;
	}

	@Override
	public int pwCheck(MemberVo memberVo) throws Exception {
		int result = memberDAo.pwCheck(memberVo);
		return result;
	}

	@Override
	public void delete(MemberVo memberVo) throws Exception {
		memberDAo.delete(memberVo);
		
	}

	@Transactional
	@Override 
	public void create(MemberVo memberVo, JavaMailSender mailSender) throws Exception {
		memberDAo.create(memberVo); // ȸ������ DAO
		String key = new TempKey().getKey(50, false); // ����Ű ����
		memberDAo.createAuthKey(memberVo.getUserEmail(), key); // ����Ű DB����
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[Ȩ������ �̸��� ����]"); // ��������
		sendMail.setText( // ���ϳ���
				"<h1>��������</h1>" +
				"<a href='http://localhost/user/emailConfirm?userEmail=" + memberVo.getUserEmail() +
				"&key=" + key +
				"' target='_blenk'>�̸��� ���� Ȯ��</a>");
		sendMail.setFrom("���̵�@gmail.com", "������� �̸�"); // ������
		sendMail.setTo(memberVo.getUserEmail()); // �޴���
		sendMail.send();
	}

	@Override
	public void userAuth(String userEmail) throws Exception {
		memberDAo.userAuth(userEmail);
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
