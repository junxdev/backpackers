package com.bit.backpackers.member.model;

import org.apache.ibatis.javassist.compiler.ast.Member;

import com.bit.backpackers.member.model.entity.LoginDTO;
import com.bit.backpackers.member.model.entity.MemberVo;



public interface MemberDAO {

	// ȸ������ ó��
    void register(MemberVo memberVo) throws Exception;
    
 // �α��� ó��
    MemberVo login(LoginDTO loginDTO) throws Exception;
    
    //���̵� �ߺ�üũ    
    int idCheck(MemberVo memberVo) throws Exception;
    
    
    //��й�ȣ üũ    
    int pwCheck(MemberVo memberVo) throws Exception;
    
    // ȸ�� Ż��
 	public void delete(MemberVo memberVo)throws Exception;

	void createAuthKey(String userEmail, String authKey) throws Exception;

	void userAuth(String userEmail) throws Exception;

	void create(MemberVo memberVo);


    
}
