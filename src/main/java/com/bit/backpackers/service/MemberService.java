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

	// ?šŒ?›ê°??… ì²˜ë¦¬
    void register(MemberVo memberVo) throws Exception;
    // ë¡œê·¸?¸ ì²˜ë¦¬
    MemberVo login(LoginDTO loginDTO) throws Exception;
    //?•„?´?”” ì¤‘ë³µì²´í¬    
    int idCheck(MemberVo memberVo) throws Exception;
      // ?šŒ?› ?•„?´?”” ì°¾ê¸°
    MemberVo findId(Map<String, Object> memberMap) throws Exception;
    // ?šŒ?› ë¹„ë?ë²ˆí˜¸ ì°¾ê¸°
    MemberVo findPw(Map<String, Object> memberMap) throws Exception;
    // ë©”ì¼ ? „?†¡
    public void mailSending(String email, int mailCode) throws MailException;
    
    // ?Œ¨?Š¤?›Œ?“œ ì°¾ê¸° ê¸°ëŠ¥
    public int modifyPw(MemberVo memberVo) throws Exception;
    //?šŒ?›?ƒˆ?‡´
    void delete(MemberVo memberVo) throws Exception;
    

	

}