package com.bit.backpackers.model;

import java.util.Date;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.javassist.compiler.ast.Member;

import com.bit.backpackers.model.entity.LoginDTO;
import com.bit.backpackers.model.entity.MemberVo;



public interface MemberDAO {

	// ?��?���??�� 처리
    void register(MemberVo memberVo) throws Exception;
    
    // 로그?�� 처리
    MemberVo login(LoginDTO loginDTO) throws Exception;
    
  //?��?��?�� 중복체크 
    MemberVo idCheck(MemberVo memberVo) throws Exception;

        // ?��?�� ?��?��?�� 찾기
    MemberVo findId(Map<String, Object> memberMap)throws Exception;
        // ?��?�� 비�?번호 찾기
    MemberVo findPw(Map<String, Object> memberMap)throws Exception;
    // ?��?�� 비�?번호 �?�?
    int modifyPw(MemberVo memberVo)throws Exception;

    
    //?��?��?��?��
 	public void delete(MemberVo memberVo)throws Exception;



    
}
