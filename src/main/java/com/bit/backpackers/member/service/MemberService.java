package com.bit.backpackers.member.service;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.Member;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.mail.javamail.JavaMailSender;

import com.bit.backpackers.member.model.entity.LoginDTO;
import com.bit.backpackers.member.model.entity.MemberVo;



public interface MemberService {

	   // 회원 가입 처리
    void register(MemberVo memberVo) throws Exception;
	
    MemberVo login(LoginDTO loginDTO) throws Exception;
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