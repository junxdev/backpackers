package com.bit.backpackers.member.service;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.Member;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.mail.javamail.JavaMailSender;

import com.bit.backpackers.member.model.entity.LoginDTO;
import com.bit.backpackers.member.model.entity.MemberVo;



public interface MemberService {

	   // ȸ�� ���� ó��
    void register(MemberVo memberVo) throws Exception;
	
    MemberVo login(LoginDTO loginDTO) throws Exception;
    //���̵� �ߺ�üũ   
    int idCheck(MemberVo memberVo) throws Exception;

  //��й�ȣ üũ    
    int pwCheck(MemberVo memberVo) throws Exception;
    
    //ȸ��Ż��
    void delete(MemberVo memberVo) throws Exception;
    
    //�̸�������
	void signUp(MemberVo memberVo) throws MessagingException, UnsupportedEncodingException;

	

	void create(MemberVo memberVo) throws Exception;

	void userAuth(String userEmail) throws Exception;

	MemberVo userAuth(MemberVo memberVo);

	void regist(MemberVo memberVo);

	void create(MemberVo memberVo, JavaMailSender mailSender) throws Exception;
}