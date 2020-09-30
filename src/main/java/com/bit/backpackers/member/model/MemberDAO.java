package com.bit.backpackers.member.model;

import org.apache.ibatis.javassist.compiler.ast.Member;

import com.bit.backpackers.member.model.entity.MemberVo;



public interface MemberDAO {

	// ȸ������ ó��
    void register(MemberVo memberVo) throws Exception;
    
 // �α��� ó��
    MemberVo login(LoginDTO loginDTO) throws Exception;
    
    //���̵�Ȯ��
    
    MemberVo idCheck(String user_id) throws Exception;
}
