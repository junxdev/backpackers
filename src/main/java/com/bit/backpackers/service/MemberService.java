package com.bit.backpackers.service;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.Member;
import java.util.Date;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.mail.javamail.JavaMailSender;

import com.bit.backpackers.model.entity.LoginDTO;
import com.bit.backpackers.model.entity.MemberVo;

import common.exception.MailException;



public interface MemberService {

	// ?��?���??�� 처리
    void register(MemberVo memberVo) throws Exception;
    // 로그?�� 처리
    MemberVo login(LoginDTO loginDTO) throws Exception;
    //?��?��?�� 중복체크    
    int idCheck(MemberVo memberVo) throws Exception;
      // ?��?�� ?��?��?�� 찾기
    MemberVo findId(Map<String, Object> memberMap) throws Exception;
    // ?��?�� 비�?번호 찾기
    MemberVo findPw(Map<String, Object> memberMap) throws Exception;
    // 메일 ?��?��
    public void mailSending(String email, int mailCode) throws MailException;
    
    // ?��?��?��?�� 찾기 기능
    public int modifyPw(MemberVo memberVo) throws Exception;
    //?��?��?��?��
    void delete(MemberVo memberVo) throws Exception;
    

	

}