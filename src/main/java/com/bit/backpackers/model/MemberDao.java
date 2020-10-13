package com.bit.backpackers.model;

import com.bit.backpackers.model.entity.LoginVo;
import com.bit.backpackers.model.entity.MemberVo;

public interface MemberDao {

	// 회원가입 처리
	void register(MemberVo memberVo) throws Exception;

	// 로그인 처리
	MemberVo login(LoginVo loginDTO) throws Exception;

	// 아이디확인
	MemberVo idCheck(String user_id) throws Exception;
}