package com.bit.backpackers.member.service;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.Member;
import java.util.Date;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.mail.javamail.JavaMailSender;

import com.bit.backpackers.member.model.entity.LoginDTO;
import com.bit.backpackers.member.model.entity.MemberVo;

import common.exception.MailException;



public interface MemberService {

	// 회원가입 처리
    void register(MemberVo memberVo) throws Exception;
    // 로그인 처리
    MemberVo login(LoginDTO loginDTO) throws Exception;
    //아이디 중복체크    
    int idCheck(MemberVo memberVo) throws Exception;
      // 회원 아이디 찾기
    MemberVo findId(Map<String, Object> memberMap) throws Exception;
    // 회원 비밀번호 찾기
    MemberVo findPw(Map<String, Object> memberMap) throws Exception;
    // 메일 전송
    public void mailSending(String email, int mailCode) throws MailException;
    
    // 패스워드 찾기 기능
    public int modifyPw(MemberVo memberVo) throws Exception;
    //회원탈퇴
    void delete(MemberVo memberVo) throws Exception;
    

	

}