package com.bit.backpackers.member.model;

import org.apache.ibatis.javassist.compiler.ast.Member;

import com.bit.backpackers.member.model.entity.MemberVo;



public interface MemberDAO {

	// 회원가입 처리
    void register(MemberVo memberVo) throws Exception;
    
 // 로그인 처리
    MemberVo login(LoginDTO loginDTO) throws Exception;
    
    //아이디확인
    
    MemberVo idCheck(String user_id) throws Exception;
}
