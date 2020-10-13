package com.bit.backpackers.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;

import org.springframework.mail.javamail.JavaMailSender;

import com.bit.backpackers.model.entity.LoginVo;
import com.bit.backpackers.model.entity.MemberVo;



public interface MemberService {

	   // 회원 가입 처리
    void register(MemberVo memberVo) throws Exception;
	
    MemberVo login(LoginVo loginVo) throws Exception;
    //아이디 중복체크   
    int idCheck(MemberVo memberVo) throws Exception;

  //비밀번호 체크    
    int pwCheck(MemberVo memberVo) throws Exception;
    
    //회원탈퇴
    void delete(MemberVo memberVo) throws Exception;
    
    //이메일인증
	void signUp(MemberVo memberVo) throws MessagingException, UnsupportedEncodingException;

	

	void create(MemberVo memberVo) throws Exception;

	void userAuth(String userEmail) throws Exception;

	MemberVo userAuth(MemberVo memberVo);

	void regist(MemberVo memberVo);

	void create(MemberVo memberVo, JavaMailSender mailSender) throws Exception;
}