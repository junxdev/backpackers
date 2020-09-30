package com.bit.backpackers.member.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.compiler.ast.Member;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bit.backpackers.member.model.LoginDTO;
import com.bit.backpackers.member.model.MemberDAO;
import com.bit.backpackers.member.model.entity.MemberVo;




@Service
public class MemberServiceImpl implements MemberService {

	private final MemberDAO memberDAo;
	
	public MemberServiceImpl(MemberDAO memberDAo) {
	this.memberDAo=memberDAo;
	}
	
	 // 회원 가입 처리
	@Override
	public void register(MemberVo memberVo) throws Exception {
		memberDAo.register(memberVo);
		
	}

	@Override
	public MemberVo login(LoginDTO loginDTO) throws Exception {
		 return memberDAo.login(loginDTO);
	}

	@Override
	public MemberVo idCheck(String user_id) throws Exception {
		
		return memberDAo.idCheck(user_id);
	}






}
