package com.bit.backpackers.member.model;

import org.apache.ibatis.javassist.compiler.ast.Member;

import com.bit.backpackers.member.model.entity.LoginDTO;
import com.bit.backpackers.member.model.entity.MemberVo;



public interface MemberDAO {

	// 회원가입 처리
    void register(MemberVo memberVo) throws Exception;
    
 // 로그인 처리
    MemberVo login(LoginDTO loginDTO) throws Exception;
    
    //아이디 중복체크    
    int idCheck(MemberVo memberVo) throws Exception;
    
    
    //비밀번호 체크    
    int pwCheck(MemberVo memberVo) throws Exception;
    
    // 회원 탈퇴
 	public void delete(MemberVo memberVo)throws Exception;

	void createAuthKey(String userEmail, String authKey) throws Exception;

	void userAuth(String userEmail) throws Exception;

	void create(MemberVo memberVo);


    
}
