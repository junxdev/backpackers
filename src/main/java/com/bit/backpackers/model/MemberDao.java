package com.bit.backpackers.model;

import com.bit.backpackers.model.entity.LoginVo;
import com.bit.backpackers.model.entity.MemberVo;

public interface MemberDao {

	// ȸ������ ó��
	void register(MemberVo memberVo) throws Exception;

	// �α��� ó��
	MemberVo login(LoginVo loginDTO) throws Exception;

	// ���̵�Ȯ��
	MemberVo idCheck(String user_id) throws Exception;
}