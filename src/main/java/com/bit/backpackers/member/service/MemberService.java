package com.bit.backpackers.member.service;

import java.lang.reflect.Member;

import javax.servlet.http.HttpSession;

import com.bit.backpackers.member.model.LoginDTO;
import com.bit.backpackers.member.model.entity.MemberVo;



public interface MemberService {

	   // 회원 가입 처리
    void register(MemberVo memberVo) throws Exception;
	
    MemberVo login(LoginDTO loginDTO) throws Exception;

    MemberVo idCheck(String user_id) throws Exception;

	
}